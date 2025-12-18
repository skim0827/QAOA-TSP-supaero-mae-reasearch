#include "xparameters.h"
#define QAOA_BASE XPAR_QAOA_KERNEL_0_BASEADDR
#include "xuartps.h"
#include <stdio.h>
#include <stdint.h>
#include "xiltimer.h"
#include <nlopt.hpp>


// ----- float -> ap_fixed<32,12> -----
static inline uint32_t float_to_fixed(float x){
    return (uint32_t)(x * (1 << 20));   // fractional bits = 20
}

// ----- ap_fixed<32,12> -> float -----
static inline float fixed_to_float(uint32_t x){
    return ((float)x) / (1 << 20);
}

int main() {
    // ---------------------------
    // UART 
    // ---------------------------
    XUartPs uart;
    XUartPs_Config *cfg;
    cfg = XUartPs_LookupConfig(XPAR_DEVICE_ID);
    XUartPs_CfgInitialize(&uart, cfg, cfg->BaseAddress);
    XUartPs_SetBaudRate(&uart, 115200);


    char buf[64];
    int i = 0;

    // PC -> ARM wait until newline
    while (1) {
        if (XUartPs_IsReceiveData(uart.Config.BaseAddress)) {
            buf[i++] = XUartPs_ReadReg(uart.Config.BaseAddress,
                                    XUARTPS_FIFO_OFFSET);
            if (buf[i-1] == '\n') break;
        }
    }
    buf[i] = 0;

    float gamma, beta;
    sscanf(buf, "%f %f", &gamma, &beta);




    volatile uint32_t *reg = (uint32_t*)QAOA_BASE;

    // ---------------------------
    // 1. Write matrix d[3][3]
    // ---------------------------
    float d[3][3] = {
        {0.0, 10.0, 4.7},
        {10.0, 0.0, 11.0},
        {4.7, 11.0, 0.0}
    };

    int idx = 16;   // reg[0] = control register
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++){
            reg[idx++] = float_to_fixed(d[i][j]);
        }
    }

    // ---------------------------
    // 2. Write gamma, beta
    // ---------------------------
    reg[6] = float_to_fixed(gamma);
    reg[8] = float_to_fixed(beta);    

    // ---------------------------
    // 3. get_best_state = 1
    // ---------------------------
    reg[10] = 1;

    // ---------------------------
    // 4. Start accelerator ap_start = 1
    // ---------------------------
    XTime t0, t1;
    XTime_GetTime(&t0);
    reg[0] = 1;
    while ((reg[0] & 0x2) == 0);   // wait ap_done
    XTime_GetTime(&t1);
    double fpga_ms = (double)(t1 - t0) / (COUNTS_PER_SECOND / 1000.0);
    printf("FPGA time = %f ms\n", fpga_ms);

    // ---------------------------
    // 5. Read results
    // ---------------------------
    uint32_t best_state_raw = reg[12];
    uint32_t expect_raw     = reg[4];
    float expectation = fixed_to_float(expect_raw);

    // ARM -> PC 
    char out[64];
    sprintf(out, "%f\n", expectation);
    for (int i = 0; out[i] != 0; i++) {
    XUartPs_WriteReg(uart.Config.BaseAddress,
                     XUARTPS_FIFO_OFFSET,
                     out[i]);
    }

    printf("Best state  = %u\n", best_state_raw);
    printf("Expectation = %f\n", expectation);

    return 0;
}
