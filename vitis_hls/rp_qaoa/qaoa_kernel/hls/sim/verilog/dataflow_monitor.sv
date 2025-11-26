
`include "dump_file_agent.svh"
`include "csv_file_dump.svh"
`include "sample_agent.svh"
`include "loop_sample_agent.svh"
`include "sample_manager.svh"
`include "nodf_module_interface.svh"
`include "nodf_module_monitor.svh"
`include "df_fifo_interface.svh"
`include "df_fifo_monitor.svh"
`include "df_process_interface.svh"
`include "df_process_monitor.svh"
`include "seq_loop_interface.svh"
`include "seq_loop_monitor.svh"
`include "upc_loop_interface.svh"
`include "upc_loop_monitor.svh"
`timescale 1ns/1ps

// top module for dataflow related monitors
module dataflow_monitor(
input logic clock,
input logic reset,
input logic finish
);

    df_fifo_intf fifo_intf_1(clock,reset);
    assign fifo_intf_1.rd_en = AESL_inst_qaoa_kernel.retval_0_loc_channel1_U.if_read & AESL_inst_qaoa_kernel.retval_0_loc_channel1_U.if_empty_n;
    assign fifo_intf_1.wr_en = AESL_inst_qaoa_kernel.retval_0_loc_channel1_U.if_write & AESL_inst_qaoa_kernel.retval_0_loc_channel1_U.if_full_n;
    assign fifo_intf_1.fifo_rd_block = 0;
    assign fifo_intf_1.fifo_wr_block = 0;
    assign fifo_intf_1.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump fifo_csv_dumper_1;
    csv_file_dump cstatus_csv_dumper_1;
    df_fifo_monitor fifo_monitor_1;

