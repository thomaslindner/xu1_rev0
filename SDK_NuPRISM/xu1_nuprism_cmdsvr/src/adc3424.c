/*
 * adc3424.c
 *
 *  Created on: Apr 1, 2020
 *      Author: rypay
 */

/***************************** Include Files *********************************/
#include "adc3424.h"


/************************** Variable Definitions *****************************/

/*
 * The instances to support the device drivers are global such that they
 * are initialized to zero each time the program runs. They could be local
 * but should at least be static so they are zeroed.
 */

static XSpiPs SpiInstance;

volatile u8 adc_has_reset    = !ADC_RST_COMPLETE;
volatile u8 adc_power_status = ADC_POWER_UP;
volatile u8 adc_spi_ready = 0;
volatile u8 adc_gpio_ready = 0;
volatile u8 adc_ready[ADC4_SPI_SELECT+1] = {0,0,0,0,0};

u16 adc_init_cfg_addr [] = {0x1, 0x3, 0x4, 0x5, 0x6, 0x7, 0x9, 0xa, 0xb, 0xe, 0xf, 0x13, 0x15, 0x25, 0x27,
						   0x11d, 0x122, 0x134, 0x139, 0x21d, 0x222, 0x234, 0x239, 0x308, 0x41d, 0x422,
						   0x434, 0x439, 0x51d, 0x522, 0x534, 0x539, 0x608, 0x70a};

u8 adc_init_cfg_data [] =  {0xFF, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
						   0x0, 0x2, 0x28, 0x8, 0x0, 0x2, 0x28, 0x8, 0x0, 0x0, 0x2, 0x28, 0x8, 0x0, 0x2,
						   0x28, 0x8, 0x0, 0x1};
/*
 * The following variables are used to read and write to the eeprom and they
 * are global to avoid having large buffers on the stack
 */

u8 ReadBuffer[MAX_DATA + DATA_OFFSET + DUMMY_SIZE];
u8 WriteBuffer[MAX_DATA + DATA_OFFSET];

u8 adc3424_spi_init(){
	int Status;
	u8 *BufferPtr;
	u8 UniqueValue;
	u32 Count;
	u32 MaxSize = MAX_DATA;
	u32 ChipSelect = ADCX_SPI_SELECT;
	XSpiPs_Config *SpiConfig;

	if(adc_spi_ready == ADC_STATUS_NOT_VALID){
		if (XGetPlatform_Info() == XPLAT_ZYNQ_ULTRA_MP) {
			MaxSize = 1024 * 10;
			ChipSelect = ADCX_SPI_SELECT;	/* Device is on CS 0 */
		}

		/*
		 * Initialize the SPI driver so that it's ready to use
		 */
		SpiConfig = XSpiPs_LookupConfig(ADC_SPI_DEVICE_ID);
		if (NULL == SpiConfig) {
			printf("adc spi configuration failed\n");
			return ADC_CMD_FAILURE;
		}

		Status = XSpiPs_CfgInitialize(&SpiInstance, SpiConfig,
						SpiConfig->BaseAddress);
		if (Status != XST_SUCCESS) {
			printf("adc spi configuration failed\n");
			return ADC_CMD_FAILURE;
		}

		/*
		 * Perform a self-test to check hardware build
		 */
		Status = XSpiPs_SelfTest(&SpiInstance);
		if (Status != XST_SUCCESS) {
			printf("adc spi configuration failed\n");
			return ADC_CMD_FAILURE;
		}

		/*
		 * Set the SPI device as a master with manual start and manual
		 * chip select mode options
		 */
		XSpiPs_SetOptions(&SpiInstance, XSPIPS_MANUAL_START_OPTION | \
				XSPIPS_MASTER_OPTION | XSPIPS_FORCE_SSELECT_OPTION);

		/*
		 * Set salve select high
		 */
		XSpiPs_SetSlaveSelect(&SpiInstance, SLAVE_SELECT);

		/*
		 * Set the SPI device pre-scalar to divide by 8
		 */
		XSpiPs_SetClkPrescaler(&SpiInstance, XSPIPS_CLK_PRESCALE_16);

		memset(WriteBuffer, 0x00, sizeof(WriteBuffer));
		memset(ReadBuffer, 0x00, sizeof(ReadBuffer));

		printf("adc spi configured\n");
		adc_spi_ready = ADC_STATUS_VALID;
		return ADC_CMD_SUCCESS;
	} else {
		printf("adc spi configuration previously completed\n");
		return ADC_CMD_SUCCESS;
	}
}

