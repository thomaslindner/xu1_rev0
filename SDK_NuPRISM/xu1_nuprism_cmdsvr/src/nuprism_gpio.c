/*
 * nuprism_gpio.c
 *
 *  Created on: Mar 26, 2020
 *      Author: rypay
 */

#include "xparameters.h"
#include "xgpio.h"
#include "xil_printf.h"

#define GPIO_STATUS_VALID 	 0x01
#define GPIO_STATUS_NOT_VALID 0x00

#define GPIO_CMD_SUCCESS 0x01
#define GPIO_CMD_FAILURE 0x00

#define NUPRISM_CNTL_GPIO XPAR_AXI_GPIO_0_DEVICE_ID

#define NUPRISM_CNTL_GPIO_DIR  0x00000000
#define NUPRISM_CNTL_GPIO_CHAN 0x1

#define NUPRISM_CNTL_GPIO_INIT 0x0000001F

#define NUPRISM_CNTL_MAX_GPIO_VAL 20

volatile u8 cntl_gpio_ready = 0;

XGpio Gpio; /* The Instance of the GPIO Driver */

u8 nuprism_gpio_init(u32 gpio_direction){
	printf("initializing nuprism gpio...\n");
	/* Initialize the GPIO driver */
	int Status;

	Status = XGpio_Initialize(&Gpio, NUPRISM_CNTL_GPIO);
	if (Status != XST_SUCCESS) {
		xil_printf("Gpio Initialization Failed\r\n");
		return GPIO_CMD_FAILURE;
	}

	/* Set the direction for all signals as output */
	XGpio_SetDataDirection(&Gpio, NUPRISM_CNTL_GPIO_CHAN, gpio_direction);
	XGpio_DiscreteWrite(&Gpio, NUPRISM_CNTL_GPIO_CHAN, NUPRISM_CNTL_GPIO_INIT);

	cntl_gpio_ready = 1;
	printf("nuprism gpio initialized\n");
	return GPIO_CMD_SUCCESS;
}

u8 nuprism_gpio_set(u8 gpio_pin, u8 value){
	if(cntl_gpio_ready != 1){
		if(nuprism_gpio_init(NUPRISM_CNTL_GPIO_INIT) == GPIO_CMD_FAILURE){
			return GPIO_CMD_FAILURE;
		}
	}

	if(gpio_pin > NUPRISM_CNTL_MAX_GPIO_VAL){
		printf("pin not available\n");
		return GPIO_CMD_FAILURE;
	}

	if(value == 0){
		XGpio_DiscreteClear(&Gpio, NUPRISM_CNTL_GPIO_CHAN, 1<<gpio_pin);
	} else {
        XGpio_DiscreteSet(&Gpio, NUPRISM_CNTL_GPIO_CHAN, 1<<gpio_pin);
	}

	return GPIO_CMD_SUCCESS;
}

