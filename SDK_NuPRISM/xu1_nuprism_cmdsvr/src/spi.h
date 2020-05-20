/*
 * spi.h
 *
 *  Created on: Apr 1, 2020
 *      Author: rypay
 */

#ifndef SRC_SPI_H_
#define SRC_SPI_H_

#include "xparameters.h"	/* SDK generated parameters */
#include "xplatform_info.h"
#include "xspips.h"		/* SPI device driver */
#include "xil_printf.h"

#define ADDRESS_MSB_OFFSET	1 /* MSB byte of address to read or write */
#define ADDRESS_LSB_OFFSET	2 /* LSB byte of address to read or write */
#define SPI_WRITE_SIZE		3 /* Number of bytes transfered on a register write */
#define SPI_READ_SIZE		3 /* Number of bytes transfered on a register read */
#define SPI_STATUS_SUCCESS 0x01
#define SPI_STATUS_FAILURE 0x00
#define DONT_CARE_DATA     0x55

#define SPI_READ_CMD	0xC0
#define SPI_WRITE_CMD   0x40

#define SLAVE_SELECT 0x00

u8 spi_write(XSpiPs *SpiPtr, u16 data_address, u8 data, u8* txbuf);
u8 spi_read(XSpiPs *SpiPtr, u16 data_address, u8* txbuf, u8* rxbuf);
u8 spi_write_readvalid(XSpiPs *SpiPtr, u16 data_address, u8 data, u8* txbuf, u8* rxbuf);

#endif /* SRC_SPI_H_ */
