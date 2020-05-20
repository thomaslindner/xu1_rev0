/*
 * nuprism_power.h
 *
 *  Created on: Apr 23, 2020
 *      Author: rypay
 */

#ifndef SRC_NUPRISM_POWER_H_
#define SRC_NUPRISM_POWER_H_

#include "pm_api_sys.h"
#include "pm_defs.h"
#include "pm_client.h"
#include "xparameters.h"	/* SDK generated parameters */
#include "xplatform_info.h"
#include "xil_printf.h"

#include <sleep.h>
#include <xil_cache.h>
#include <xscugic.h>
#include "pm_client.h"

#define REQUEST_FORCE   2
#define REQUEST_SUSPEND 1
#define REQUEST_WAKEUP  0

#define NUP_MAX_NODE NODE_ID_MAX
#define NUP_MIN_NODE NODE_APU_1

u8 send_pwr_request(u8 node, u8 request);
u8 pmu_init(void);
u8 get_pwr_node_status(u8 node);
u8 check_node_valid(u8 node);
u8 pwr_tst_fn(void);
XStatus IpiConfigure(XScuGic *const GicInst, XIpiPsu *const IpiInst);
static s32 GicSetupInterruptSystem(XScuGic *GicInst);
static XStatus PmInit(XScuGic *const GicInst, XIpiPsu *const IpiInst);

#endif /* SRC_NUPRISM_POWER_H_ */
