/*
 * adc3424.h
 *
 *  Created on: Apr 1, 2020
 *      Author: rypay
 */

#ifndef SRC_ADC3424_H_
#define SRC_ADC3424_H_

/***************************** Include Files *********************************/

#include "xparameters.h"	/* SDK generated parameters */
#include "xplatform_info.h"
#include "xspips.h"		/* SPI device driver */
#include "xil_printf.h"
#include "nuprism_gpio.h"
#include "spi.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define ADC_SPI_DEVICE_ID		XPAR_XSPIPS_0_DEVICE_ID

/* Global Block-Protection Unlock register */
#define GLOBAL_BLK_PROT_UNLK	0x98

/* All SST flash parts have id as 0xBF */
#define SST_FLASH_ID		0xBF

/*
 * The following constants define the offsets within a FlashBuffer data
 * type for each kind of data.  Note that the read data offset is not the
 * same as the write data because the SPI driver is designed to allow full
 * duplex transfers such that the number of bytes received is the number
 * sent and received.
 */

#define COMMAND_OFFSET		0 /* Flash instruction */
#define DATA_OFFSET		4 /* Start of Data for Read/Write */
#define DUMMY_SIZE		1 /* Number of dummy bytes for fast read */
#define RD_ID_SIZE		4 /* Read ID command + 3 bytes ID response */

/*
 * The following constants specify the extra bytes which are sent to the
 * flash on the SPI interface, that are not data, but control information
 * which includes the command and address
 */
#define OVERHEAD_SIZE		4

#define UNIQUE_VALUE		0x05

/*
 * The following constants specify the max amount of data and the size of the
 * the buffer required to hold the data and overhead to transfer the data to
 * and from the flash.
 */
#define MAX_DATA		1024*1024

/*
 * The following constant defines the slave select signal that is used to
 * to select the flash device on the SPI bus, this signal is typically
 * connected to the chip select of the device
 */
#define ADC_STATUS_VALID 	 0x01
#define ADC_STATUS_NOT_VALID 0x00

#define ADC_CMD_SUCCESS 0x01
#define ADC_CMD_FAILURE 0x00

#define ADC_SPI_CS_SIZE	0x04
#define ADC4_SPI_SELECT	0x04
#define ADC3_SPI_SELECT	0x03
#define ADC2_SPI_SELECT	0x02
#define ADC1_SPI_SELECT	0x01
#define ADC0_SPI_SELECT	0x00

#define ADCX_SPI_SELECT 0x00

#define ADC_POWER_DOWN 0x01
#define ADC_POWER_UP   0x00

#define ADC_POWER_DOWN 0x01
#define ADC_POWER_UP   0x00

#define ADC_RST_ACTIVE  0x01
#define ADC_RST_COMPLETE 0x01

#define ADC_TEST_MODE_SIN 0x03
#define ADC_NOMINAL_MODE 0x00

#define ADC_TEST_PATTERN_SETTING 0x33
#define ADC_TEST_PATTERN_REG_1 0x0A
#define ADC_TEST_PATTERN_REG_2 0x0B

#define ADC_TEST_PATTERN_ENABLE 0x02
#define ADC_TEST_PATTERN_DISABLE 0x00
#define ADC_TEST_PATTERN_EN_REG 0x06



u8 adc3424_spi_init(void);
u8 adc3424_init(u8 adc_id);
u8 adc3424_init_all();
u8 adc3424_set_power(u8 power_setting);
u8 adc3424_rst();
u8 adc3424_set_mode(u8 adc_mode, u8 adc_id);
u8 adc3424_set_mode_all(u8 adc_mode);
u8 adc3424_ss();
u8 adc3424_nss();

#endif /* SRC_ADC3424_H_ */
