/*
 * i2c.h
 *
 *  Created on: Mar 25, 2020
 *      Author: rypay
 */

#ifndef SRC_I2C_H_
#define SRC_I2C_H_

u8 i2c_format_address(u8 * device_address, u8 read_write);
u8 i2c_status_check(u32 Status);
u8 i2c_write(XIicPs *InstancePtr, u8 device_address, u16 data_address, u8 data, u8* txbuf);
u8 i2c_read(XIicPs *InstancePtr, u8 device_address, u16 data_address, u8* txbuf, u8* rxbuf);
u8 i2c_write_readvalid(XIicPs *InstancePtr, u8 device_address, u16 data_address, u8 data, u8* txbuf, u8* rxbuf);

#endif /* SRC_I2C_H_ */