u8 adc3424_init_all(){
	u8 flag = 1;

	if(adc_spi_ready == ADC_STATUS_NOT_VALID){
		printf("configuring adc spi...\n");
		if (adc3424_spi_init() == ADC_CMD_FAILURE){
			return ADC_CMD_FAILURE;
		}
	}

	flag = adc3424_init(ADC0_SPI_SELECT);
	flag = adc3424_init(ADC1_SPI_SELECT);
	flag = adc3424_init(ADC2_SPI_SELECT);
	flag = adc3424_init(ADC3_SPI_SELECT);
	flag = adc3424_init(ADC4_SPI_SELECT);

	return flag;
}

u8 adc3424_set_power(u8 power_setting){
	if (power_setting == ADC_POWER_DOWN){
		printf("powering down all adcs...\n");
		adc_power_status = ADC_POWER_DOWN;
		adc_has_reset 	 = !ADC_RST_COMPLETE;
		return nuprism_gpio_set(ADC_PDN, ADC_POWER_DOWN);
	} else if (power_setting == ADC_POWER_UP){
		printf("powering on all adcs...\n");
		adc_power_status = ADC_POWER_UP;
		return nuprism_gpio_set(ADC_PDN, ADC_POWER_UP);
	} else
		return ADC_CMD_FAILURE;
}

u8 adc3424_rst(){
	u8 flag = ADC_CMD_SUCCESS;
	printf("resetting adcs...\n");

	if(nuprism_gpio_set(ADC_RST, ADC_RST_ACTIVE)){
		usleep(100);
		if(nuprism_gpio_set(ADC_RST, !ADC_RST_ACTIVE)){
			adc_has_reset = ADC_RST_COMPLETE;
			return ADC_CMD_SUCCESS;
		} else {
			return ADC_CMD_FAILURE;
		}
	} else {
		return ADC_CMD_FAILURE;
	}

	return ADC_CMD_FAILURE;
}

u8 adc3424_init(u8 adc_id){

	if(adc_id > ADC_SPI_CS_SIZE){
		printf("invalid adc cs\n");
		return ADC_CMD_FAILURE;
	}

	if(adc_spi_ready == ADC_STATUS_NOT_VALID){
		printf("configuring adc spi\n");
		if (adc3424_spi_init() == ADC_CMD_FAILURE){
			return ADC_CMD_FAILURE;
		}
	}

	if(nuprism_gpio_set(adc_id, ADCX_SPI_SELECT) == ADC_CMD_FAILURE){
		return ADC_CMD_FAILURE;
	}

	for(u32 i = 0; i < sizeof(adc_init_cfg_addr)/sizeof(adc_init_cfg_addr[0]); i++){
		if( spi_write_readvalid(&SpiInstance, adc_init_cfg_addr[i], adc_init_cfg_data[i],
			  WriteBuffer, ReadBuffer) == ADC_CMD_FAILURE) {
			nuprism_gpio_set(adc_id, !ADCX_SPI_SELECT);
			return ADC_CMD_FAILURE;
		}
	}

	if(nuprism_gpio_set(adc_id, !ADCX_SPI_SELECT) == ADC_CMD_FAILURE){
		return ADC_CMD_FAILURE;
	}

	return ADC_CMD_SUCCESS;
}

