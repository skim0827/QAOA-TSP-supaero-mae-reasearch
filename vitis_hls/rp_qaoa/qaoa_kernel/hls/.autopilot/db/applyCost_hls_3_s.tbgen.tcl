set moduleName applyCost_hls_3_s
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type loop_auto_rewind
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
set C_modelName {applyCost_hls<3>}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict state_re { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict state_im { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict d { MEM_WIDTH 32 MEM_SIZE 36 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ state_re int 32 regular {array 512 { 1 0 } 1 1 }  }
	{ state_im int 32 regular {array 512 { 1 3 } 1 1 }  }
	{ d int 32 regular {array 9 { 1 } 1 1 }  }
	{ gamma int 32 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "state_re", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "state_im", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "d", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "gamma", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 28
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
	{ d_address0 sc_out sc_lv 4 signal 2 } 
	{ d_ce0 sc_out sc_logic 1 signal 2 } 
	{ d_q0 sc_in sc_lv 32 signal 2 } 
	{ gamma sc_in sc_lv 32 signal 3 } 
	{ grp_fu_102_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_102_p_din1 sc_out sc_lv 22 signal -1 } 
	{ grp_fu_102_p_dout0 sc_in sc_lv 52 signal -1 } 
	{ grp_fu_102_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_106_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_106_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_106_p_dout0 sc_in sc_lv 52 signal -1 } 
	{ grp_fu_106_p_ce sc_out sc_logic 1 signal -1 } 
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
 	{ "name": "d_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "d", "role": "address0" }} , 
 	{ "name": "d_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "d", "role": "ce0" }} , 
 	{ "name": "d_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "d", "role": "q0" }} , 
 	{ "name": "gamma", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gamma", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_102_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "grp_fu_102_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "grp_fu_102_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_102_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_102_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_106_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_106_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "grp_fu_106_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_106_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_106_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "4", "5", "6", "7", "8"],
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
					{"ID" : "2", "SubInstance" : "grp_costHamiltonian_3_s_fu_209", "Port" : "d", "Inst_start_state" : "2", "Inst_end_state" : "31"}]},
			{"Name" : "gamma", "Type" : "None", "Direction" : "I"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_86_1_VITIS_LOOP_61_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage8", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage8_subdone", "QuitState" : "ap_ST_fsm_pp0_stage8", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage8_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.cordic_apfixed_circ_table_arctan_128_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_costHamiltonian_3_s_fu_209", "Parent" : "0", "Child" : ["3"],
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
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_costHamiltonian_3_s_fu_209.mul_49s_23s_68_3_1_U5", "Parent" : "2"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11ns_33ns_34_2_1_U9", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_46ns_76_3_1_U10", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_33_1_1_U13", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sparsemux_7_2_33_1_1_U14", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	applyCost_hls_3_s {
		state_re {Type IO LastRead 36 FirstWrite 44}
		state_im {Type I LastRead 36 FirstWrite -1}
		d {Type I LastRead 17 FirstWrite -1}
		gamma {Type I LastRead 0 FirstWrite -1}
		cordic_apfixed_circ_table_arctan_128 {Type I LastRead -1 FirstWrite -1}}
	costHamiltonian_3_s {
		s {Type I LastRead 0 FirstWrite -1}
		d {Type I LastRead 17 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "156709", "Max" : "156709"}
	, {"Name" : "Interval", "Min" : "156709", "Max" : "156709"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	state_re { ap_memory {  { state_re_address0 mem_address 1 9 }  { state_re_ce0 mem_ce 1 1 }  { state_re_q0 mem_dout 0 32 }  { state_re_address1 MemPortADDR2 1 9 }  { state_re_ce1 MemPortCE2 1 1 }  { state_re_we1 MemPortWE2 1 1 }  { state_re_d1 MemPortDIN2 1 32 } } }
	state_im { ap_memory {  { state_im_address0 mem_address 1 9 }  { state_im_ce0 mem_ce 1 1 }  { state_im_q0 mem_dout 0 32 } } }
	d { ap_memory {  { d_address0 mem_address 1 4 }  { d_ce0 mem_ce 1 1 }  { d_q0 mem_dout 0 32 } } }
	gamma { ap_none {  { gamma in_data 0 32 } } }
}
