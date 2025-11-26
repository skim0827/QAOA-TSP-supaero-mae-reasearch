set SynModuleInfo {
  {SRCNAME Block_entry_state.re_wr_d_rd_proc_Pipeline_1 MODELNAME Block_entry_state_re_wr_d_rd_proc_Pipeline_1 RTLNAME qaoa_kernel_Block_entry_state_re_wr_d_rd_proc_Pipeline_1
    SUBMODULES {
      {MODELNAME qaoa_kernel_flow_control_loop_pipe_sequential_init RTLNAME qaoa_kernel_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME qaoa_kernel_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME build_feasible_superposition<3> MODELNAME build_feasible_superposition_3_s RTLNAME qaoa_kernel_build_feasible_superposition_3_s}
  {SRCNAME costHamiltonian<3> MODELNAME costHamiltonian_3_s RTLNAME qaoa_kernel_costHamiltonian_3_s
    SUBMODULES {
      {MODELNAME qaoa_kernel_mul_49s_23s_68_3_1 RTLNAME qaoa_kernel_mul_49s_23s_68_3_1 BINDTYPE op TYPE mul IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME applyCost_hls<3> MODELNAME applyCost_hls_3_s RTLNAME qaoa_kernel_applyCost_hls_3_s
    SUBMODULES {
      {MODELNAME qaoa_kernel_mul_11ns_33ns_34_2_1 RTLNAME qaoa_kernel_mul_11ns_33ns_34_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME qaoa_kernel_mul_32ns_46ns_76_3_1 RTLNAME qaoa_kernel_mul_32ns_46ns_76_3_1 BINDTYPE op TYPE mul IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME qaoa_kernel_sparsemux_7_2_33_1_1 RTLNAME qaoa_kernel_sparsemux_7_2_33_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME qaoa_kernel_applyCost_hls_3_s_cordic_apfixed_circ_table_arctan_128_ROM_AUTO_1R RTLNAME qaoa_kernel_applyCost_hls_3_s_cordic_apfixed_circ_table_arctan_128_ROM_AUTO_1R BINDTYPE storage TYPE rom IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME applyMixer_hls<3>_Pipeline_VITIS_LOOP_61_1 MODELNAME applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1 RTLNAME qaoa_kernel_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1}
  {SRCNAME applyMixer_hls<3>_Pipeline_2 MODELNAME applyMixer_hls_3_Pipeline_2 RTLNAME qaoa_kernel_applyMixer_hls_3_Pipeline_2}
  {SRCNAME applyMixer_hls<3>_Pipeline_3 MODELNAME applyMixer_hls_3_Pipeline_3 RTLNAME qaoa_kernel_applyMixer_hls_3_Pipeline_3}
  {SRCNAME applyMixer_hls<3>_Pipeline_VITIS_LOOP_116_1 MODELNAME applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1 RTLNAME qaoa_kernel_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1}
  {SRCNAME applyMixer_hls<3>_Pipeline_VITIS_LOOP_134_5 MODELNAME applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5 RTLNAME qaoa_kernel_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5}
  {SRCNAME applyMixer_hls<3>_Pipeline_VITIS_LOOP_140_6 MODELNAME applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6 RTLNAME qaoa_kernel_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6}
  {SRCNAME applyMixer_hls<3>_Pipeline_VITIS_LOOP_166_7 MODELNAME applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7 RTLNAME qaoa_kernel_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7}
  {SRCNAME applyMixer_hls<3> MODELNAME applyMixer_hls_3_s RTLNAME qaoa_kernel_applyMixer_hls_3_s
    SUBMODULES {
      {MODELNAME qaoa_kernel_mul_12ns_65ns_66_5_1 RTLNAME qaoa_kernel_mul_12ns_65ns_66_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME qaoa_kernel_mul_53ns_90ns_141_5_1 RTLNAME qaoa_kernel_mul_53ns_90ns_141_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME qaoa_kernel_sparsemux_7_2_65_1_1 RTLNAME qaoa_kernel_sparsemux_7_2_65_1_1 BINDTYPE op TYPE sparsemux IMPL onehotencoding_realdef}
      {MODELNAME qaoa_kernel_applyMixer_hls_3_s_bufA_re_RAM_2P_BRAM_1R1W RTLNAME qaoa_kernel_applyMixer_hls_3_s_bufA_re_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME {qaoaStep_hls<3, 1>} MODELNAME qaoaStep_hls_3_1_s RTLNAME qaoa_kernel_qaoaStep_hls_3_1_s
    SUBMODULES {
      {MODELNAME qaoa_kernel_mul_32s_22s_52_2_1 RTLNAME qaoa_kernel_mul_32s_22s_52_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME expectation_cost<3>_Pipeline_VITIS_LOOP_177_1 MODELNAME expectation_cost_3_Pipeline_VITIS_LOOP_177_1 RTLNAME qaoa_kernel_expectation_cost_3_Pipeline_VITIS_LOOP_177_1
    SUBMODULES {
      {MODELNAME qaoa_kernel_mul_49s_23s_68_3_1_x RTLNAME qaoa_kernel_mul_49s_23s_68_3_1_x BINDTYPE op TYPE mul IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME expectation_cost<3> MODELNAME expectation_cost_3_s RTLNAME qaoa_kernel_expectation_cost_3_s}
  {SRCNAME Block_entry_state.re_wr_d_rd_proc MODELNAME Block_entry_state_re_wr_d_rd_proc RTLNAME qaoa_kernel_Block_entry_state_re_wr_d_rd_proc
    SUBMODULES {
      {MODELNAME qaoa_kernel_ctlz_32_32_1_1 RTLNAME qaoa_kernel_ctlz_32_32_1_1 BINDTYPE op TYPE ctlz IMPL auto}
      {MODELNAME qaoa_kernel_bitselect_1ns_32ns_32s_1_1_1 RTLNAME qaoa_kernel_bitselect_1ns_32ns_32s_1_1_1 BINDTYPE op TYPE bitselect IMPL auto}
      {MODELNAME qaoa_kernel_mul_32s_32s_52_2_1 RTLNAME qaoa_kernel_mul_32s_32s_52_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME qaoa_kernel_Block_entry_state_re_wr_d_rd_proc_state_im_i_RAM_2P_BRAM_1R1W RTLNAME qaoa_kernel_Block_entry_state_re_wr_d_rd_proc_state_im_i_RAM_2P_BRAM_1R1W BINDTYPE storage TYPE ram_2p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Block_entry_proc_proc MODELNAME Block_entry_proc_proc RTLNAME qaoa_kernel_Block_entry_proc_proc}
  {SRCNAME qaoa_kernel MODELNAME qaoa_kernel RTLNAME qaoa_kernel IS_TOP 1
    SUBMODULES {
      {MODELNAME qaoa_kernel_fifo_w32_d2_S RTLNAME qaoa_kernel_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME retval_0_loc_channel1_U}
      {MODELNAME qaoa_kernel_control_s_axi RTLNAME qaoa_kernel_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
