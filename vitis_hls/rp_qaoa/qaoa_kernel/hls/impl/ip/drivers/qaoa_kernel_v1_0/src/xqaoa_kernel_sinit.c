// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xqaoa_kernel.h"

extern XQaoa_kernel_Config XQaoa_kernel_ConfigTable[];

#ifdef SDT
XQaoa_kernel_Config *XQaoa_kernel_LookupConfig(UINTPTR BaseAddress) {
	XQaoa_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XQaoa_kernel_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XQaoa_kernel_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XQaoa_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XQaoa_kernel_Initialize(XQaoa_kernel *InstancePtr, UINTPTR BaseAddress) {
	XQaoa_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XQaoa_kernel_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XQaoa_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XQaoa_kernel_Config *XQaoa_kernel_LookupConfig(u16 DeviceId) {
	XQaoa_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XQAOA_KERNEL_NUM_INSTANCES; Index++) {
		if (XQaoa_kernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XQaoa_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XQaoa_kernel_Initialize(XQaoa_kernel *InstancePtr, u16 DeviceId) {
	XQaoa_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XQaoa_kernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XQaoa_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

