set moduleName qaoaStep_hls_3_1_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 20
set C_modelName {qaoaStep_hls<3, 1>}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict state_re { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict state_im { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict d { MEM_WIDTH 32 MEM_SIZE 36 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ state_re int 32 regular {array 512 { 1 0 } 1 1 }  }
	{ state_im int 32 regular {array 512 { 1 0 } 1 1 }  }
	{ d int 32 regular {array 9 { 1 } 1 1 }  }
	{ gamma_0_0_val int 32 regular  }
	{ beta_0_0_val int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "state_re", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "state_im", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "d", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gamma_0_0_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "beta_0_0_val", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ state_re_address0 sc_out sc_lv 9 signal 0 } 
	{ state_re_ce0 sc_out sc_logic 1 signal 0 } 
	{ state_re_q0 sc_in sc_lv 32 signal 0 } 
	{ state_re_address1 sc_out sc_lv 9 signal 0 } 
	{ state_re_ce1 sc_out sc_logic 1 signal 0 } 
	{ state_re_we1 sc_out sc_logic 1 signal 0 } 
	{ state_re_d1 sc_out sc_lv 32 signal 0 } 
	{ state_im_address0 sc_out sc_lv 9 signal 1 } 
	{ state_im_ce0 sc_out sc_logic 1 signal 1 } 
	{ state_im_q0 sc_in sc_lv 32 signal 1 } 
	{ state_im_address1 sc_out sc_lv 9 signal 1 } 
	{ state_im_ce1 sc_out sc_logic 1 signal 1 } 
	{ state_im_we1 sc_out sc_logic 1 signal 1 } 
	{ state_im_d1 sc_out sc_lv 32 signal 1 } 
	{ d_address0 sc_out sc_lv 4 signal 2 } 
	{ d_ce0 sc_out sc_logic 1 signal 2 } 
	{ d_q0 sc_in sc_lv 32 signal 2 } 
	{ gamma_0_0_val sc_in sc_lv 32 signal 3 } 
	{ beta_0_0_val sc_in sc_lv 32 signal 4 } 
	{ grp_fu_828_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_828_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_828_p_dout0 sc_in sc_lv 52 signal -1 } 
	{ grp_fu_828_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "state_re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "state_re", "role": "address0" }} , 
 	{ "name": "state_re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_re", "role": "ce0" }} , 
 	{ "name": "state_re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "state_re", "role": "q0" }} , 
 	{ "name": "state_re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "state_re", "role": "address1" }} , 
 	{ "name": "state_re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_re", "role": "ce1" }} , 
 	{ "name": "state_re_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_re", "role": "we1" }} , 
 	{ "name": "state_re_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "state_re", "role": "d1" }} , 
 	{ "name": "state_im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "state_im", "role": "address0" }} , 
 	{ "name": "state_im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_im", "role": "ce0" }} , 
 	{ "name": "state_im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "state_im", "role": "q0" }} , 
 	{ "name": "state_im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "state_im", "role": "address1" }} , 
 	{ "name": "state_im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_im", "role": "ce1" }} , 
 	{ "name": "state_im_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_im", "role": "we1" }} , 
 	{ "name": "state_im_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "state_im", "role": "d1" }} , 
 	{ "name": "d_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "d", "role": "address0" }} , 
 	{ "name": "d_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "ce0" }} , 
 	{ "name": "d_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d", "role": "q0" }} , 
 	{ "name": "gamma_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gamma_0_0_val", "role": "default" }} , 
 	{ "name": "beta_0_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "beta_0_0_val", "role": "default" }} , 
 	{ "name": "grp_fu_828_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_828_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_828_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_828_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_828_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "grp_fu_828_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_828_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_828_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "3", "12", "39"],
		"CDFG" : "qaoaStep_hls_3_1_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "158810", "EstimateLatencyMax" : "205034",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "state_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_build_feasible_superposition_3_s_fu_58", "Port" : "state_re", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "state_re", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "12", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "state_re", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_build_feasible_superposition_3_s_fu_58", "Port" : "state_im", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "3", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "state_im", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "12", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "state_im", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "d", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "gamma_0_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "beta_0_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "3", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "cordic_apfixed_circ_table_arctan_128", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "12", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "circ_table_arctan_1289", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_build_feasible_superposition_3_s_fu_58", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "build_feasible_superposition_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "514", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "state_re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_60_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_build_feasible_superposition_3_s_fu_58.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66", "Parent" : "0", "Child" : ["4", "5", "7", "8", "9", "10", "11"],
		"CDFG" : "applyCost_hls_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "156709", "EstimateLatencyMax" : "156709",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "state_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_costHamiltonian_3_s_fu_209", "Port" : "d", "Inst_start_state" : "2", "Inst_end_state" : "31"}]},
			{"Name" : "gamma", "Type" : "None", "Direction" : "I"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_86_1_VITIS_LOOP_61_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage8", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage8_subdone", "QuitState" : "ap_ST_fsm_pp0_stage8", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage8_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66.cordic_apfixed_circ_table_arctan_128_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209", "Parent" : "3", "Child" : ["6"],
		"CDFG" : "costHamiltonian_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "9",
		"VariableLatency" : "0", "ExactLatency" : "29", "EstimateLatencyMin" : "29", "EstimateLatencyMax" : "29",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "s", "Type" : "None", "Direction" : "I"},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209.mul_49s_23s_68_3_1_U5", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66.mul_11ns_33ns_34_2_1_U9", "Parent" : "3"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66.mul_32ns_46ns_76_3_1_U10", "Parent" : "3"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66.sparsemux_7_2_33_1_1_U13", "Parent" : "3"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66.sparsemux_7_2_33_1_1_U14", "Parent" : "3"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyCost_hls_3_s_fu_66.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80", "Parent" : "0", "Child" : ["13", "14", "15", "16", "17", "20", "22", "24", "26", "28", "30", "35", "36", "37", "38"],
		"CDFG" : "applyMixer_hls_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1582", "EstimateLatencyMax" : "47806",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "state_re", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "24", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Port" : "state_re", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "26", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Port" : "state_re", "Inst_start_state" : "17", "Inst_end_state" : "23"}]},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "24", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Port" : "state_im", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "26", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Port" : "state_im", "Inst_start_state" : "17", "Inst_end_state" : "23"}]},
			{"Name" : "beta", "Type" : "None", "Direction" : "I"},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262", "Port" : "circ_table_arctan_1289", "Inst_start_state" : "13", "Inst_end_state" : "14"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_132_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state19", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state19"], "PreState" : ["ap_ST_fsm_state18"], "PostState" : ["ap_ST_fsm_state18"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_131_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state18", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state18"], "PreState" : ["ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state17"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_127_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state18"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.bufA_re_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.bufA_im_U", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.bufB_re_U", "Parent" : "12"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.bufB_im_U", "Parent" : "12"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262", "Parent" : "12", "Child" : ["18", "19"],
		"CDFG" : "applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "134", "EstimateLatencyMax" : "134",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "sext_ln61", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "p_out1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_61_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.circ_table_arctan_1289_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.flow_control_loop_pipe_sequential_init_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271", "Parent" : "12", "Child" : ["21"],
		"CDFG" : "applyMixer_hls_3_Pipeline_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "513", "EstimateLatencyMax" : "513",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bufA_re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bufA_im", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.flow_control_loop_pipe_sequential_init_U", "Parent" : "20"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277", "Parent" : "12", "Child" : ["23"],
		"CDFG" : "applyMixer_hls_3_Pipeline_3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "513", "EstimateLatencyMax" : "513",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bufB_re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bufB_im", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "23", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.flow_control_loop_pipe_sequential_init_U", "Parent" : "22"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Parent" : "12", "Child" : ["25"],
		"CDFG" : "applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "514", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "state_re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bufA_re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bufA_im", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_116_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.flow_control_loop_pipe_sequential_init_U", "Parent" : "24"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Parent" : "12", "Child" : ["27"],
		"CDFG" : "applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "514", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "state_re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "bufB_re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bufB_im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bufA_re", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "bufA_im", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "state_cur_030126", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_166_7", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.flow_control_loop_pipe_sequential_init_U", "Parent" : "26"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307", "Parent" : "12", "Child" : ["29"],
		"CDFG" : "applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "514", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "bufB_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bufB_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bufA_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bufA_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_cur_223131", "Type" : "None", "Direction" : "I"},
			{"Name" : "state_next_222129", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_134_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.flow_control_loop_pipe_sequential_init_U", "Parent" : "28"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319", "Parent" : "12", "Child" : ["31", "32", "33", "34"],
		"CDFG" : "applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2050", "EstimateLatencyMax" : "2050",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "zext_ln128_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "shl49", "Type" : "None", "Direction" : "I"},
			{"Name" : "mask", "Type" : "None", "Direction" : "I"},
			{"Name" : "bufB_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bufB_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bufA_re", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "bufA_im", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_cur_223131", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln102_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln127", "Type" : "None", "Direction" : "I"},
			{"Name" : "state_next_222129", "Type" : "None", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_140_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state4", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state4_blk", "QuitState" : "ap_ST_fsm_state4", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state4_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U41", "Parent" : "30"},
	{"ID" : "32", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U42", "Parent" : "30"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U43", "Parent" : "30"},
	{"ID" : "34", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.flow_control_loop_pipe_sequential_init_U", "Parent" : "30"},
	{"ID" : "35", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.mul_12ns_65ns_66_5_1_U62", "Parent" : "12"},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.mul_53ns_90ns_141_5_1_U63", "Parent" : "12"},
	{"ID" : "37", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.sparsemux_7_2_65_1_1_U64", "Parent" : "12"},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_applyMixer_hls_3_s_fu_80.sparsemux_7_2_65_1_1_U65", "Parent" : "12"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_52_2_1_U74", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	qaoaStep_hls_3_1_s {
		state_re {Type IO LastRead 36 FirstWrite -1}
		state_im {Type IO LastRead 36 FirstWrite -1}
		d {Type I LastRead 17 FirstWrite -1}
		gamma_0_0_val {Type I LastRead 2 FirstWrite -1}
		beta_0_0_val {Type I LastRead 4 FirstWrite -1}
		cordic_apfixed_circ_table_arctan_128 {Type I LastRead -1 FirstWrite -1}
		circ_table_arctan_1289 {Type I LastRead -1 FirstWrite -1}}
	build_feasible_superposition_3_s {
		state_re {Type O LastRead -1 FirstWrite 1}
		state_im {Type O LastRead -1 FirstWrite 0}}
	applyCost_hls_3_s {
		state_re {Type IO LastRead 36 FirstWrite 44}
		state_im {Type I LastRead 36 FirstWrite -1}
		d {Type I LastRead 17 FirstWrite -1}
		gamma {Type I LastRead 0 FirstWrite -1}
		cordic_apfixed_circ_table_arctan_128 {Type I LastRead -1 FirstWrite -1}}
	costHamiltonian_3_s {
		s {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 17 FirstWrite -1}}
	applyMixer_hls_3_s {
		state_re {Type IO LastRead 0 FirstWrite -1}
		state_im {Type IO LastRead 0 FirstWrite -1}
		beta {Type I LastRead 0 FirstWrite -1}
		circ_table_arctan_1289 {Type I LastRead -1 FirstWrite -1}}
	applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1 {
		sext_ln61 {Type I LastRead 0 FirstWrite -1}
		p_out {Type O LastRead -1 FirstWrite 1}
		p_out1 {Type O LastRead -1 FirstWrite 1}
		circ_table_arctan_1289 {Type I LastRead -1 FirstWrite -1}}
	applyMixer_hls_3_Pipeline_2 {
		bufA_re {Type O LastRead -1 FirstWrite 0}
		bufA_im {Type O LastRead -1 FirstWrite 0}}
	applyMixer_hls_3_Pipeline_3 {
		bufB_re {Type O LastRead -1 FirstWrite 0}
		bufB_im {Type O LastRead -1 FirstWrite 0}}
	applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1 {
		state_re {Type I LastRead 0 FirstWrite -1}
		state_im {Type I LastRead 0 FirstWrite -1}
		bufA_re {Type O LastRead -1 FirstWrite 1}
		bufA_im {Type O LastRead -1 FirstWrite 1}}
	applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7 {
		state_re {Type O LastRead -1 FirstWrite 1}
		state_im {Type O LastRead -1 FirstWrite 1}
		bufB_re {Type I LastRead 0 FirstWrite -1}
		bufB_im {Type I LastRead 0 FirstWrite -1}
		bufA_re {Type I LastRead 0 FirstWrite -1}
		bufA_im {Type I LastRead 0 FirstWrite -1}
		state_cur_030126 {Type I LastRead 0 FirstWrite -1}}
	applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5 {
		bufB_re {Type IO LastRead 0 FirstWrite 1}
		bufB_im {Type IO LastRead 0 FirstWrite 1}
		bufA_re {Type IO LastRead 0 FirstWrite 1}
		bufA_im {Type IO LastRead 0 FirstWrite 1}
		state_cur_223131 {Type I LastRead 0 FirstWrite -1}
		state_next_222129 {Type I LastRead 0 FirstWrite -1}}
	applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6 {
		zext_ln128_1 {Type I LastRead 0 FirstWrite -1}
		shl49 {Type I LastRead 0 FirstWrite -1}
		mask {Type I LastRead 0 FirstWrite -1}
		bufB_re {Type IO LastRead 1 FirstWrite 2}
		bufB_im {Type IO LastRead 1 FirstWrite 2}
		bufA_re {Type IO LastRead 1 FirstWrite 2}
		bufA_im {Type IO LastRead 1 FirstWrite 2}
		state_cur_223131 {Type I LastRead 0 FirstWrite -1}
		trunc_ln102_cast {Type I LastRead 0 FirstWrite -1}
		sext_ln127 {Type I LastRead 0 FirstWrite -1}
		state_next_222129 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "158810", "Max" : "205034"}
	, {"Name" : "Interval", "Min" : "158810", "Max" : "205034"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	state_re { ap_memory {  { state_re_address0 mem_address 1 9 }  { state_re_ce0 mem_ce 1 1 }  { state_re_q0 mem_dout 0 32 }  { state_re_address1 MemPortADDR2 1 9 }  { state_re_ce1 MemPortCE2 1 1 }  { state_re_we1 MemPortWE2 1 1 }  { state_re_d1 MemPortDIN2 1 32 } } }
	state_im { ap_memory {  { state_im_address0 mem_address 1 9 }  { state_im_ce0 mem_ce 1 1 }  { state_im_q0 mem_dout 0 32 }  { state_im_address1 MemPortADDR2 1 9 }  { state_im_ce1 MemPortCE2 1 1 }  { state_im_we1 MemPortWE2 1 1 }  { state_im_d1 MemPortDIN2 1 32 } } }
	d { ap_memory {  { d_address0 mem_address 1 4 }  { d_ce0 mem_ce 1 1 }  { d_q0 mem_dout 0 32 } } }
	gamma_0_0_val { ap_none {  { gamma_0_0_val in_data 0 32 } } }
	beta_0_0_val { ap_none {  { beta_0_0_val in_data 0 32 } } }
}
