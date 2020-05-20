/*
 * cmd_svr.h
 *
 *  Created on: Mar 24, 2020
 *      Author: rypay
 */

#ifndef SRC_CMD_SVR_H_
#define SRC_CMD_SVR_H_

typedef struct{
	char arg[32];
	struct command_input* next;
} command_input;

//u8 parse_command(char* command);
u8 run_command(char*);
u8 display_commands(void);
u8 cmd_ack(char*);
u8 parse_adc_command(char* cmd);
u8 parse_clc_command(char* cmd);
u8 parse_gpio_command(char* cmd);
u8 parse_pwr_command(char* cmd);

#endif /* SRC_CMD_SVR_H_ */
