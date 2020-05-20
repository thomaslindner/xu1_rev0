/*
 * nuprism_power.c
 *
 *  Created on: Apr 23, 2020
 *      Author: rypay
 */
#include "nuprism_power.h"
#include  "pm_cfg_obj.h"

static XScuGic GicInst;
static XIpiPsu IpiInst;

#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID
#define PMU_IPI_CHANNEL_ID	XPAR_XIPIPSU_0_DEVICE_ID

u8 send_pwr_request(u8 node, u8 request){
	if(!check_node_valid(node)){
		printf("cannot access node %d", node);
		return 0;
	}

	int Status;
	if(request == REQUEST_SUSPEND){
		Status = XPm_RequestSuspend(node, REQUEST_ACK_BLOCKING, MAX_LATENCY, 0);

		if (Status == XST_SUCCESS){
			return 1;
		} else {
			return 0;
		}
	} else if (request == REQUEST_WAKEUP){
		Status = XPm_RequestWakeUp(node, 0, 0, REQUEST_ACK_BLOCKING);
		if (Status == XST_SUCCESS){
			return 1;
		} else {
			return 0;
		}
	} else if (request == REQUEST_FORCE){
		Status = XPm_ForcePowerDown(node, REQUEST_ACK_BLOCKING);
		if (Status == XST_SUCCESS){
			return 1;
		} else {
			return 0;
	}
	} else {
		return 0;
	}
	return 0;
}

u8 pmu_init(void){
	int Status;

	XIpiPsu_Config *IpiCfgPtr;
	XIpiPsu 	   *IpiInstance;

    IpiCfgPtr = XIpiPsu_LookupConfig( XPAR_XIPIPSU_0_DEVICE_ID );

    Status = XIpiPsu_CfgInitialize( IpiInstance, IpiCfgPtr, IpiCfgPtr->BaseAddress );
    if (Status != XST_SUCCESS) {
    		return 0;
	}

	Status = XPm_InitXilpm(IpiInstance);

	if (Status == XST_SUCCESS) {
		return 1;
	} else {
		return 0;
	}
}

u8 get_pwr_node_status(u8 node){
	if(!check_node_valid(node)){
		printf("cannot access node %d", node);
		return 0;
	}

	int Status;
	XPm_NodeStatus node_status;
	Status = XPm_GetNodeStatus(node, &node_status);
	if( Status == XST_SUCCESS ){
		printf("Node: %d | Status: %d | Requiremnets: %d | Usage: %d\n", node, node_status.status, node_status.requirements, node_status.usage);
		return 1;
	} else {
		return 0;
	}
}

u8 check_node_valid(u8 node){
	if((node < NUP_MAX_NODE) && (node > NUP_MIN_NODE-1)){
		return 1;
	} else {
		return 0;
	}
}

u8 pwr_tst_fn(void){
	XStatus status;
	XPm_NodeStatus nodestatus;

	/* Initialize GIC, IPIs, and Xilpm */
	status = PmInit(&GicInst, &IpiInst);
	if (XST_SUCCESS != status) {
		xil_printf("PM initialization failed with error code %ld\n",status);
		return status;
	}


	printf("tst fn passed\n");
	return 1;
}

/**
 * IpiConfigure() - Call to configure IPI peripheral and enable its interrupt
 *		in both peripheral and at the GIC
 * @IpiInst	Ipi Data structure to initialize
 * @GicInst	GIC in which the reception of the interrupt should be enabled
 *
 * @return	Status of configuring the interrupt
 *
 * @note	This function does not enable any IPI interrupt, an interrupt is
 *		enabled when the associated callback is registered. The
 *		function can be called safely multiple times, the IPI will be
 *		effectively configured only the first time when a call is made.
 */
XStatus IpiConfigure(XScuGic *const GicInst, XIpiPsu *const IpiInst)
{
	XStatus status;
	XIpiPsu_Config *IpiCfgPtr;
	static bool initialized = false;

	/* If IPI is already initialized return success */
	if (initialized)
		return XST_SUCCESS;

	/* Look Up the config data */
	IpiCfgPtr = XIpiPsu_LookupConfig(PMU_IPI_CHANNEL_ID);
	if (NULL == IpiCfgPtr) {
		status = XST_FAILURE;
		xil_printf("%s ERROR in getting CfgPtr\n", __func__);
		return status;
	}

	/* Init with the Cfg Data */
	status = XIpiPsu_CfgInitialize(IpiInst, IpiCfgPtr,
				       IpiCfgPtr->BaseAddress);
	if (XST_SUCCESS != status) {
		xil_printf("%s ERROR #%d in configuring IPI\n", __func__, status);
		return status;
	}

	initialized = true;

	return status;
}

/**
 * GicSetupInterruptSystem() - configure the system to receive peripheral
 *			       interrupt
 *
 * Does everything that is needed for enabling interrupts (gic setup,
 * Handler connecting, interrupt enabling on processor and gic level)
 *
 * @return:	status of operation success (XST_* from xstatus.h)
 */
static s32 GicSetupInterruptSystem(XScuGic *GicInst)
{
	s32 status;

	XScuGic_Config *GicCfgPtr = XScuGic_LookupConfig(INTC_DEVICE_ID);

	if (NULL == GicCfgPtr)
		return XST_FAILURE;

	status = XScuGic_CfgInitialize(GicInst, GicCfgPtr,
				       GicCfgPtr->CpuBaseAddress);
	if (XST_SUCCESS != status)
		return status;

	/*
	 * Connect the interrupt controller interrupt Handler to the
	 * hardware interrupt handling logic in the processor.
	 */
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
				     (Xil_ExceptionHandler)XScuGic_InterruptHandler,
				     GicInst);

	if (XST_SUCCESS != status)
		return status;

	Xil_ExceptionEnable();

	return XST_SUCCESS;
}

/**
 * PmInit - Initialize GIC, IPIs, and Xilpm
 * @GicInst	Pointer to GIC driver instance
 * @XIpiPsu	Pointer to IPI driver instance
 *
 * @return	Status of PM initialization
 */
static XStatus PmInit(XScuGic *const GicInst, XIpiPsu *const IpiInst)
{
	XStatus status;

	status = GicSetupInterruptSystem(GicInst);
	if (XST_SUCCESS != status) {
		xil_printf("GIC setup failed.\n");
		return status;
	}

	status  = IpiConfigure(GicInst, IpiInst);
	if (XST_SUCCESS != status) {
		xil_printf("IPI configuration failed.\n");
		return status;
	}

	status = XPm_InitXilpm(IpiInst);
	if (XST_SUCCESS != status) {
		xil_printf("Xilpm library initialization failed.\n");
		return status;
	}

	if (XST_SUCCESS != XPm_SetConfiguration((u32)XPm_ConfigObject)) {
		 pm_dbg("Set config object failed - Exiting main...\n\r");
		 return XST_FAILURE;
	}

	xil_printf("finalize init\n");
	status = XPm_InitFinalize();
	if (XST_SUCCESS != status) {
		xil_printf("Failed to finalize init with error code %dl\n", status);
		return status;
	}

	return status;
}

