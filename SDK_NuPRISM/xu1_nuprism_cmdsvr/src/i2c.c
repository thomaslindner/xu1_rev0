/*
 * i2c.c
 *
 *  Created on: Mar 25, 2020
 *      Author: rypay
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "xil_types.h"
#include "xparameters.h"
#include "xiicps.h"
#include "xil_printf.h"

#define I2C_WRITE_ROLE 0
#define I2C_READ_ROLE  1

volatile u8 TransmitComplete;	/* Flag to check completion of Transmission */
volatile u8 ReceiveComplete;	/* Flag to check completion of Reception */
volatile u32 TotalErrorCount;

u8 i2c_format_address(u8 * device_address, u8 read_write){
	if(read_write == I2C_WRITE_ROLE){
		*device_address =  (*device_address<<1) | I2C_WRITE_ROLE;
		return 1;
	} else if (read_write == I2C_READ_ROLE) {
		*device_address =  (*device_address<<1) | I2C_READ_ROLE;
		return 1;
	} else{
		return 0;
	}
}

u8 i2c_status_check(u32 Status){
	if (Status != XST_SUCCESS) {
		return 0;
	} else {
		return 1;
	}
}

u8 i2c_write(XIicPs *InstancePtr, u8 device_address, u16 data_address, u8 data, u8* txbuf){

	s32 Status;
	txbuf[0]= (u8) (data_address >> 8);
	txbuf[1]= (u8) data_address&0x00FF;
	txbuf[2] = data;

	/*
	 * Send the Data.
	 */

	Status = XIicPs_MasterSendPolled(InstancePtr, txbuf, 3, device_address);
	if (Status != XST_SUCCESS) {
		return 0;
	}

	/*
	 * Wait until bus is idle to start another transfer.
	 */
	while (XIicPs_BusIsBusy(InstancePtr));

	/*
	 * Wait for a bit of time to allow the programming to complete
	 */
	usleep(1000);

	return 1;
}


// u8 i2c_read(XIicPs *InstancePtr, u8 device_address, u16 data_address, u8* txbuf, u8* rxbuf){
// 	u32 Status;
//
// 	txbuf[0]= (u8) (data_address >> 8);
// 	txbuf[1]= (u8) data_address&0x00FF;
//
// 	//set read bit
// 	if (i2c_format_address(&device_address, I2C_READ_ROLE) == 0) {
// 				return 0;
// 	}
//
// 	//send data address to read back
// 	Status = XIicPs_MasterSendPolled(InstancePtr, txbuf, 2, device_address);
// 	if (Status != XST_SUCCESS) {
// 		return 0;
// 	}
//
// 	//wait until bus is idle
// 	while (XIicPs_BusIsBusy(InstancePtr));
//
// 	//expecting to receive one byte
// 	Status = XIicPs_MasterRecvPolled(InstancePtr, rxbuf, 1, device_address);
// 	if (Status != XST_SUCCESS) {
// 		return 0;
// 	}
//
// 	return i2c_status_check(Status);
// }

u8 i2c_read(XIicPs *InstancePtr, u8 device_address, u16 data_address, u8* txbuf, u8* rxbuf){
	u8 flag = 1;
	s32 Status;
	txbuf[0]= (u8) (data_address >> 8);
	txbuf[1]= (u8) data_address&0x00FF;

	Status = XIicPs_MasterSendPolled(InstancePtr, txbuf, 2, device_address);
	if (Status != XST_SUCCESS) {
		return 0;
	}

	/*
	 * Wait until bus is idle to start another transfer.
	 */
	while (XIicPs_BusIsBusy(InstancePtr));

	/*
	 * Wait for a bit of time to allow the programming to complete
	 */
	usleep(1000);

	/*
	 * Receive the Data.
	 */

	Status = XIicPs_MasterRecvPolled(InstancePtr, rxbuf, 1, device_address);
	if (Status != XST_SUCCESS) {
			return 0;
	}
	/*
	 * Wait until bus is idle to start another transfer.
	 */
	while (XIicPs_BusIsBusy(InstancePtr));

	return 1;
}

u8 i2c_write_readvalid(XIicPs *InstancePtr, u8 device_address, u16 data_address, u8 data, u8* txbuf, u8* rxbuf){
	u8 flag = 1;
	flag = i2c_write(InstancePtr, device_address, data_address, data, txbuf);
	if(flag == 0) {
		return 0;
	}
	flag = i2c_read(InstancePtr, device_address, data_address, txbuf, rxbuf);
	if(flag == 0) {
			return 0;
	} else {
		return 1;
	}
}
