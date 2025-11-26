// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps

module AESL_axi_slave_control (
    clk,
    reset,
    TRAN_s_axi_control_AWADDR,
    TRAN_s_axi_control_AWVALID,
    TRAN_s_axi_control_AWREADY,
    TRAN_s_axi_control_WVALID,
    TRAN_s_axi_control_WREADY,
    TRAN_s_axi_control_WDATA,
    TRAN_s_axi_control_WSTRB,
    TRAN_s_axi_control_ARADDR,
    TRAN_s_axi_control_ARVALID,
    TRAN_s_axi_control_ARREADY,
    TRAN_s_axi_control_RVALID,
    TRAN_s_axi_control_RREADY,
    TRAN_s_axi_control_RDATA,
    TRAN_s_axi_control_RRESP,
    TRAN_s_axi_control_BVALID,
    TRAN_s_axi_control_BREADY,
    TRAN_s_axi_control_BRESP,
    TRAN_control_write_data_finish,
    TRAN_control_read_data_finish,
    TRAN_control_start_in,
    TRAN_control_idle_out,
    TRAN_control_ready_out,
    TRAN_control_ready_in,
    TRAN_control_done_out,
    TRAN_control_write_start_in   ,
    TRAN_control_write_start_finish,
    TRAN_control_interrupt,
    TRAN_control_transaction_done_in
    );

//------------------------Parameter----------------------
`define TV_IN_d "../tv/cdatafile/c.qaoa_kernel.autotvin_d.dat"
`define TV_IN_gamma "../tv/cdatafile/c.qaoa_kernel.autotvin_gamma.dat"
`define TV_IN_beta "../tv/cdatafile/c.qaoa_kernel.autotvin_beta.dat"
`define TV_IN_get_best_state "../tv/cdatafile/c.qaoa_kernel.autotvin_get_best_state.dat"
`define TV_OUT_best_state "../tv/rtldatafile/rtl.qaoa_kernel.autotvout_best_state.dat"
`define TV_OUT_ap_return "../tv/rtldatafile/rtl.qaoa_kernel.autotvout_ap_return.dat"
parameter ADDR_WIDTH = 7;
parameter DATA_WIDTH = 32;
parameter d_DEPTH = 9;
reg [31 : 0] d_OPERATE_DEPTH = 0;
parameter d_c_bitwidth = 32;
parameter gamma_DEPTH = 1;
reg [31 : 0] gamma_OPERATE_DEPTH = 0;
parameter gamma_c_bitwidth = 32;
parameter beta_DEPTH = 1;
reg [31 : 0] beta_OPERATE_DEPTH = 0;
parameter beta_c_bitwidth = 32;
parameter get_best_state_DEPTH = 1;
reg [31 : 0] get_best_state_OPERATE_DEPTH = 0;
parameter get_best_state_c_bitwidth = 1;
parameter best_state_DEPTH = 1;
reg [31 : 0] best_state_OPERATE_DEPTH = 0;
parameter best_state_c_bitwidth = 32;
parameter ap_return_DEPTH = 1;
reg [31 : 0] ap_return_OPERATE_DEPTH = 0;
parameter ap_return_c_bitwidth = 32;
parameter START_ADDR = 0;
parameter qaoa_kernel_continue_addr = 0;
parameter qaoa_kernel_auto_start_addr = 0;
parameter gamma_data_in_addr = 24;
parameter beta_data_in_addr = 32;
parameter get_best_state_data_in_addr = 40;
parameter d_data_in_addr = 64;
parameter ap_return_data_out_addr = 16;
parameter best_state_data_out_addr = 48;
parameter best_state_valid_out_addr = 52;
parameter STATUS_ADDR = 0;

