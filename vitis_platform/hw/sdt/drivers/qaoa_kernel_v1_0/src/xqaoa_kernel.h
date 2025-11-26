// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XQAOA_KERNEL_H
#define XQAOA_KERNEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xqaoa_kernel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XQaoa_kernel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XQaoa_kernel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XQaoa_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XQaoa_kernel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XQaoa_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XQaoa_kernel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XQaoa_kernel_Initialize(XQaoa_kernel *InstancePtr, UINTPTR BaseAddress);
XQaoa_kernel_Config* XQaoa_kernel_LookupConfig(UINTPTR BaseAddress);
#else
int XQaoa_kernel_Initialize(XQaoa_kernel *InstancePtr, u16 DeviceId);
XQaoa_kernel_Config* XQaoa_kernel_LookupConfig(u16 DeviceId);
#endif
int XQaoa_kernel_CfgInitialize(XQaoa_kernel *InstancePtr, XQaoa_kernel_Config *ConfigPtr);
#else
int XQaoa_kernel_Initialize(XQaoa_kernel *InstancePtr, const char* InstanceName);
int XQaoa_kernel_Release(XQaoa_kernel *InstancePtr);
#endif

void XQaoa_kernel_Start(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_IsDone(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_IsIdle(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_IsReady(XQaoa_kernel *InstancePtr);
void XQaoa_kernel_EnableAutoRestart(XQaoa_kernel *InstancePtr);
void XQaoa_kernel_DisableAutoRestart(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Get_return(XQaoa_kernel *InstancePtr);

void XQaoa_kernel_Set_gamma(XQaoa_kernel *InstancePtr, u32 Data);
u32 XQaoa_kernel_Get_gamma(XQaoa_kernel *InstancePtr);
void XQaoa_kernel_Set_beta(XQaoa_kernel *InstancePtr, u32 Data);
u32 XQaoa_kernel_Get_beta(XQaoa_kernel *InstancePtr);
void XQaoa_kernel_Set_get_best_state(XQaoa_kernel *InstancePtr, u32 Data);
u32 XQaoa_kernel_Get_get_best_state(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Get_best_state(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Get_best_state_vld(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Get_d_BaseAddress(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Get_d_HighAddress(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Get_d_TotalBytes(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Get_d_BitWidth(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Get_d_Depth(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_Write_d_Words(XQaoa_kernel *InstancePtr, int offset, word_type *data, int length);
u32 XQaoa_kernel_Read_d_Words(XQaoa_kernel *InstancePtr, int offset, word_type *data, int length);
u32 XQaoa_kernel_Write_d_Bytes(XQaoa_kernel *InstancePtr, int offset, char *data, int length);
u32 XQaoa_kernel_Read_d_Bytes(XQaoa_kernel *InstancePtr, int offset, char *data, int length);

void XQaoa_kernel_InterruptGlobalEnable(XQaoa_kernel *InstancePtr);
void XQaoa_kernel_InterruptGlobalDisable(XQaoa_kernel *InstancePtr);
void XQaoa_kernel_InterruptEnable(XQaoa_kernel *InstancePtr, u32 Mask);
void XQaoa_kernel_InterruptDisable(XQaoa_kernel *InstancePtr, u32 Mask);
void XQaoa_kernel_InterruptClear(XQaoa_kernel *InstancePtr, u32 Mask);
u32 XQaoa_kernel_InterruptGetEnabled(XQaoa_kernel *InstancePtr);
u32 XQaoa_kernel_InterruptGetStatus(XQaoa_kernel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