u8 adc3424_set_mode(u8 adc_mode, u8 adc_id){

	u8 flag = 1;
	//check if cs valid
	if(adc_id > ADC_SPI_CS_SIZE){
		printf("invalid adc cs\n");
		return ADC_CMD_FAILURE;
	}

	//check is spi is ready
	if(adc_spi_ready == ADC_STATUS_NOT_VALID){
		printf("configuring adc spi\n");
		if (adc3424_spi_init() == ADC_CMD_FAILURE){
			return ADC_CMD_FAILURE;
		}
	}

	//chip select
	if(nuprism_gpio_set(adc_id, ADCX_SPI_SELECT) == ADC_CMD_FAILURE){
		return ADC_CMD_FAILURE;
	}

	if(adc_mode == ADC_TEST_MODE_SIN){
		if( spi_write_readvalid(&SpiInstance, ADC_TEST_PATTERN_EN_REG, ADC_TEST_PATTERN_ENABLE, WriteBuffer, ReadBuffer) == ADC_CMD_FAILURE) {
			flag =  ADC_CMD_FAILURE;
		}
		if( spi_write_readvalid(&SpiInstance, ADC_TEST_PATTERN_REG_1, ADC_TEST_PATTERN_SETTING, WriteBuffer, ReadBuffer) == ADC_CMD_FAILURE) {
			flag =  ADC_CMD_FAILURE;
		}
		if( spi_write_readvalid(&SpiInstance, ADC_TEST_PATTERN_REG_2, ADC_TEST_PATTERN_SETTING, WriteBuffer, ReadBuffer) == ADC_CMD_FAILURE) {
			flag =  ADC_CMD_FAILURE;
		}
	} else if (adc_mode == ADC_NOMINAL_MODE){
		if( spi_write_readvalid(&SpiInstance, ADC_TEST_PATTERN_EN_REG, ADC_TEST_PATTERN_DISABLE, WriteBuffer, ReadBuffer) == ADC_CMD_FAILURE) {
			flag =  ADC_CMD_FAILURE;
		}
	} else {
		printf("not a valid mode");
		return ADC_CMD_FAILURE;
	}

	//chip unselect
	if(nuprism_gpio_set(adc_id, !ADCX_SPI_SELECT) == ADC_CMD_FAILURE){
		return ADC_CMD_FAILURE;
	}

	if(flag == ADC_CMD_FAILURE){
		return ADC_CMD_FAILURE;
	}
	return ADC_CMD_SUCCESS;
}

u8 adc3424_set_mode_all(u8 adc_mode){
	u8 flag = 1;

	if(adc_spi_ready == ADC_STATUS_NOT_VALID){
		printf("configuring adc spi...\n");
		if (adc3424_spi_init() == ADC_CMD_FAILURE){
			return ADC_CMD_FAILURE;
		}
	}

	flag = adc3424_set_mode(adc_mode, ADC0_SPI_SELECT);
	flag = adc3424_set_mode(adc_mode, ADC1_SPI_SELECT);
	flag = adc3424_set_mode(adc_mode, ADC2_SPI_SELECT);
	flag = adc3424_set_mode(adc_mode, ADC3_SPI_SELECT);
	flag = adc3424_set_mode(adc_mode, ADC4_SPI_SELECT);

	return flag;
}

u8 adc3424_ss(){
	//check is spi is ready
	if(adc_spi_ready == ADC_STATUS_NOT_VALID){
		printf("configuring adc spi\n");
		if (adc3424_spi_init() == ADC_CMD_FAILURE){
			return ADC_CMD_FAILURE;
		}
	}

	XSpiPs_SetSlaveSelect(&SpiInstance, 0x00);
	return ADC_CMD_SUCCESS;
}

u8 adc3424_nss(){
	//check is spi is ready
	if(adc_spi_ready == ADC_STATUS_NOT_VALID){
		printf("configuring adc spi\n");
		if (adc3424_spi_init() == ADC_CMD_FAILURE){
			return ADC_CMD_FAILURE;
		}
	}

	XSpiPs_SetSlaveSelect(&SpiInstance, 0x01);
	return ADC_CMD_SUCCESS;
}