output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_AWADDR;
output  TRAN_s_axi_control_AWVALID;
input  TRAN_s_axi_control_AWREADY;
output  TRAN_s_axi_control_WVALID;
input  TRAN_s_axi_control_WREADY;
output [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_WDATA;
output [DATA_WIDTH/8 - 1 : 0] TRAN_s_axi_control_WSTRB;
output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_ARADDR;
output  TRAN_s_axi_control_ARVALID;
input  TRAN_s_axi_control_ARREADY;
input  TRAN_s_axi_control_RVALID;
output  TRAN_s_axi_control_RREADY;
input [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_RDATA;
input [2 - 1 : 0] TRAN_s_axi_control_RRESP;
input  TRAN_s_axi_control_BVALID;
output  TRAN_s_axi_control_BREADY;
input [2 - 1 : 0] TRAN_s_axi_control_BRESP;
output TRAN_control_write_data_finish;
output TRAN_control_read_data_finish;
input     clk;
input     reset;
input     TRAN_control_start_in;
output    TRAN_control_done_out;
output    TRAN_control_ready_out;
input     TRAN_control_ready_in;
output    TRAN_control_idle_out;
input  TRAN_control_write_start_in   ;
output TRAN_control_write_start_finish;
input     TRAN_control_interrupt;
input     TRAN_control_transaction_done_in;

reg [ADDR_WIDTH - 1 : 0] AWADDR_reg = 0;
reg  AWVALID_reg = 0;
reg  WVALID_reg = 0;
reg [DATA_WIDTH - 1 : 0] WDATA_reg = 0;
reg [DATA_WIDTH/8 - 1 : 0] WSTRB_reg = 0;
reg [ADDR_WIDTH - 1 : 0] ARADDR_reg = 0;
reg  ARVALID_reg = 0;
reg  RREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] RDATA_reg = 0;
reg  BREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] mem_d [d_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_d [ (d_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * d_DEPTH -1 : 0] = '{default : 'hz};
reg d_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_gamma [gamma_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_gamma [ (gamma_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * gamma_DEPTH -1 : 0] = '{default : 'hz};
reg gamma_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_beta [beta_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_beta [ (beta_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * beta_DEPTH -1 : 0] = '{default : 'hz};
reg beta_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_get_best_state [get_best_state_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_get_best_state [ (get_best_state_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * get_best_state_DEPTH -1 : 0] = '{default : 'hz};
reg get_best_state_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_best_state [best_state_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_best_state [ (best_state_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * best_state_DEPTH -1 : 0] = '{default : 'hz};
reg best_state_read_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_ap_return [ap_return_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_ap_return [ (ap_return_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * ap_return_DEPTH -1 : 0] = '{default : 'hz};
reg ap_return_read_data_finish;
reg AESL_ready_out_index_reg = 0;
reg AESL_write_start_finish = 0;
reg AESL_ready_reg;
reg ready_initial;
reg AESL_done_index_reg = 0;
reg AESL_idle_index_reg = 0;
reg AESL_auto_restart_index_reg;
reg process_0_finish = 0;
reg process_1_finish = 0;
reg process_2_finish = 0;
reg process_3_finish = 0;
reg process_4_finish = 0;
reg process_5_finish = 0;
reg process_6_finish = 0;
reg process_7_finish = 0;
//write d reg
reg [31 : 0] write_d_count = 0;
reg [31 : 0] d_diff_count = 0;
reg write_d_run_flag = 0;
reg write_one_d_data_done = 0;
//write gamma reg
reg [31 : 0] write_gamma_count = 0;
reg [31 : 0] gamma_diff_count = 0;
reg write_gamma_run_flag = 0;
reg write_one_gamma_data_done = 0;
//write beta reg
reg [31 : 0] write_beta_count = 0;
reg [31 : 0] beta_diff_count = 0;
reg write_beta_run_flag = 0;
reg write_one_beta_data_done = 0;
//write get_best_state reg
reg [31 : 0] write_get_best_state_count = 0;
reg [31 : 0] get_best_state_diff_count = 0;
reg write_get_best_state_run_flag = 0;
reg write_one_get_best_state_data_done = 0;
//read best_state reg
reg [31 : 0] read_best_state_count = 0;
reg read_best_state_run_flag = 0;
reg read_one_best_state_data_done = 0;
//read ap_return reg
reg [31 : 0] read_ap_return_count = 0;
reg read_ap_return_run_flag = 0;
reg read_one_ap_return_data_done = 0;
reg [31 : 0] write_start_count = 0;
reg write_start_run_flag = 0;

//===================process control=================
reg [31 : 0] ongoing_process_number = 0;
//process number depends on how much processes needed.
reg process_busy = 0;

//=================== signal connection ==============
assign TRAN_s_axi_control_AWADDR = AWADDR_reg;
assign TRAN_s_axi_control_AWVALID = AWVALID_reg;
assign TRAN_s_axi_control_WVALID = WVALID_reg;
assign TRAN_s_axi_control_WDATA = WDATA_reg;
assign TRAN_s_axi_control_WSTRB = WSTRB_reg;
assign TRAN_s_axi_control_ARADDR = ARADDR_reg;
assign TRAN_s_axi_control_ARVALID = ARVALID_reg;
assign TRAN_s_axi_control_RREADY = RREADY_reg;
assign TRAN_s_axi_control_BREADY = BREADY_reg;
assign TRAN_control_write_start_finish = AESL_write_start_finish;
assign TRAN_control_done_out = AESL_done_index_reg;
assign TRAN_control_ready_out = AESL_ready_out_index_reg;
assign TRAN_control_idle_out = AESL_idle_index_reg;
assign TRAN_control_read_data_finish = 1 & best_state_read_data_finish & ap_return_read_data_finish;
assign TRAN_control_write_data_finish = 1 & d_write_data_finish & gamma_write_data_finish & beta_write_data_finish & get_best_state_write_data_finish;
always @(TRAN_control_ready_in or ready_initial) 
begin
    AESL_ready_reg <= TRAN_control_ready_in | ready_initial;
end

always @(reset or process_0_finish or process_1_finish or process_2_finish or process_3_finish or process_4_finish or process_5_finish or process_6_finish or process_7_finish ) begin
    if (reset == 0) begin
        ongoing_process_number <= 0;
    end
    else if (ongoing_process_number == 0 && process_0_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 1 && process_1_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 2 && process_2_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 3 && process_3_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 4 && process_4_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 5 && process_5_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 6 && process_6_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 7 && process_7_finish == 1) begin
            ongoing_process_number <= 0;
    end
end

task count_c_data_four_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 32;
    for (i = 1; i <= 1024; i = i + 1) begin
        if (bitwidth <= factor && bitwidth > factor - 32) begin
            num = i;
        end
        factor = factor + 32;
    end
end    
endtask

function integer ceil_align_to_pow_of_two;
input integer a;
begin
    ceil_align_to_pow_of_two = $pow(2,$clog2(a));
end
endfunction

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

task count_operate_depth_by_bitwidth_and_depth;
input  integer bitwidth;
input  integer depth;
output integer operate_depth;
integer factor;
integer remain;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth = depth / factor;
    remain = depth % factor;
    if (remain > 0) begin
        operate_depth = operate_depth + 1;
    end
end    
endtask

task write; /*{{{*/
    input  reg [ADDR_WIDTH - 1:0] waddr;   // write address
    input  reg [DATA_WIDTH - 1:0] wdata;   // write data
    output reg wresp;
    reg aw_flag;
    reg w_flag;
    reg [DATA_WIDTH/8 - 1:0] wstrb_reg;
    integer i;
begin 
    wresp = 0;
    aw_flag = 0;
    w_flag = 0;
//=======================one single write operate======================
    AWADDR_reg <= waddr;
    AWVALID_reg <= 1;
    WDATA_reg <= wdata;
    WVALID_reg <= 1;
    for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin
        wstrb_reg [i] = 1;
    end    
    WSTRB_reg <= wstrb_reg;
    while (!(aw_flag && w_flag)) begin
        @(posedge clk);
        if (aw_flag != 1)
            aw_flag = TRAN_s_axi_control_AWREADY & AWVALID_reg;
        if (w_flag != 1)
            w_flag = TRAN_s_axi_control_WREADY & WVALID_reg;
        AWVALID_reg <= !aw_flag;
        WVALID_reg <= !w_flag;
    end

    BREADY_reg <= 1;
    while (TRAN_s_axi_control_BVALID != 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    BREADY_reg <= 0;
    if (TRAN_s_axi_control_BRESP === 2'b00) begin
        wresp = 1;
        //input success. in fact BRESP is always 2'b00
    end   
//=======================one single write operate======================

end
endtask/*}}}*/

task read (/*{{{*/
    input  [ADDR_WIDTH - 1:0] raddr ,   // write address
    output [DATA_WIDTH - 1:0] RDATA_result ,
    output rresp
);
begin 
    rresp = 0;
//=======================one single read operate======================
    ARADDR_reg <= raddr;
    ARVALID_reg <= 1;
    while (TRAN_s_axi_control_ARREADY !== 1) begin
        @(posedge clk);
    end
    @(posedge clk);
    ARVALID_reg <= 0;
    RREADY_reg <= 1;
    while (TRAN_s_axi_control_RVALID !== 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    RDATA_result  <= TRAN_s_axi_control_RDATA;
    RREADY_reg <= 0;
    if (TRAN_s_axi_control_RRESP === 2'b00 ) begin
        rresp <= 1;
        //output success. in fact RRESP is always 2'b00
    end  
    @(posedge clk);

//=======================one single read operate end======================

end
endtask/*}}}*/

initial begin : ready_initial_process
    ready_initial = 0;
    wait(reset === 1);
    @(posedge clk);
    ready_initial = 1;
    @(posedge clk);
    ready_initial = 0;
end

initial begin : update_status
    integer process_num ;
    integer read_status_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 0;
    while (1) begin
        process_0_finish = 0;
        AESL_done_index_reg         <= 0;
        AESL_ready_out_index_reg        <= 0;
        if (ongoing_process_number === process_num && process_busy === 0) begin
            process_busy = 1;
            read (STATUS_ADDR, RDATA_reg, read_status_resp);
                AESL_done_index_reg         <= RDATA_reg[1 : 1];
                AESL_ready_out_index_reg    <= RDATA_reg[1 : 1];
                AESL_idle_index_reg         <= RDATA_reg[2 : 2];
            process_0_finish = 1;
            process_busy = 0;
        end 
        @(posedge clk);
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_d_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (d_c_bitwidth, d_DEPTH, d_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_d_run_flag <= 1; 
        end
        else if ((write_one_d_data_done == 1 && write_d_count == d_diff_count - 1) || d_diff_count == 0) begin
            write_d_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_d_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_d_count = 0;
        end
        if (write_one_d_data_done === 1) begin
            write_d_count = write_d_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        d_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            d_write_data_finish <= 0;
        end
        if (write_d_run_flag == 1 && write_d_count == d_diff_count) begin
            d_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_d
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] d_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = d_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        d_diff_count = 0;

        for (k = 0; k < d_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (d_c_bitwidth < 32) begin
                    d_data_tmp_reg = mem_d[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < d_c_bitwidth) begin
                            d_data_tmp_reg[j] = mem_d[k][i*32 + j];
                        end
                        else begin
                            d_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_d[k * four_byte_num  + i]!==d_data_tmp_reg) begin
                d_diff_count = d_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_d
    integer write_d_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_d_count;
    reg [31 : 0] d_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = d_c_bitwidth;
    process_num = 1;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_1_finish <= 0;

        for (check_d_count = 0; check_d_count < d_OPERATE_DEPTH; check_d_count = check_d_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_d_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write d data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (d_c_bitwidth < 32) begin
                        d_data_tmp_reg = mem_d[check_d_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < d_c_bitwidth) begin
                                d_data_tmp_reg[j] = mem_d[check_d_count][i*32 + j];
                            end
                            else begin
                                d_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_d[check_d_count * four_byte_num  + i]!==d_data_tmp_reg) begin
                        image_mem_d[check_d_count * four_byte_num + i]=d_data_tmp_reg;
                        write (d_data_in_addr + check_d_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, d_data_tmp_reg, write_d_resp);
                        write_one_d_data_done <= 1;
                        @(posedge clk);
                        write_one_d_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_1_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_gamma_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (gamma_c_bitwidth, gamma_DEPTH, gamma_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_gamma_run_flag <= 1; 
        end
        else if ((write_one_gamma_data_done == 1 && write_gamma_count == gamma_diff_count - 1) || gamma_diff_count == 0) begin
            write_gamma_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_gamma_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_gamma_count = 0;
        end
        if (write_one_gamma_data_done === 1) begin
            write_gamma_count = write_gamma_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        gamma_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            gamma_write_data_finish <= 0;
        end
        if (write_gamma_run_flag == 1 && write_gamma_count == gamma_diff_count) begin
            gamma_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_gamma
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] gamma_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = gamma_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        gamma_diff_count = 0;

        for (k = 0; k < gamma_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (gamma_c_bitwidth < 32) begin
                    gamma_data_tmp_reg = mem_gamma[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < gamma_c_bitwidth) begin
                            gamma_data_tmp_reg[j] = mem_gamma[k][i*32 + j];
                        end
                        else begin
                            gamma_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_gamma[k * four_byte_num  + i]!==gamma_data_tmp_reg) begin
                gamma_diff_count = gamma_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_gamma
    integer write_gamma_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_gamma_count;
    reg [31 : 0] gamma_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = gamma_c_bitwidth;
    process_num = 2;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_2_finish <= 0;

        for (check_gamma_count = 0; check_gamma_count < gamma_OPERATE_DEPTH; check_gamma_count = check_gamma_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_gamma_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write gamma data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (gamma_c_bitwidth < 32) begin
                        gamma_data_tmp_reg = mem_gamma[check_gamma_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < gamma_c_bitwidth) begin
                                gamma_data_tmp_reg[j] = mem_gamma[check_gamma_count][i*32 + j];
                            end
                            else begin
                                gamma_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_gamma[check_gamma_count * four_byte_num  + i]!==gamma_data_tmp_reg) begin
                        image_mem_gamma[check_gamma_count * four_byte_num + i]=gamma_data_tmp_reg;
                        write (gamma_data_in_addr + check_gamma_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, gamma_data_tmp_reg, write_gamma_resp);
                        write_one_gamma_data_done <= 1;
                        @(posedge clk);
                        write_one_gamma_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_2_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_beta_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (beta_c_bitwidth, beta_DEPTH, beta_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_beta_run_flag <= 1; 
        end
        else if ((write_one_beta_data_done == 1 && write_beta_count == beta_diff_count - 1) || beta_diff_count == 0) begin
            write_beta_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_beta_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_beta_count = 0;
        end
        if (write_one_beta_data_done === 1) begin
            write_beta_count = write_beta_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        beta_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            beta_write_data_finish <= 0;
        end
        if (write_beta_run_flag == 1 && write_beta_count == beta_diff_count) begin
            beta_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_beta
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] beta_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = beta_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        beta_diff_count = 0;

        for (k = 0; k < beta_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (beta_c_bitwidth < 32) begin
                    beta_data_tmp_reg = mem_beta[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < beta_c_bitwidth) begin
                            beta_data_tmp_reg[j] = mem_beta[k][i*32 + j];
                        end
                        else begin
                            beta_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_beta[k * four_byte_num  + i]!==beta_data_tmp_reg) begin
                beta_diff_count = beta_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_beta
    integer write_beta_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_beta_count;
    reg [31 : 0] beta_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = beta_c_bitwidth;
    process_num = 3;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_3_finish <= 0;

        for (check_beta_count = 0; check_beta_count < beta_OPERATE_DEPTH; check_beta_count = check_beta_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_beta_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write beta data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (beta_c_bitwidth < 32) begin
                        beta_data_tmp_reg = mem_beta[check_beta_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < beta_c_bitwidth) begin
                                beta_data_tmp_reg[j] = mem_beta[check_beta_count][i*32 + j];
                            end
                            else begin
                                beta_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_beta[check_beta_count * four_byte_num  + i]!==beta_data_tmp_reg) begin
                        image_mem_beta[check_beta_count * four_byte_num + i]=beta_data_tmp_reg;
                        write (beta_data_in_addr + check_beta_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, beta_data_tmp_reg, write_beta_resp);
                        write_one_beta_data_done <= 1;
                        @(posedge clk);
                        write_one_beta_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_3_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_get_best_state_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (get_best_state_c_bitwidth, get_best_state_DEPTH, get_best_state_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_get_best_state_run_flag <= 1; 
        end
        else if ((write_one_get_best_state_data_done == 1 && write_get_best_state_count == get_best_state_diff_count - 1) || get_best_state_diff_count == 0) begin
            write_get_best_state_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_get_best_state_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_get_best_state_count = 0;
        end
        if (write_one_get_best_state_data_done === 1) begin
            write_get_best_state_count = write_get_best_state_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        get_best_state_write_data_finish <= 0;
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            get_best_state_write_data_finish <= 0;
        end
        if (write_get_best_state_run_flag == 1 && write_get_best_state_count == get_best_state_diff_count) begin
            get_best_state_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_get_best_state
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] get_best_state_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = get_best_state_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        get_best_state_diff_count = 0;

        for (k = 0; k < get_best_state_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (get_best_state_c_bitwidth < 32) begin
                    get_best_state_data_tmp_reg = mem_get_best_state[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < get_best_state_c_bitwidth) begin
                            get_best_state_data_tmp_reg[j] = mem_get_best_state[k][i*32 + j];
                        end
                        else begin
                            get_best_state_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_get_best_state[k * four_byte_num  + i]!==get_best_state_data_tmp_reg) begin
                get_best_state_diff_count = get_best_state_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_get_best_state
    integer write_get_best_state_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_get_best_state_count;
    reg [31 : 0] get_best_state_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = get_best_state_c_bitwidth;
    process_num = 4;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_4_finish <= 0;

        for (check_get_best_state_count = 0; check_get_best_state_count < get_best_state_OPERATE_DEPTH; check_get_best_state_count = check_get_best_state_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_get_best_state_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write get_best_state data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (get_best_state_c_bitwidth < 32) begin
                        get_best_state_data_tmp_reg = mem_get_best_state[check_get_best_state_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < get_best_state_c_bitwidth) begin
                                get_best_state_data_tmp_reg[j] = mem_get_best_state[check_get_best_state_count][i*32 + j];
                            end
                            else begin
                                get_best_state_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_get_best_state[check_get_best_state_count * four_byte_num  + i]!==get_best_state_data_tmp_reg) begin
                        image_mem_get_best_state[check_get_best_state_count * four_byte_num + i]=get_best_state_data_tmp_reg;
                        write (get_best_state_data_in_addr + check_get_best_state_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, get_best_state_data_tmp_reg, write_get_best_state_resp);
                        write_one_get_best_state_data_done <= 1;
                        @(posedge clk);
                        write_one_get_best_state_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_4_finish <= 1;
        @(posedge clk);
    end    
end


always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_start_run_flag <= 0; 
        write_start_count <= 0;
    end
    else begin
        if (write_start_count >= 1) begin
            write_start_run_flag <= 0; 
        end
        else if (TRAN_control_write_start_in === 1) begin
            write_start_run_flag <= 1; 
        end
        if (AESL_write_start_finish === 1) begin
            write_start_count <= write_start_count + 1;
            write_start_run_flag <= 0; 
        end
    end
end

initial begin : write_start
    reg [DATA_WIDTH - 1 : 0] write_start_tmp;
    integer process_num;
    integer write_start_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 5;
    while (1) begin
        process_5_finish = 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (write_start_run_flag === 1) begin
                process_busy = 1;
                write_start_tmp=0;
                write_start_tmp[0 : 0] = 1;
                write (START_ADDR, write_start_tmp, write_start_resp);
                process_busy = 0;
                AESL_write_start_finish <= 1;
                @(posedge clk);
                AESL_write_start_finish <= 0;
            end
            process_5_finish <= 1;
        end 
        @(posedge clk);
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        best_state_read_data_finish <= 0;
        read_best_state_run_flag <= 0; 
        read_best_state_count = 0;
        count_operate_depth_by_bitwidth_and_depth (best_state_c_bitwidth, best_state_DEPTH, best_state_OPERATE_DEPTH);
    end
    else begin
        if (AESL_done_index_reg === 1) begin
            read_best_state_run_flag = 1; 
        end
        if (TRAN_control_transaction_done_in === 1) begin
            best_state_read_data_finish <= 0;
            read_best_state_count = 0; 
        end
        if (read_one_best_state_data_done === 1) begin
            read_best_state_count = read_best_state_count + 1;
            if (read_best_state_count == best_state_OPERATE_DEPTH) begin
                read_best_state_run_flag <= 0; 
                best_state_read_data_finish <= 1;
            end
        end
    end
end

initial begin : read_best_state
    integer read_best_state_resp;
    integer process_num;
    integer get_vld;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;

    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = best_state_c_bitwidth;
    process_num = 6;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_6_finish <= 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (read_best_state_run_flag === 1) begin
                process_busy = 1;
                get_vld = 0;
                //read best_state vld
                read (best_state_valid_out_addr, RDATA_reg, read_best_state_resp);
                if (RDATA_reg[0 : 0] == 1) begin
                    get_vld = 1;
                end
                if (get_vld == 1) begin
                    //read best_state data 
                    for (i = 0 ; i < four_byte_num ; i = i+1) begin
                        read (best_state_data_out_addr + read_best_state_count * four_byte_num * 4 + i * 4, RDATA_reg, read_best_state_resp);
                        if (best_state_c_bitwidth < 32) begin
                            mem_best_state[read_best_state_count] <= RDATA_reg;
                        end
                        else begin
                            for (j=0 ; j < 32 ; j = j + 1) begin
                                if (i*32 + j < best_state_c_bitwidth) begin
                                    mem_best_state[read_best_state_count][i*32 + j] <= RDATA_reg[j];
                                end
                            end
                        end
                    end
                    
                    read_one_best_state_data_done <= 1;
                    @(posedge clk);
                    read_one_best_state_data_done <= 0;
                end    
                process_busy = 0;
            end    
            process_6_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        ap_return_read_data_finish <= 0;
        read_ap_return_run_flag <= 0; 
        read_ap_return_count = 0;
        count_operate_depth_by_bitwidth_and_depth (ap_return_c_bitwidth, ap_return_DEPTH, ap_return_OPERATE_DEPTH);
    end
    else begin
        if (AESL_done_index_reg === 1) begin
            read_ap_return_run_flag = 1; 
        end
        if (TRAN_control_transaction_done_in === 1) begin
            ap_return_read_data_finish <= 0;
            read_ap_return_count = 0; 
        end
        if (read_one_ap_return_data_done === 1) begin
            read_ap_return_count = read_ap_return_count + 1;
            if (read_ap_return_count == ap_return_OPERATE_DEPTH) begin
                read_ap_return_run_flag <= 0; 
                ap_return_read_data_finish <= 1;
            end
        end
    end
end

initial begin : read_ap_return
    integer read_ap_return_resp;
    integer process_num;
    integer get_vld;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;

    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = ap_return_c_bitwidth;
    process_num = 7;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_7_finish <= 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (read_ap_return_run_flag === 1) begin
                process_busy = 1;
                get_vld = 1;
                if (get_vld == 1) begin
                    //read ap_return data 
                    for (i = 0 ; i < four_byte_num ; i = i+1) begin
                        read (ap_return_data_out_addr + read_ap_return_count * four_byte_num * 4 + i * 4, RDATA_reg, read_ap_return_resp);
                        if (ap_return_c_bitwidth < 32) begin
                            mem_ap_return[read_ap_return_count] <= RDATA_reg;
                        end
                        else begin
                            for (j=0 ; j < 32 ; j = j + 1) begin
                                if (i*32 + j < ap_return_c_bitwidth) begin
                                    mem_ap_return[read_ap_return_count][i*32 + j] <= RDATA_reg[j];
                                end
                            end
                        end
                    end
                    
                    read_one_ap_return_data_done <= 1;
                    @(posedge clk);
                    read_one_ap_return_data_done <= 0;
                end    
                process_busy = 0;
            end    
            process_7_finish <= 1;
        end
        @(posedge clk);
    end    
end
//------------------------Task and function-------------- 
task read_token; 
    input integer fp; 
    output reg [127 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end 
endtask 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_d_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [32 - 1 : 0] token_tmp; 
  //reg [d_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (d_c_bitwidth , factor);
  fp = $fopen(`TV_IN_d ,"rb"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_d); 
      $finish; 
  end 
  $fread(trans_depth,fp);
  while (trans_depth != 64'h5a5aa5a50f0ff0f0)  begin
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < d_DEPTH; i = i + 1) begin 
         $fread(token_tmp,fp);
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_d [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_d [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_d [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_d [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_d [i/factor] = tmp_cache_mem;
          end
      end 
      $fread(trans_depth,fp);
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_d;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_gamma_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [gamma_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (gamma_c_bitwidth , factor);
  fp = $fopen(`TV_IN_gamma ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_gamma); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < gamma_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_gamma [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_gamma [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_gamma [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_gamma [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_gamma [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_gamma;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_beta_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [beta_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (beta_c_bitwidth , factor);
  fp = $fopen(`TV_IN_beta ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_beta); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < beta_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_beta [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_beta [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_beta [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_beta [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_beta [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_beta;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_get_best_state_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [get_best_state_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (get_best_state_c_bitwidth , factor);
  fp = $fopen(`TV_IN_get_best_state ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_get_best_state); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < get_best_state_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_get_best_state [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_get_best_state [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_get_best_state [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_get_best_state [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_get_best_state [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_get_best_state;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
task write_binary_best_state;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Write file----------------------- 
 
// Write data to file 
 
initial begin : write_best_state_file_proc 
  integer fp; 
  integer factor; 
  integer transaction_idx; 
  reg [best_state_c_bitwidth - 1 : 0] tmp_cache_mem; 
  reg [ 100*8 : 1] str;
  reg [63:0] bin_data;
  integer i; 
  transaction_idx = 0; 
  count_seperate_factor_by_bitwidth (best_state_c_bitwidth , factor);
  while(1) begin 
      @(posedge clk);
      while (best_state_read_data_finish !== 1 || TRAN_control_transaction_done_in === 1) begin
          @(posedge clk);
      end
      # 0.1;
      fp = $fopen(`TV_OUT_best_state, "a"); 
      if(fp == 0) begin       // Failed to open file 
          $display("Failed to open file \"%s\"!", `TV_OUT_best_state); 
          $finish; 
      end 
      $fdisplay(fp, "[[transaction]] %d", transaction_idx);
      for (i = 0; i < (best_state_DEPTH - best_state_DEPTH % factor); i = i + 1) begin
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem = mem_best_state[i/factor][7:0];
              end
              if (i%factor == 1) begin
                  tmp_cache_mem = mem_best_state[i/factor][15:8];
              end
              if (i%factor == 2) begin
                  tmp_cache_mem = mem_best_state[i/factor][23:16];
              end
              if (i%factor == 3) begin
                  tmp_cache_mem = mem_best_state[i/factor][31:24];
              end
              $fdisplay(fp,"0x%x",tmp_cache_mem);
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem = mem_best_state[i/factor][15:0];
              end
              if (i%factor == 1) begin
                  tmp_cache_mem = mem_best_state[i/factor][31:16];
              end
              $fdisplay(fp,"0x%x",tmp_cache_mem);
          end
          if (factor == 1) begin
              $fdisplay(fp,"0x%x",mem_best_state[i]);
          end
      end 
      if (factor == 4) begin
          if ((best_state_DEPTH - 1) % factor == 2) begin
              $fdisplay(fp,"0x%x",mem_best_state[best_state_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_best_state[best_state_DEPTH / factor][15:8]);
              $fdisplay(fp,"0x%x",mem_best_state[best_state_DEPTH / factor][23:16]);
          end
          if ((best_state_DEPTH - 1) % factor == 1) begin
              $fdisplay(fp,"0x%x",mem_best_state[best_state_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_best_state[best_state_DEPTH / factor][15:8]);
          end
          if ((best_state_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_best_state[best_state_DEPTH / factor][7:0]);
          end
      end
      if (factor == 2) begin
          if ((best_state_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_best_state[best_state_DEPTH / factor][15:0]);
          end
      end
      $fdisplay(fp, "[[/transaction]]");
      transaction_idx = transaction_idx + 1;
      $fclose(fp); 
      while (TRAN_control_start_in !== 1) begin
          @(posedge clk);
      end
  end 
end 
 
task write_binary_ap_return;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Write file----------------------- 
 
// Write data to file 
 
initial begin : write_ap_return_file_proc 
  integer fp; 
  integer factor; 
  integer transaction_idx; 
  reg [ap_return_c_bitwidth - 1 : 0] tmp_cache_mem; 
  reg [ 100*8 : 1] str;
  reg [63:0] bin_data;
  integer i; 
  transaction_idx = 0; 
  count_seperate_factor_by_bitwidth (ap_return_c_bitwidth , factor);
  while(1) begin 
      @(posedge clk);
      while (TRAN_control_transaction_done_in !== 1) begin
          @(posedge clk);
      end
      # 0.1;
      fp = $fopen(`TV_OUT_ap_return, "a"); 
      if(fp == 0) begin       // Failed to open file 
          $display("Failed to open file \"%s\"!", `TV_OUT_ap_return); 
          $finish; 
      end 
      $fdisplay(fp, "[[transaction]] %d", transaction_idx);
      for (i = 0; i < (ap_return_DEPTH - ap_return_DEPTH % factor); i = i + 1) begin
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem = mem_ap_return[i/factor][7:0];
              end
              if (i%factor == 1) begin
                  tmp_cache_mem = mem_ap_return[i/factor][15:8];
              end
              if (i%factor == 2) begin
                  tmp_cache_mem = mem_ap_return[i/factor][23:16];
              end
              if (i%factor == 3) begin
                  tmp_cache_mem = mem_ap_return[i/factor][31:24];
              end
              $fdisplay(fp,"0x%x",tmp_cache_mem);
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem = mem_ap_return[i/factor][15:0];
              end
              if (i%factor == 1) begin
                  tmp_cache_mem = mem_ap_return[i/factor][31:16];
              end
              $fdisplay(fp,"0x%x",tmp_cache_mem);
          end
          if (factor == 1) begin
              $fdisplay(fp,"0x%x",mem_ap_return[i]);
          end
      end 
      if (factor == 4) begin
          if ((ap_return_DEPTH - 1) % factor == 2) begin
              $fdisplay(fp,"0x%x",mem_ap_return[ap_return_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_ap_return[ap_return_DEPTH / factor][15:8]);
              $fdisplay(fp,"0x%x",mem_ap_return[ap_return_DEPTH / factor][23:16]);
          end
          if ((ap_return_DEPTH - 1) % factor == 1) begin
              $fdisplay(fp,"0x%x",mem_ap_return[ap_return_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_ap_return[ap_return_DEPTH / factor][15:8]);
          end
          if ((ap_return_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_ap_return[ap_return_DEPTH / factor][7:0]);
          end
      end
      if (factor == 2) begin
          if ((ap_return_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_ap_return[ap_return_DEPTH / factor][15:0]);
          end
      end
      $fdisplay(fp, "[[/transaction]]");
      transaction_idx = transaction_idx + 1;
      $fclose(fp); 
  end 
end 
 
endmodule
