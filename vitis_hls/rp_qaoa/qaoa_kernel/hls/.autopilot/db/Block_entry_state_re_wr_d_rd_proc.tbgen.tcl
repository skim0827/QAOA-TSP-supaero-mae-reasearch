set moduleName Block_entry_state_re_wr_d_rd_proc
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
set C_modelName {Block_entry_state.re_wr_d_rd_proc}
set C_modelType { float 32 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict d { MEM_WIDTH 32 MEM_SIZE 36 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ d int 32 regular {array 9 { 1 } 1 1 }  }
	{ gamma int 32 regular {pointer 0}  }
	{ beta int 32 regular {pointer 0}  }
	{ get_best_state int 1 regular  }
	{ best_state int 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "d", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gamma", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "beta", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "get_best_state", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "best_state", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 32} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ d_address0 sc_out sc_lv 4 signal 0 } 
	{ d_ce0 sc_out sc_logic 1 signal 0 } 
	{ d_q0 sc_in sc_lv 32 signal 0 } 
	{ gamma sc_in sc_lv 32 signal 1 } 
	{ beta sc_in sc_lv 32 signal 2 } 
	{ get_best_state sc_in sc_lv 1 signal 3 } 
	{ best_state sc_out sc_lv 32 signal 4 } 
	{ best_state_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ ap_return sc_out sc_lv 32 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "d_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "d", "role": "address0" }} , 
 	{ "name": "d_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "ce0" }} , 
 	{ "name": "d_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d", "role": "q0" }} , 
 	{ "name": "gamma", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gamma", "role": "default" }} , 
 	{ "name": "beta", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "beta", "role": "default" }} , 
 	{ "name": "get_best_state", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "get_best_state", "role": "default" }} , 
 	{ "name": "best_state", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "best_state", "role": "default" }} , 
 	{ "name": "best_state_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "best_state", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "5", "45", "56", "57", "58", "59"],
		"CDFG" : "Block_entry_state_re_wr_d_rd_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "159884", "EstimateLatencyMax" : "206109",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "d", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_qaoaStep_hls_3_1_s_fu_159", "Port" : "d", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "45", "SubInstance" : "grp_expectation_cost_3_s_fu_175", "Port" : "d", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "gamma", "Type" : "None", "Direction" : "I"},
			{"Name" : "beta", "Type" : "None", "Direction" : "I"},
			{"Name" : "get_best_state", "Type" : "None", "Direction" : "I"},
			{"Name" : "best_state", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_qaoaStep_hls_3_1_s_fu_159", "Port" : "cordic_apfixed_circ_table_arctan_128", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_qaoaStep_hls_3_1_s_fu_159", "Port" : "circ_table_arctan_1289", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_im_i_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_re_i_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151", "Parent" : "0", "Child" : ["4"],
		"CDFG" : "Block_entry_state_re_wr_d_rd_proc_Pipeline_1",
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
			{"Name" : "state_re_i", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "state_im_i", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "Loop 1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.flow_control_loop_pipe_sequential_init_U", "Parent" : "3"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159", "Parent" : "0", "Child" : ["6", "8", "17", "44"],
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
					{"ID" : "6", "SubInstance" : "grp_build_feasible_superposition_3_s_fu_58", "Port" : "state_re", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "8", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "state_re", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "17", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "state_re", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "grp_build_feasible_superposition_3_s_fu_58", "Port" : "state_im", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "8", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "state_im", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "17", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "state_im", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "d", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "gamma_0_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "beta_0_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "cordic_apfixed_circ_table_arctan_128", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "circ_table_arctan_1289", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58", "Parent" : "5", "Child" : ["7"],
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
	{"ID" : "7", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.flow_control_loop_pipe_sequential_init_U", "Parent" : "6"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66", "Parent" : "5", "Child" : ["9", "10", "12", "13", "14", "15", "16"],
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
					{"ID" : "10", "SubInstance" : "grp_costHamiltonian_3_s_fu_209", "Port" : "d", "Inst_start_state" : "2", "Inst_end_state" : "31"}]},
			{"Name" : "gamma", "Type" : "None", "Direction" : "I"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_86_1_VITIS_LOOP_61_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage8", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage8_subdone", "QuitState" : "ap_ST_fsm_pp0_stage8", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage8_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "9", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.cordic_apfixed_circ_table_arctan_128_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209", "Parent" : "8", "Child" : ["11"],
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
	{"ID" : "11", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209.mul_49s_23s_68_3_1_U5", "Parent" : "10"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.mul_11ns_33ns_34_2_1_U9", "Parent" : "8"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.mul_32ns_46ns_76_3_1_U10", "Parent" : "8"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.sparsemux_7_2_33_1_1_U13", "Parent" : "8"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.sparsemux_7_2_33_1_1_U14", "Parent" : "8"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80", "Parent" : "5", "Child" : ["18", "19", "20", "21", "22", "25", "27", "29", "31", "33", "35", "40", "41", "42", "43"],
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
					{"ID" : "29", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Port" : "state_re", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "31", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Port" : "state_re", "Inst_start_state" : "17", "Inst_end_state" : "23"}]},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Port" : "state_im", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "31", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Port" : "state_im", "Inst_start_state" : "17", "Inst_end_state" : "23"}]},
			{"Name" : "beta", "Type" : "None", "Direction" : "I"},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "22", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262", "Port" : "circ_table_arctan_1289", "Inst_start_state" : "13", "Inst_end_state" : "14"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_132_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state19", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state19"], "PreState" : ["ap_ST_fsm_state18"], "PostState" : ["ap_ST_fsm_state18"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_131_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state18", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state18"], "PreState" : ["ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state17"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_127_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state18"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "18", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.bufA_re_U", "Parent" : "17"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.bufA_im_U", "Parent" : "17"},
	{"ID" : "20", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.bufB_re_U", "Parent" : "17"},
	{"ID" : "21", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.bufB_im_U", "Parent" : "17"},
	{"ID" : "22", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262", "Parent" : "17", "Child" : ["23", "24"],
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
	{"ID" : "23", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.circ_table_arctan_1289_U", "Parent" : "22"},
	{"ID" : "24", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.flow_control_loop_pipe_sequential_init_U", "Parent" : "22"},
	{"ID" : "25", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271", "Parent" : "17", "Child" : ["26"],
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
	{"ID" : "26", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.flow_control_loop_pipe_sequential_init_U", "Parent" : "25"},
	{"ID" : "27", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277", "Parent" : "17", "Child" : ["28"],
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
	{"ID" : "28", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Parent" : "17", "Child" : ["30"],
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
	{"ID" : "30", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Parent" : "17", "Child" : ["32"],
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
	{"ID" : "32", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307", "Parent" : "17", "Child" : ["34"],
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
	{"ID" : "34", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "35", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319", "Parent" : "17", "Child" : ["36", "37", "38", "39"],
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
	{"ID" : "36", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U41", "Parent" : "35"},
	{"ID" : "37", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U42", "Parent" : "35"},
	{"ID" : "38", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U43", "Parent" : "35"},
	{"ID" : "39", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "40", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.mul_12ns_65ns_66_5_1_U62", "Parent" : "17"},
	{"ID" : "41", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.mul_53ns_90ns_141_5_1_U63", "Parent" : "17"},
	{"ID" : "42", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.sparsemux_7_2_65_1_1_U64", "Parent" : "17"},
	{"ID" : "43", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.sparsemux_7_2_65_1_1_U65", "Parent" : "17"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_qaoaStep_hls_3_1_s_fu_159.mul_32s_22s_52_2_1_U74", "Parent" : "5"},
	{"ID" : "45", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175", "Parent" : "0", "Child" : ["46"],
		"CDFG" : "expectation_cost_3_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "555", "EstimateLatencyMax" : "555",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "state_re", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "46", "SubInstance" : "grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144", "Port" : "state_re", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "46", "SubInstance" : "grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144", "Port" : "state_im", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144", "Parent" : "45", "Child" : ["47", "48", "49", "50", "51", "52", "53", "54", "55"],
		"CDFG" : "expectation_cost_3_Pipeline_VITIS_LOOP_177_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "544", "EstimateLatencyMax" : "544",
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
			{"Name" : "d_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_load_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_load_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_load_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_load_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_load_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_load_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "d_load_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "result_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "argmax_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_177_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter31", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter31", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "47", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_32s_32s_52_2_1_U83", "Parent" : "46"},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_32s_32s_52_2_1_U84", "Parent" : "46"},
	{"ID" : "49", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U85", "Parent" : "46"},
	{"ID" : "50", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U86", "Parent" : "46"},
	{"ID" : "51", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U87", "Parent" : "46"},
	{"ID" : "52", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U88", "Parent" : "46"},
	{"ID" : "53", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U89", "Parent" : "46"},
	{"ID" : "54", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U90", "Parent" : "46"},
	{"ID" : "55", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.flow_control_loop_pipe_sequential_init_U", "Parent" : "46"},
	{"ID" : "56", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ctlz_32_32_1_1_U109", "Parent" : "0"},
	{"ID" : "57", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bitselect_1ns_32ns_32s_1_1_1_U110", "Parent" : "0"},
	{"ID" : "58", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.bitselect_1ns_32ns_32s_1_1_1_U111", "Parent" : "0"},
	{"ID" : "59", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_52_2_1_U112", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Block_entry_state_re_wr_d_rd_proc {
		d {Type I LastRead 17 FirstWrite -1}
		gamma {Type I LastRead 2 FirstWrite -1}
		beta {Type I LastRead 2 FirstWrite -1}
		get_best_state {Type I LastRead 5 FirstWrite -1}
		best_state {Type O LastRead -1 FirstWrite 5}
		cordic_apfixed_circ_table_arctan_128 {Type I LastRead -1 FirstWrite -1}
		circ_table_arctan_1289 {Type I LastRead -1 FirstWrite -1}}
	Block_entry_state_re_wr_d_rd_proc_Pipeline_1 {
		state_re_i {Type O LastRead -1 FirstWrite 0}
		state_im_i {Type O LastRead -1 FirstWrite 0}}
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
		state_next_222129 {Type I LastRead 0 FirstWrite -1}}
	expectation_cost_3_s {
		state_re {Type I LastRead 24 FirstWrite -1}
		state_im {Type I LastRead 24 FirstWrite -1}
		d {Type I LastRead 8 FirstWrite -1}}
	expectation_cost_3_Pipeline_VITIS_LOOP_177_1 {
		state_re {Type I LastRead 24 FirstWrite -1}
		state_im {Type I LastRead 24 FirstWrite -1}
		d_load {Type I LastRead 0 FirstWrite -1}
		d_load_1 {Type I LastRead 0 FirstWrite -1}
		d_load_2 {Type I LastRead 0 FirstWrite -1}
		d_load_3 {Type I LastRead 0 FirstWrite -1}
		d_load_4 {Type I LastRead 0 FirstWrite -1}
		d_load_5 {Type I LastRead 0 FirstWrite -1}
		d_load_6 {Type I LastRead 0 FirstWrite -1}
		d_load_7 {Type I LastRead 0 FirstWrite -1}
		d_load_8 {Type I LastRead 0 FirstWrite -1}
		result_out {Type O LastRead -1 FirstWrite 30}
		argmax_out {Type O LastRead -1 FirstWrite 30}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "159884", "Max" : "206109"}
	, {"Name" : "Interval", "Min" : "159884", "Max" : "206109"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	d { ap_memory {  { d_address0 mem_address 1 4 }  { d_ce0 mem_ce 1 1 }  { d_q0 mem_dout 0 32 } } }
	gamma { ap_none {  { gamma in_data 0 32 } } }
	beta { ap_none {  { beta in_data 0 32 } } }
	get_best_state { ap_none {  { get_best_state in_data 0 1 } } }
	best_state { ap_vld {  { best_state out_data 1 32 }  { best_state_ap_vld out_vld 1 1 } } }
}
