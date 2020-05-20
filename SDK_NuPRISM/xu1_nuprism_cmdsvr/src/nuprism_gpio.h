/*
 * nuprism_gpio.h
 *
 *  Created on: Mar 26, 2020
 *      Author: rypay
 */

#ifndef SRC_NUPRISM_GPIO_H_
#define SRC_NUPRISM_GPIO_H_

#define ADC0_CS 0
#define ADC1_CS 1
#define ADC2_CS 2
#define ADC3_CS 3
#define ADC4_CS 4
#define ADC_RST 5
#define ADC_PDN 6

#define GPIO_SET  0x01
#define GPIO_USET 0x00

u8 nuprism_gpio_init(u8 gpio_id);
u8 nuprism_gpio_set(u8 gpio_pin, u8 value);

#endif /* SRC_NUPRISM_GPIO_H_ */