logic region_0_idle;
logic [31:0] region_0_start_cnt;
logic [31:0] region_0_done_cnt;
assign region_0_idle = (region_0_start_cnt == region_0_done_cnt) && AESL_inst_qaoa_kernel.ap_start == 1'b0 ;
always @(posedge clock) begin
    if (reset == 1'b1)
        region_0_start_cnt <= 32'h0;
    else if (AESL_inst_qaoa_kernel.ap_start == 1'b1 && AESL_inst_qaoa_kernel.ap_ready == 1'b1)
        region_0_start_cnt <= region_0_start_cnt + 32'h1;
    else;
end
always @(posedge clock) begin
    if (reset == 1'b1)
        region_0_done_cnt <= 32'h0;
    else if (AESL_inst_qaoa_kernel.ap_done == 1'b1)
        region_0_done_cnt <= region_0_done_cnt + 32'h1;
    else;
end


    df_process_intf process_intf_1(clock,reset);
    assign process_intf_1.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.ap_start;
    assign process_intf_1.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.ap_ready;
    assign process_intf_1.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.ap_done;
    assign process_intf_1.ap_continue = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.ap_continue;
    assign process_intf_1.real_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.ap_start;
    assign process_intf_1.pin_stall = 1'b0;
    assign process_intf_1.pout_stall = 1'b0;
    assign process_intf_1.cin_stall = 1'b0;
    assign process_intf_1.cout_stall = 1'b0;
    assign process_intf_1.region_idle = region_0_idle;
    assign process_intf_1.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_1;
    csv_file_dump pstatus_csv_dumper_1;
    df_process_monitor process_monitor_1;
    df_process_intf process_intf_2(clock,reset);
    assign process_intf_2.ap_start = AESL_inst_qaoa_kernel.Block_entry_proc_proc_U0.ap_start;
    assign process_intf_2.ap_ready = AESL_inst_qaoa_kernel.Block_entry_proc_proc_U0.ap_ready;
    assign process_intf_2.ap_done = AESL_inst_qaoa_kernel.Block_entry_proc_proc_U0.ap_done;
    assign process_intf_2.ap_continue = AESL_inst_qaoa_kernel.Block_entry_proc_proc_U0.ap_continue;
    assign process_intf_2.real_start = AESL_inst_qaoa_kernel.Block_entry_proc_proc_U0.ap_start;
    assign process_intf_2.pin_stall = 1'b0;
    assign process_intf_2.pout_stall = 1'b0;
    assign process_intf_2.cin_stall = 1'b0;
    assign process_intf_2.cout_stall = 1'b0;
    assign process_intf_2.region_idle = region_0_idle;
    assign process_intf_2.finish = finish | deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock;
    csv_file_dump pstall_csv_dumper_2;
    csv_file_dump pstatus_csv_dumper_2;
    df_process_monitor process_monitor_2;

    nodf_module_intf module_intf_1(clock,reset);
    assign module_intf_1.ap_start = AESL_inst_qaoa_kernel.ap_start;
    assign module_intf_1.ap_ready = AESL_inst_qaoa_kernel.ap_ready;
    assign module_intf_1.ap_done = AESL_inst_qaoa_kernel.ap_done;
    assign module_intf_1.ap_continue = 1'b1;
    assign module_intf_1.finish = finish;
    csv_file_dump mstatus_csv_dumper_1;
    nodf_module_monitor module_monitor_1;
    nodf_module_intf module_intf_2(clock,reset);
    assign module_intf_2.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_start;
    assign module_intf_2.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_ready;
    assign module_intf_2.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_done;
    assign module_intf_2.ap_continue = 1'b1;
    assign module_intf_2.finish = finish;
    csv_file_dump mstatus_csv_dumper_2;
    nodf_module_monitor module_monitor_2;
    nodf_module_intf module_intf_3(clock,reset);
    assign module_intf_3.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.ap_start;
    assign module_intf_3.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.ap_ready;
    assign module_intf_3.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.ap_done;
    assign module_intf_3.ap_continue = 1'b1;
    assign module_intf_3.finish = finish;
    csv_file_dump mstatus_csv_dumper_3;
    nodf_module_monitor module_monitor_3;
    nodf_module_intf module_intf_4(clock,reset);
    assign module_intf_4.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_start;
    assign module_intf_4.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_ready;
    assign module_intf_4.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_done;
    assign module_intf_4.ap_continue = 1'b1;
    assign module_intf_4.finish = finish;
    csv_file_dump mstatus_csv_dumper_4;
    nodf_module_monitor module_monitor_4;
    nodf_module_intf module_intf_5(clock,reset);
    assign module_intf_5.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_start;
    assign module_intf_5.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_ready;
    assign module_intf_5.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_done;
    assign module_intf_5.ap_continue = 1'b1;
    assign module_intf_5.finish = finish;
    csv_file_dump mstatus_csv_dumper_5;
    nodf_module_monitor module_monitor_5;
    nodf_module_intf module_intf_6(clock,reset);
    assign module_intf_6.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209.ap_start;
    assign module_intf_6.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209.ap_ready;
    assign module_intf_6.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209.ap_done;
    assign module_intf_6.ap_continue = 1'b1;
    assign module_intf_6.finish = finish;
    csv_file_dump mstatus_csv_dumper_6;
    nodf_module_monitor module_monitor_6;
    nodf_module_intf module_intf_7(clock,reset);
    assign module_intf_7.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_start;
    assign module_intf_7.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ready;
    assign module_intf_7.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_done;
    assign module_intf_7.ap_continue = 1'b1;
    assign module_intf_7.finish = finish;
    csv_file_dump mstatus_csv_dumper_7;
    nodf_module_monitor module_monitor_7;
    nodf_module_intf module_intf_8(clock,reset);
    assign module_intf_8.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_start;
    assign module_intf_8.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_ready;
    assign module_intf_8.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_done;
    assign module_intf_8.ap_continue = 1'b1;
    assign module_intf_8.finish = finish;
    csv_file_dump mstatus_csv_dumper_8;
    nodf_module_monitor module_monitor_8;
    nodf_module_intf module_intf_9(clock,reset);
    assign module_intf_9.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_start;
    assign module_intf_9.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_ready;
    assign module_intf_9.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_done;
    assign module_intf_9.ap_continue = 1'b1;
    assign module_intf_9.finish = finish;
    csv_file_dump mstatus_csv_dumper_9;
    nodf_module_monitor module_monitor_9;
    nodf_module_intf module_intf_10(clock,reset);
    assign module_intf_10.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_start;
    assign module_intf_10.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_ready;
    assign module_intf_10.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_done;
    assign module_intf_10.ap_continue = 1'b1;
    assign module_intf_10.finish = finish;
    csv_file_dump mstatus_csv_dumper_10;
    nodf_module_monitor module_monitor_10;
    nodf_module_intf module_intf_11(clock,reset);
    assign module_intf_11.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_start;
    assign module_intf_11.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_ready;
    assign module_intf_11.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_done;
    assign module_intf_11.ap_continue = 1'b1;
    assign module_intf_11.finish = finish;
    csv_file_dump mstatus_csv_dumper_11;
    nodf_module_monitor module_monitor_11;
    nodf_module_intf module_intf_12(clock,reset);
    assign module_intf_12.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_start;
    assign module_intf_12.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_ready;
    assign module_intf_12.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_done;
    assign module_intf_12.ap_continue = 1'b1;
    assign module_intf_12.finish = finish;
    csv_file_dump mstatus_csv_dumper_12;
    nodf_module_monitor module_monitor_12;
    nodf_module_intf module_intf_13(clock,reset);
    assign module_intf_13.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_start;
    assign module_intf_13.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_ready;
    assign module_intf_13.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_done;
    assign module_intf_13.ap_continue = 1'b1;
    assign module_intf_13.finish = finish;
    csv_file_dump mstatus_csv_dumper_13;
    nodf_module_monitor module_monitor_13;
    nodf_module_intf module_intf_14(clock,reset);
    assign module_intf_14.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_start;
    assign module_intf_14.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_ready;
    assign module_intf_14.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_done;
    assign module_intf_14.ap_continue = 1'b1;
    assign module_intf_14.finish = finish;
    csv_file_dump mstatus_csv_dumper_14;
    nodf_module_monitor module_monitor_14;
    nodf_module_intf module_intf_15(clock,reset);
    assign module_intf_15.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.ap_start;
    assign module_intf_15.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.ap_ready;
    assign module_intf_15.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.ap_done;
    assign module_intf_15.ap_continue = 1'b1;
    assign module_intf_15.finish = finish;
    csv_file_dump mstatus_csv_dumper_15;
    nodf_module_monitor module_monitor_15;
    nodf_module_intf module_intf_16(clock,reset);
    assign module_intf_16.ap_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_start;
    assign module_intf_16.ap_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_ready;
    assign module_intf_16.ap_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_done;
    assign module_intf_16.ap_continue = 1'b1;
    assign module_intf_16.finish = finish;
    csv_file_dump mstatus_csv_dumper_16;
    nodf_module_monitor module_monitor_16;

    seq_loop_intf#(23) seq_loop_intf_1(clock,reset);
    assign seq_loop_intf_1.pre_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state18;
    assign seq_loop_intf_1.pre_states_valid = 1'b1;
    assign seq_loop_intf_1.post_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state18;
    assign seq_loop_intf_1.post_states_valid = 1'b1;
    assign seq_loop_intf_1.quit_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state19;
    assign seq_loop_intf_1.quit_states_valid = 1'b1;
    assign seq_loop_intf_1.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_CS_fsm;
    assign seq_loop_intf_1.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state19;
    assign seq_loop_intf_1.iter_end_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state22;
    assign seq_loop_intf_1.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_1.one_state_loop = 1'b0;
    assign seq_loop_intf_1.one_state_block = 1'b0;
    assign seq_loop_intf_1.finish = finish;
    csv_file_dump seq_loop_csv_dumper_1;
    seq_loop_monitor #(23) seq_loop_monitor_1;
    seq_loop_intf#(23) seq_loop_intf_2(clock,reset);
    assign seq_loop_intf_2.pre_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state17;
    assign seq_loop_intf_2.pre_states_valid = 1'b1;
    assign seq_loop_intf_2.post_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state17;
    assign seq_loop_intf_2.post_states_valid = 1'b1;
    assign seq_loop_intf_2.quit_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state18;
    assign seq_loop_intf_2.quit_states_valid = 1'b1;
    assign seq_loop_intf_2.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_CS_fsm;
    assign seq_loop_intf_2.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state18;
    assign seq_loop_intf_2.iter_end_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state19;
    assign seq_loop_intf_2.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_2.one_state_loop = 1'b0;
    assign seq_loop_intf_2.one_state_block = 1'b0;
    assign seq_loop_intf_2.finish = finish;
    csv_file_dump seq_loop_csv_dumper_2;
    seq_loop_monitor #(23) seq_loop_monitor_2;
    seq_loop_intf#(23) seq_loop_intf_3(clock,reset);
    assign seq_loop_intf_3.pre_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state16;
    assign seq_loop_intf_3.pre_states_valid = 1'b1;
    assign seq_loop_intf_3.post_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state23;
    assign seq_loop_intf_3.post_states_valid = 1'b1;
    assign seq_loop_intf_3.quit_loop_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state17;
    assign seq_loop_intf_3.quit_states_valid = 1'b1;
    assign seq_loop_intf_3.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_CS_fsm;
    assign seq_loop_intf_3.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state17;
    assign seq_loop_intf_3.iter_end_state0 = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.ap_ST_fsm_state18;
    assign seq_loop_intf_3.iter_end_states_valid = 1'b1;
    assign seq_loop_intf_3.one_state_loop = 1'b0;
    assign seq_loop_intf_3.one_state_block = 1'b0;
    assign seq_loop_intf_3.finish = finish;
    csv_file_dump seq_loop_csv_dumper_3;
    seq_loop_monitor #(23) seq_loop_monitor_3;
    upc_loop_intf#(1) upc_loop_intf_1(clock,reset);
    assign upc_loop_intf_1.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_CS_fsm;
    assign upc_loop_intf_1.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_ST_fsm_state1;
    assign upc_loop_intf_1.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_ST_fsm_state1;
    assign upc_loop_intf_1.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_ST_fsm_state1;
    assign upc_loop_intf_1.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_1.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_1.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_1.iter_start_enable = 1'b1;
    assign upc_loop_intf_1.iter_end_enable = 1'b1;
    assign upc_loop_intf_1.quit_enable = 1'b1;
    assign upc_loop_intf_1.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_start;
    assign upc_loop_intf_1.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_ready;
    assign upc_loop_intf_1.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.ap_done_int;
    assign upc_loop_intf_1.loop_continue = 1'b1;
    assign upc_loop_intf_1.quit_at_end = 1'b1;
    assign upc_loop_intf_1.finish = finish;
    csv_file_dump upc_loop_csv_dumper_1;
    upc_loop_monitor #(1) upc_loop_monitor_1;
    upc_loop_intf#(1) upc_loop_intf_2(clock,reset);
    assign upc_loop_intf_2.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_CS_fsm;
    assign upc_loop_intf_2.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_2.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_2.iter_start_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_2.iter_end_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_2.quit_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_2.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_start;
    assign upc_loop_intf_2.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_ready;
    assign upc_loop_intf_2.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.ap_done_int;
    assign upc_loop_intf_2.loop_continue = 1'b1;
    assign upc_loop_intf_2.quit_at_end = 1'b1;
    assign upc_loop_intf_2.finish = finish;
    csv_file_dump upc_loop_csv_dumper_2;
    upc_loop_monitor #(1) upc_loop_monitor_2;
    upc_loop_intf#(9) upc_loop_intf_3(clock,reset);
    assign upc_loop_intf_3.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_CS_fsm;
    assign upc_loop_intf_3.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_3.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_ST_fsm_pp0_stage8;
    assign upc_loop_intf_3.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_ST_fsm_pp0_stage8;
    assign upc_loop_intf_3.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_3.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_block_pp0_stage8_subdone;
    assign upc_loop_intf_3.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_block_pp0_stage8_subdone;
    assign upc_loop_intf_3.iter_start_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_3.iter_end_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_enable_reg_pp0_iter4;
    assign upc_loop_intf_3.quit_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_enable_reg_pp0_iter4;
    assign upc_loop_intf_3.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_start;
    assign upc_loop_intf_3.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_ready;
    assign upc_loop_intf_3.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.ap_done_int;
    assign upc_loop_intf_3.loop_continue = 1'b1;
    assign upc_loop_intf_3.quit_at_end = 1'b1;
    assign upc_loop_intf_3.finish = finish;
    csv_file_dump upc_loop_csv_dumper_3;
    upc_loop_monitor #(9) upc_loop_monitor_3;
    upc_loop_intf#(2) upc_loop_intf_4(clock,reset);
    assign upc_loop_intf_4.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_CS_fsm;
    assign upc_loop_intf_4.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_4.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_ST_fsm_pp0_stage1;
    assign upc_loop_intf_4.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_ST_fsm_pp0_stage1;
    assign upc_loop_intf_4.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_4.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_block_pp0_stage1_subdone;
    assign upc_loop_intf_4.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_block_pp0_stage1_subdone;
    assign upc_loop_intf_4.iter_start_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_4.iter_end_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_4.quit_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_4.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_start;
    assign upc_loop_intf_4.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_ready;
    assign upc_loop_intf_4.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.ap_done_int;
    assign upc_loop_intf_4.loop_continue = 1'b1;
    assign upc_loop_intf_4.quit_at_end = 1'b1;
    assign upc_loop_intf_4.finish = finish;
    csv_file_dump upc_loop_csv_dumper_4;
    upc_loop_monitor #(2) upc_loop_monitor_4;
    upc_loop_intf#(1) upc_loop_intf_5(clock,reset);
    assign upc_loop_intf_5.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_CS_fsm;
    assign upc_loop_intf_5.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_ST_fsm_state1;
    assign upc_loop_intf_5.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_ST_fsm_state1;
    assign upc_loop_intf_5.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_ST_fsm_state1;
    assign upc_loop_intf_5.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_5.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_5.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_5.iter_start_enable = 1'b1;
    assign upc_loop_intf_5.iter_end_enable = 1'b1;
    assign upc_loop_intf_5.quit_enable = 1'b1;
    assign upc_loop_intf_5.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_start;
    assign upc_loop_intf_5.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_ready;
    assign upc_loop_intf_5.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.ap_done_int;
    assign upc_loop_intf_5.loop_continue = 1'b1;
    assign upc_loop_intf_5.quit_at_end = 1'b1;
    assign upc_loop_intf_5.finish = finish;
    csv_file_dump upc_loop_csv_dumper_5;
    upc_loop_monitor #(1) upc_loop_monitor_5;
    upc_loop_intf#(1) upc_loop_intf_6(clock,reset);
    assign upc_loop_intf_6.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_CS_fsm;
    assign upc_loop_intf_6.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_ST_fsm_state1;
    assign upc_loop_intf_6.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_ST_fsm_state1;
    assign upc_loop_intf_6.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_ST_fsm_state1;
    assign upc_loop_intf_6.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_6.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_6.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_6.iter_start_enable = 1'b1;
    assign upc_loop_intf_6.iter_end_enable = 1'b1;
    assign upc_loop_intf_6.quit_enable = 1'b1;
    assign upc_loop_intf_6.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_start;
    assign upc_loop_intf_6.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_ready;
    assign upc_loop_intf_6.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.ap_done_int;
    assign upc_loop_intf_6.loop_continue = 1'b1;
    assign upc_loop_intf_6.quit_at_end = 1'b1;
    assign upc_loop_intf_6.finish = finish;
    csv_file_dump upc_loop_csv_dumper_6;
    upc_loop_monitor #(1) upc_loop_monitor_6;
    upc_loop_intf#(1) upc_loop_intf_7(clock,reset);
    assign upc_loop_intf_7.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_CS_fsm;
    assign upc_loop_intf_7.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_7.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_7.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_7.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_7.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_7.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_7.iter_start_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_7.iter_end_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_7.quit_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_7.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_start;
    assign upc_loop_intf_7.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_ready;
    assign upc_loop_intf_7.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.ap_done_int;
    assign upc_loop_intf_7.loop_continue = 1'b1;
    assign upc_loop_intf_7.quit_at_end = 1'b1;
    assign upc_loop_intf_7.finish = finish;
    csv_file_dump upc_loop_csv_dumper_7;
    upc_loop_monitor #(1) upc_loop_monitor_7;
    upc_loop_intf#(1) upc_loop_intf_8(clock,reset);
    assign upc_loop_intf_8.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_CS_fsm;
    assign upc_loop_intf_8.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_8.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_8.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_8.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_8.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_8.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_8.iter_start_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_8.iter_end_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_8.quit_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_8.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_start;
    assign upc_loop_intf_8.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_ready;
    assign upc_loop_intf_8.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.ap_done_int;
    assign upc_loop_intf_8.loop_continue = 1'b1;
    assign upc_loop_intf_8.quit_at_end = 1'b1;
    assign upc_loop_intf_8.finish = finish;
    csv_file_dump upc_loop_csv_dumper_8;
    upc_loop_monitor #(1) upc_loop_monitor_8;
    upc_loop_intf#(1) upc_loop_intf_9(clock,reset);
    assign upc_loop_intf_9.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_CS_fsm;
    assign upc_loop_intf_9.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_9.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_9.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_9.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_9.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_9.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_9.iter_start_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_9.iter_end_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_9.quit_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_enable_reg_pp0_iter1;
    assign upc_loop_intf_9.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_start;
    assign upc_loop_intf_9.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_ready;
    assign upc_loop_intf_9.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.ap_done_int;
    assign upc_loop_intf_9.loop_continue = 1'b1;
    assign upc_loop_intf_9.quit_at_end = 1'b1;
    assign upc_loop_intf_9.finish = finish;
    csv_file_dump upc_loop_csv_dumper_9;
    upc_loop_monitor #(1) upc_loop_monitor_9;
    upc_loop_intf#(4) upc_loop_intf_10(clock,reset);
    assign upc_loop_intf_10.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_CS_fsm;
    assign upc_loop_intf_10.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_ST_fsm_state1;
    assign upc_loop_intf_10.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_ST_fsm_state4;
    assign upc_loop_intf_10.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_ST_fsm_state4;
    assign upc_loop_intf_10.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_ST_fsm_state1_blk;
    assign upc_loop_intf_10.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_ST_fsm_state4_blk;
    assign upc_loop_intf_10.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_ST_fsm_state4_blk;
    assign upc_loop_intf_10.iter_start_enable = 1'b1;
    assign upc_loop_intf_10.iter_end_enable = 1'b1;
    assign upc_loop_intf_10.quit_enable = 1'b1;
    assign upc_loop_intf_10.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_start;
    assign upc_loop_intf_10.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_ready;
    assign upc_loop_intf_10.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.ap_done_int;
    assign upc_loop_intf_10.loop_continue = 1'b1;
    assign upc_loop_intf_10.quit_at_end = 1'b1;
    assign upc_loop_intf_10.finish = finish;
    csv_file_dump upc_loop_csv_dumper_10;
    upc_loop_monitor #(4) upc_loop_monitor_10;
    upc_loop_intf#(1) upc_loop_intf_11(clock,reset);
    assign upc_loop_intf_11.cur_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_CS_fsm;
    assign upc_loop_intf_11.iter_start_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_11.iter_end_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_11.quit_state = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_ST_fsm_pp0_stage0;
    assign upc_loop_intf_11.iter_start_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_11.iter_end_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_11.quit_block = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_block_pp0_stage0_subdone;
    assign upc_loop_intf_11.iter_start_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_enable_reg_pp0_iter0;
    assign upc_loop_intf_11.iter_end_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_enable_reg_pp0_iter31;
    assign upc_loop_intf_11.quit_enable = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_enable_reg_pp0_iter31;
    assign upc_loop_intf_11.loop_start = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_start;
    assign upc_loop_intf_11.loop_ready = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_ready;
    assign upc_loop_intf_11.loop_done = AESL_inst_qaoa_kernel.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.ap_done_int;
    assign upc_loop_intf_11.loop_continue = 1'b1;
    assign upc_loop_intf_11.quit_at_end = 1'b1;
    assign upc_loop_intf_11.finish = finish;
    csv_file_dump upc_loop_csv_dumper_11;
    upc_loop_monitor #(1) upc_loop_monitor_11;

    sample_manager sample_manager_inst;

initial begin
    sample_manager_inst = new;

    fifo_csv_dumper_1 = new("./depth1.csv");
    cstatus_csv_dumper_1 = new("./chan_status1.csv");
    fifo_monitor_1 = new(fifo_csv_dumper_1,fifo_intf_1,cstatus_csv_dumper_1);

    pstall_csv_dumper_1 = new("./stalling1.csv");
    pstatus_csv_dumper_1 = new("./status1.csv");
    process_monitor_1 = new(pstall_csv_dumper_1,process_intf_1,pstatus_csv_dumper_1);
    pstall_csv_dumper_2 = new("./stalling2.csv");
    pstatus_csv_dumper_2 = new("./status2.csv");
    process_monitor_2 = new(pstall_csv_dumper_2,process_intf_2,pstatus_csv_dumper_2);

    mstatus_csv_dumper_1 = new("./module_status1.csv");
    module_monitor_1 = new(module_intf_1,mstatus_csv_dumper_1);
    mstatus_csv_dumper_2 = new("./module_status2.csv");
    module_monitor_2 = new(module_intf_2,mstatus_csv_dumper_2);
    mstatus_csv_dumper_3 = new("./module_status3.csv");
    module_monitor_3 = new(module_intf_3,mstatus_csv_dumper_3);
    mstatus_csv_dumper_4 = new("./module_status4.csv");
    module_monitor_4 = new(module_intf_4,mstatus_csv_dumper_4);
    mstatus_csv_dumper_5 = new("./module_status5.csv");
    module_monitor_5 = new(module_intf_5,mstatus_csv_dumper_5);
    mstatus_csv_dumper_6 = new("./module_status6.csv");
    module_monitor_6 = new(module_intf_6,mstatus_csv_dumper_6);
    mstatus_csv_dumper_7 = new("./module_status7.csv");
    module_monitor_7 = new(module_intf_7,mstatus_csv_dumper_7);
    mstatus_csv_dumper_8 = new("./module_status8.csv");
    module_monitor_8 = new(module_intf_8,mstatus_csv_dumper_8);
    mstatus_csv_dumper_9 = new("./module_status9.csv");
    module_monitor_9 = new(module_intf_9,mstatus_csv_dumper_9);
    mstatus_csv_dumper_10 = new("./module_status10.csv");
    module_monitor_10 = new(module_intf_10,mstatus_csv_dumper_10);
    mstatus_csv_dumper_11 = new("./module_status11.csv");
    module_monitor_11 = new(module_intf_11,mstatus_csv_dumper_11);
    mstatus_csv_dumper_12 = new("./module_status12.csv");
    module_monitor_12 = new(module_intf_12,mstatus_csv_dumper_12);
    mstatus_csv_dumper_13 = new("./module_status13.csv");
    module_monitor_13 = new(module_intf_13,mstatus_csv_dumper_13);
    mstatus_csv_dumper_14 = new("./module_status14.csv");
    module_monitor_14 = new(module_intf_14,mstatus_csv_dumper_14);
    mstatus_csv_dumper_15 = new("./module_status15.csv");
    module_monitor_15 = new(module_intf_15,mstatus_csv_dumper_15);
    mstatus_csv_dumper_16 = new("./module_status16.csv");
    module_monitor_16 = new(module_intf_16,mstatus_csv_dumper_16);



    seq_loop_csv_dumper_1 = new("./seq_loop_status1.csv");
    seq_loop_monitor_1 = new(seq_loop_intf_1,seq_loop_csv_dumper_1);
    seq_loop_csv_dumper_2 = new("./seq_loop_status2.csv");
    seq_loop_monitor_2 = new(seq_loop_intf_2,seq_loop_csv_dumper_2);
    seq_loop_csv_dumper_3 = new("./seq_loop_status3.csv");
    seq_loop_monitor_3 = new(seq_loop_intf_3,seq_loop_csv_dumper_3);

    upc_loop_csv_dumper_1 = new("./upc_loop_status1.csv");
    upc_loop_monitor_1 = new(upc_loop_intf_1,upc_loop_csv_dumper_1);
    upc_loop_csv_dumper_2 = new("./upc_loop_status2.csv");
    upc_loop_monitor_2 = new(upc_loop_intf_2,upc_loop_csv_dumper_2);
    upc_loop_csv_dumper_3 = new("./upc_loop_status3.csv");
    upc_loop_monitor_3 = new(upc_loop_intf_3,upc_loop_csv_dumper_3);
    upc_loop_csv_dumper_4 = new("./upc_loop_status4.csv");
    upc_loop_monitor_4 = new(upc_loop_intf_4,upc_loop_csv_dumper_4);
    upc_loop_csv_dumper_5 = new("./upc_loop_status5.csv");
    upc_loop_monitor_5 = new(upc_loop_intf_5,upc_loop_csv_dumper_5);
    upc_loop_csv_dumper_6 = new("./upc_loop_status6.csv");
    upc_loop_monitor_6 = new(upc_loop_intf_6,upc_loop_csv_dumper_6);
    upc_loop_csv_dumper_7 = new("./upc_loop_status7.csv");
    upc_loop_monitor_7 = new(upc_loop_intf_7,upc_loop_csv_dumper_7);
    upc_loop_csv_dumper_8 = new("./upc_loop_status8.csv");
    upc_loop_monitor_8 = new(upc_loop_intf_8,upc_loop_csv_dumper_8);
    upc_loop_csv_dumper_9 = new("./upc_loop_status9.csv");
    upc_loop_monitor_9 = new(upc_loop_intf_9,upc_loop_csv_dumper_9);
    upc_loop_csv_dumper_10 = new("./upc_loop_status10.csv");
    upc_loop_monitor_10 = new(upc_loop_intf_10,upc_loop_csv_dumper_10);
    upc_loop_csv_dumper_11 = new("./upc_loop_status11.csv");
    upc_loop_monitor_11 = new(upc_loop_intf_11,upc_loop_csv_dumper_11);

    sample_manager_inst.add_one_monitor(fifo_monitor_1);
    sample_manager_inst.add_one_monitor(process_monitor_1);
    sample_manager_inst.add_one_monitor(process_monitor_2);
    sample_manager_inst.add_one_monitor(module_monitor_1);
    sample_manager_inst.add_one_monitor(module_monitor_2);
    sample_manager_inst.add_one_monitor(module_monitor_3);
    sample_manager_inst.add_one_monitor(module_monitor_4);
    sample_manager_inst.add_one_monitor(module_monitor_5);
    sample_manager_inst.add_one_monitor(module_monitor_6);
    sample_manager_inst.add_one_monitor(module_monitor_7);
    sample_manager_inst.add_one_monitor(module_monitor_8);
    sample_manager_inst.add_one_monitor(module_monitor_9);
    sample_manager_inst.add_one_monitor(module_monitor_10);
    sample_manager_inst.add_one_monitor(module_monitor_11);
    sample_manager_inst.add_one_monitor(module_monitor_12);
    sample_manager_inst.add_one_monitor(module_monitor_13);
    sample_manager_inst.add_one_monitor(module_monitor_14);
    sample_manager_inst.add_one_monitor(module_monitor_15);
    sample_manager_inst.add_one_monitor(module_monitor_16);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_1);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_2);
    sample_manager_inst.add_one_monitor(seq_loop_monitor_3);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_1);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_2);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_3);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_4);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_5);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_6);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_7);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_8);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_9);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_10);
    sample_manager_inst.add_one_monitor(upc_loop_monitor_11);
    
    fork
        sample_manager_inst.start_monitor();
        last_transaction_done;
    join
    disable fork;

    sample_manager_inst.start_dump();
end

    task last_transaction_done();
        wait(reset == 0);
        while(1) begin
            if (finish == 1'b1 || deadlock_detector.AESL_deadlock_report_unit_inst.find_df_deadlock == 1'b1) begin
                @(negedge clock);
                break;
            end
            else
                @(posedge clock);
        end
    endtask


endmodule
