/*
 * clock_cleaner.h
 *
 *  Created on: Mar 24, 2020
 *      Author: rypay
 */

#ifndef SRC_CLOCK_CLEANER_H_
#define SRC_CLOCK_CLEANER_H_

u32 clock_cleaner_i2c_init(void);
u8 clock_cleaner_init(void);
u8 clock_cleaner_start(void);
u8 clock_cleaner_stop(void);

#endif /* SRC_CLOCK_CLEANER_H_ */
