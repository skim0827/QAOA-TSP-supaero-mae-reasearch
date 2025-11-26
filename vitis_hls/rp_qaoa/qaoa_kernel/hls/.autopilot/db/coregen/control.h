// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of ap_return
//        bit 31~0 - ap_return[31:0] (Read)
// 0x18 : Data signal of gamma
//        bit 31~0 - gamma[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of beta
//        bit 31~0 - beta[31:0] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of get_best_state
//        bit 0  - get_best_state[0] (Read/Write)
//        others - reserved
// 0x2c : reserved
// 0x30 : Data signal of best_state
//        bit 31~0 - best_state[31:0] (Read)
// 0x34 : Control signal of best_state
//        bit 0  - best_state_ap_vld (Read/COR)
//        others - reserved
// 0x40 ~
// 0x7f : Memory 'd' (9 * 32b)
//        Word n : bit [31:0] - d[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL             0x00
#define CONTROL_ADDR_GIE                 0x04
#define CONTROL_ADDR_IER                 0x08
#define CONTROL_ADDR_ISR                 0x0c
#define CONTROL_ADDR_AP_RETURN           0x10
#define CONTROL_BITS_AP_RETURN           32
#define CONTROL_ADDR_GAMMA_DATA          0x18
#define CONTROL_BITS_GAMMA_DATA          32
#define CONTROL_ADDR_BETA_DATA           0x20
#define CONTROL_BITS_BETA_DATA           32
#define CONTROL_ADDR_GET_BEST_STATE_DATA 0x28
#define CONTROL_BITS_GET_BEST_STATE_DATA 1
#define CONTROL_ADDR_BEST_STATE_DATA     0x30
#define CONTROL_BITS_BEST_STATE_DATA     32
#define CONTROL_ADDR_BEST_STATE_CTRL     0x34
#define CONTROL_ADDR_D_BASE              0x40
#define CONTROL_ADDR_D_HIGH              0x7f
#define CONTROL_WIDTH_D                  32
#define CONTROL_DEPTH_D                  9
