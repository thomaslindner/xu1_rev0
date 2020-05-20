/*
 * spi.c
 *
 *  Created on: Apr 1, 2020
 *      Author: rypay
 */

#include "spi.h"

u8 spi_write(XSpiPs *SpiPtr, u16 data_address, u8 data, u8* txbuf){
	txbuf[0] = ((u8)((data_address & 0xFF00) >> 8)) | SPI_WRITE_CMD;
	txbuf[1] = (u8)(data_address & 0xFF);
	txbuf[2] = data;

	/*
	 * Send command
	 */

	XSpiPs_SetSlaveSelect(SpiPtr, SLAVE_SELECT);
	XSpiPs_PolledTransfer(SpiPtr, txbuf, NULL, SPI_WRITE_SIZE);

	return SPI_STATUS_SUCCESS;
}

u8 spi_read(XSpiPs *SpiPtr, u16 data_address, u8* txbuf, u8* rxbuf){
	txbuf[0] = ((u8)((data_address & 0xFF00) >> 8)) | SPI_READ_CMD;
	txbuf[1] = (u8)(data_address & 0xFF);
	txbuf[2] = DONT_CARE_DATA;

	XSpiPs_SetSlaveSelect(SpiPtr, SLAVE_SELECT);
	XSpiPs_PolledTransfer(SpiPtr, txbuf, rxbuf, SPI_READ_SIZE);

	return SPI_STATUS_SUCCESS;
}

u8 spi_write_readvalid(XSpiPs *SpiPtr, u16 data_address, u8 data, u8* txbuf, u8* rxbuf){

	if( spi_write(SpiPtr, data_address, data, txbuf) == SPI_STATUS_FAILURE){
		return SPI_STATUS_FAILURE;
	}

	if( spi_read(SpiPtr, data_address, txbuf, rxbuf) == SPI_STATUS_FAILURE){
		return SPI_STATUS_FAILURE;
	}

	if( rxbuf[0] != data){
		printf("ERROR: [register mismatch] Device wrote %02x to address %04x and read %02x back\n",
				data, data_address, rxbuf[0]);
		printf("for reference: rx[0,1,2,3,4,5,6] = %02x, %02x, %02x, %02x, %02x, %02x\n", rxbuf[0],rxbuf[1],
			   rxbuf[2], rxbuf[3], rxbuf[4], rxbuf[5], rxbuf[6]);
		printf("for reference: tx[0,1,2,3,4,5,6] = %02x, %02x, %02x, %02x, %02x, %02x\n", txbuf[0],txbuf[1],
				txbuf[2], txbuf[3], txbuf[4], txbuf[5], txbuf[6]);
		return SPI_STATUS_FAILURE;
	} else {
		return SPI_STATUS_SUCCESS;
	}

}
