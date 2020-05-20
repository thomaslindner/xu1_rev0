/*
 * cmd_svr.c
 *
 *  Created on: Mar 24, 2020
 *      Author: rypay
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "xil_types.h"
#include "cmd_svr.h"
#include "clock_cleaner.h"
#include "xiicps.h"
#include "sleep.h"
#include "xil_printf.h"
#include "nuprism_gpio.h"
#include "adc3424.h"
#include "nuprism_power.h"

#define CLOCK_CLEANER_IIC_DEVICE_ID		XPAR_XIICPS_0_DEVICE_ID


u8 run_command(char* command){
	u8 flag = 0;
	if(strstr(command,"ack") != NULL){
		flag = cmd_ack(command);
	} else if (strstr(command,"pwr") != NULL){
		flag = parse_pwr_command(command);
	} else if (strstr(command,"adc") != NULL){
		flag = parse_adc_command(command);
	} else if (strstr(command,"clc") != NULL){
		flag = parse_clc_command(command);
	} else if (strstr(command,"gpio") != NULL){
		flag = parse_gpio_command(command);
	} else if (strstr(command,"help") != NULL){
		flag = display_commands();
	} else {
		printf("command not recognized, try entering 'help' \n");
		flag = 0;
	}
	return flag;
}

u8 display_commands(void){
	printf("\n");
	printf("command list:\n");
	printf("	$<pmt command>\n");
	printf("	selbase <base number (index 1)>\n");
	printf("	ceop [clear]\n");
	printf("	loop <number of loops @5Hz>\n");
	printf("\n");
	return 1;
}


u8 cmd_ack(char* cmd){
	char * msg;
	msg = (char *) malloc(100);
	strcpy(msg,(cmd + strlen("ack ")));
	printf("%s",msg);
	free(msg);
	return 1;
}

//expected command structure: adc <reset> <adcnum> <r/w>
u8 parse_adc_command(char* cmd){
	u8 flag = 1;
	printf("not fully functional\n");
	char * msg;
	msg = (char *) malloc(100);
	strcpy(msg,(cmd + strlen("adc ")));

	if(strstr(cmd,"pdn") != NULL){
		flag = adc3424_set_power(ADC_POWER_DOWN);
	} else if (strstr(cmd,"pup") != NULL){
		flag = adc3424_set_power(ADC_POWER_UP);
	} else if (strstr(cmd,"rst") != NULL){
		flag = adc3424_rst();
	} else if (strstr(cmd,"nom") != NULL){
			flag = adc3424_set_mode_all(ADC_NOMINAL_MODE);
	} else if (strstr(cmd,"tst") != NULL){
			flag = adc3424_set_mode_all(ADC_TEST_MODE_SIN);
	} else if (strstr(cmd,"init") != NULL){
			flag = adc3424_init_all();
	} else if (strstr(cmd,"nss") != NULL){
			flag = adc3424_ss();
	} else if (strstr(cmd,"ss") != NULL){
			flag = adc3424_ss();
	} else {
		flag = 0;
	}

	free(msg);
	return flag;
}

u8 parse_clc_command(char* cmd){
	u8 flag = 1;
	printf("not fully functional\n");
	char * msg;
	msg = (char *) malloc(100);
	strcpy(msg,(cmd + strlen("adc ")));

	if (strstr(cmd,"start") != NULL){
		flag = clock_cleaner_start();
	} else if (strstr(cmd,"stop") != NULL) {
		flag = clock_cleaner_stop();
	} else {
		flag = 0;
	}

	free(msg);
	return flag;
}

u8 parse_gpio_command(char* cmd){
	u8 flag = 1;
	u8 val;
	char * msg;
	char * arg;
	msg = (char *) malloc(100);
	arg = (char *) malloc(100);
	strcpy(msg,(cmd + strlen("gpio ")));

	if (strstr(cmd,"uset") != NULL){
		strcpy(arg,(msg + strlen("uset ")));
		val = (u8) atoi(arg);
		flag = nuprism_gpio_set(val, GPIO_USET);
	} else if (strstr(cmd,"set") != NULL) {
		strcpy(arg,(msg + strlen("set ")));
		val = (u8) atoi(arg);
		flag = nuprism_gpio_set(val, GPIO_SET);
	} else {
		flag = 0;
	}

	free(msg);
	free(arg);
	return flag;
}

u8 parse_pwr_command(char* cmd){
	if (strstr(cmd,"pwrw") != NULL){
		return send_pwr_request((u8)atoi(cmd + strlen("pwrw ")), REQUEST_WAKEUP);
	} else if (strstr(cmd,"pwrs") != NULL){
		return send_pwr_request((u8)atoi(cmd + strlen("pwrs ")), REQUEST_SUSPEND);
	} else if (strstr(cmd,"pwrg") != NULL){
		return get_pwr_node_status((u8)atoi(cmd + strlen("pwrg ")));
	} else if (strstr(cmd,"pwrf") != NULL){
		return send_pwr_request((u8)atoi(cmd + strlen("pwrf ")), REQUEST_FORCE);
	} else if (strstr(cmd,"pwri") != NULL){
		return pmu_init();
	} else if (strstr(cmd,"pwrtst") != NULL){
		return pwr_tst_fn();
	} else {
		return 0;
	}
	return 0;
}
