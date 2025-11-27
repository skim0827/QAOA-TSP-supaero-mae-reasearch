// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xqaoa_kernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XQaoa_kernel_CfgInitialize(XQaoa_kernel *InstancePtr, XQaoa_kernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XQaoa_kernel_Start(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XQaoa_kernel_IsDone(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XQaoa_kernel_IsIdle(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XQaoa_kernel_IsReady(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XQaoa_kernel_EnableAutoRestart(XQaoa_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XQaoa_kernel_DisableAutoRestart(XQaoa_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XQaoa_kernel_Get_return(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_AP_RETURN);
    return Data;
}
void XQaoa_kernel_Set_gamma(XQaoa_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_GAMMA_DATA, Data);
}

u32 XQaoa_kernel_Get_gamma(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_GAMMA_DATA);
    return Data;
}

void XQaoa_kernel_Set_beta(XQaoa_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_BETA_DATA, Data);
}

u32 XQaoa_kernel_Get_beta(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_BETA_DATA);
    return Data;
}

void XQaoa_kernel_Set_get_best_state(XQaoa_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_GET_BEST_STATE_DATA, Data);
}

u32 XQaoa_kernel_Get_get_best_state(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_GET_BEST_STATE_DATA);
    return Data;
}

u32 XQaoa_kernel_Get_best_state(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_BEST_STATE_DATA);
    return Data;
}

u32 XQaoa_kernel_Get_best_state_vld(XQaoa_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_BEST_STATE_CTRL);
    return Data & 0x1;
}

u32 XQaoa_kernel_Get_d_BaseAddress(XQaoa_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XQAOA_KERNEL_CONTROL_ADDR_D_BASE);
}

u32 XQaoa_kernel_Get_d_HighAddress(XQaoa_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Control_BaseAddress + XQAOA_KERNEL_CONTROL_ADDR_D_HIGH);
}

u32 XQaoa_kernel_Get_d_TotalBytes(XQaoa_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XQAOA_KERNEL_CONTROL_ADDR_D_HIGH - XQAOA_KERNEL_CONTROL_ADDR_D_BASE + 1);
}

u32 XQaoa_kernel_Get_d_BitWidth(XQaoa_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XQAOA_KERNEL_CONTROL_WIDTH_D;
}

u32 XQaoa_kernel_Get_d_Depth(XQaoa_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XQAOA_KERNEL_CONTROL_DEPTH_D;
}

u32 XQaoa_kernel_Write_d_Words(XQaoa_kernel *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XQAOA_KERNEL_CONTROL_ADDR_D_HIGH - XQAOA_KERNEL_CONTROL_ADDR_D_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Control_BaseAddress + XQAOA_KERNEL_CONTROL_ADDR_D_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XQaoa_kernel_Read_d_Words(XQaoa_kernel *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XQAOA_KERNEL_CONTROL_ADDR_D_HIGH - XQAOA_KERNEL_CONTROL_ADDR_D_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Control_BaseAddress + XQAOA_KERNEL_CONTROL_ADDR_D_BASE + (offset + i)*4);
    }
    return length;
}

u32 XQaoa_kernel_Write_d_Bytes(XQaoa_kernel *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XQAOA_KERNEL_CONTROL_ADDR_D_HIGH - XQAOA_KERNEL_CONTROL_ADDR_D_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Control_BaseAddress + XQAOA_KERNEL_CONTROL_ADDR_D_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XQaoa_kernel_Read_d_Bytes(XQaoa_kernel *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XQAOA_KERNEL_CONTROL_ADDR_D_HIGH - XQAOA_KERNEL_CONTROL_ADDR_D_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Control_BaseAddress + XQAOA_KERNEL_CONTROL_ADDR_D_BASE + offset + i);
    }
    return length;
}

void XQaoa_kernel_InterruptGlobalEnable(XQaoa_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_GIE, 1);
}

void XQaoa_kernel_InterruptGlobalDisable(XQaoa_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_GIE, 0);
}

void XQaoa_kernel_InterruptEnable(XQaoa_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_IER);
    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_IER, Register | Mask);
}

void XQaoa_kernel_InterruptDisable(XQaoa_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_IER);
    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XQaoa_kernel_InterruptClear(XQaoa_kernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XQaoa_kernel_WriteReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_ISR, Mask);
}

u32 XQaoa_kernel_InterruptGetEnabled(XQaoa_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_IER);
}

u32 XQaoa_kernel_InterruptGetStatus(XQaoa_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XQaoa_kernel_ReadReg(InstancePtr->Control_BaseAddress, XQAOA_KERNEL_CONTROL_ADDR_ISR);
}

