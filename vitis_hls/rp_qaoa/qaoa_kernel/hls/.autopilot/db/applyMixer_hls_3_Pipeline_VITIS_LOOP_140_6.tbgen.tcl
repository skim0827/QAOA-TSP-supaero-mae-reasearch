set moduleName applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6
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
set C_modelName {applyMixer_hls<3>_Pipeline_VITIS_LOOP_140_6}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict bufB_re { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bufB_im { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bufA_re { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bufA_im { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
set C_modelArgList {
	{ zext_ln128_1 int 3 regular  }
	{ shl49 int 3 regular  }
	{ mask int 9 regular  }
	{ bufB_re int 32 regular {array 512 { 1 2 } 1 1 }  }
	{ bufB_im int 32 regular {array 512 { 1 2 } 1 1 }  }
	{ bufA_re int 32 regular {array 512 { 1 2 } 1 1 }  }
	{ bufA_im int 32 regular {array 512 { 1 2 } 1 1 }  }
	{ state_cur_223131 int 1 regular  }
	{ trunc_ln102_cast int 22 regular  }
	{ sext_ln127 int 22 regular  }
	{ state_next_222129 int 1 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "zext_ln128_1", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "shl49", "interface" : "wire", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "mask", "interface" : "wire", "bitwidth" : 9, "direction" : "READONLY"} , 
 	{ "Name" : "bufB_re", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "bufB_im", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "bufA_re", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "bufA_im", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "state_cur_223131", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "trunc_ln102_cast", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln127", "interface" : "wire", "bitwidth" : 22, "direction" : "READONLY"} , 
 	{ "Name" : "state_next_222129", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 49
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ zext_ln128_1 sc_in sc_lv 3 signal 0 } 
	{ shl49 sc_in sc_lv 3 signal 1 } 
	{ mask sc_in sc_lv 9 signal 2 } 
	{ bufB_re_address0 sc_out sc_lv 9 signal 3 } 
	{ bufB_re_ce0 sc_out sc_logic 1 signal 3 } 
	{ bufB_re_q0 sc_in sc_lv 32 signal 3 } 
	{ bufB_re_address1 sc_out sc_lv 9 signal 3 } 
	{ bufB_re_ce1 sc_out sc_logic 1 signal 3 } 
	{ bufB_re_we1 sc_out sc_logic 1 signal 3 } 
	{ bufB_re_d1 sc_out sc_lv 32 signal 3 } 
	{ bufB_re_q1 sc_in sc_lv 32 signal 3 } 
	{ bufB_im_address0 sc_out sc_lv 9 signal 4 } 
	{ bufB_im_ce0 sc_out sc_logic 1 signal 4 } 
	{ bufB_im_q0 sc_in sc_lv 32 signal 4 } 
	{ bufB_im_address1 sc_out sc_lv 9 signal 4 } 
	{ bufB_im_ce1 sc_out sc_logic 1 signal 4 } 
	{ bufB_im_we1 sc_out sc_logic 1 signal 4 } 
	{ bufB_im_d1 sc_out sc_lv 32 signal 4 } 
	{ bufB_im_q1 sc_in sc_lv 32 signal 4 } 
	{ bufA_re_address0 sc_out sc_lv 9 signal 5 } 
	{ bufA_re_ce0 sc_out sc_logic 1 signal 5 } 
	{ bufA_re_q0 sc_in sc_lv 32 signal 5 } 
	{ bufA_re_address1 sc_out sc_lv 9 signal 5 } 
	{ bufA_re_ce1 sc_out sc_logic 1 signal 5 } 
	{ bufA_re_we1 sc_out sc_logic 1 signal 5 } 
	{ bufA_re_d1 sc_out sc_lv 32 signal 5 } 
	{ bufA_re_q1 sc_in sc_lv 32 signal 5 } 
	{ bufA_im_address0 sc_out sc_lv 9 signal 6 } 
	{ bufA_im_ce0 sc_out sc_logic 1 signal 6 } 
	{ bufA_im_q0 sc_in sc_lv 32 signal 6 } 
	{ bufA_im_address1 sc_out sc_lv 9 signal 6 } 
	{ bufA_im_ce1 sc_out sc_logic 1 signal 6 } 
	{ bufA_im_we1 sc_out sc_logic 1 signal 6 } 
	{ bufA_im_d1 sc_out sc_lv 32 signal 6 } 
	{ bufA_im_q1 sc_in sc_lv 32 signal 6 } 
	{ state_cur_223131 sc_in sc_lv 1 signal 7 } 
	{ trunc_ln102_cast sc_in sc_lv 22 signal 8 } 
	{ sext_ln127 sc_in sc_lv 22 signal 9 } 
	{ state_next_222129 sc_in sc_lv 1 signal 10 } 
	{ grp_fu_917_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_917_p_din1 sc_out sc_lv 22 signal -1 } 
	{ grp_fu_917_p_dout0 sc_in sc_lv 52 signal -1 } 
	{ grp_fu_917_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "zext_ln128_1", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "zext_ln128_1", "role": "default" }} , 
 	{ "name": "shl49", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "shl49", "role": "default" }} , 
 	{ "name": "mask", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "mask", "role": "default" }} , 
 	{ "name": "bufB_re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufB_re", "role": "address0" }} , 
 	{ "name": "bufB_re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufB_re", "role": "ce0" }} , 
 	{ "name": "bufB_re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufB_re", "role": "q0" }} , 
 	{ "name": "bufB_re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufB_re", "role": "address1" }} , 
 	{ "name": "bufB_re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufB_re", "role": "ce1" }} , 
 	{ "name": "bufB_re_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufB_re", "role": "we1" }} , 
 	{ "name": "bufB_re_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufB_re", "role": "d1" }} , 
 	{ "name": "bufB_re_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufB_re", "role": "q1" }} , 
 	{ "name": "bufB_im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufB_im", "role": "address0" }} , 
 	{ "name": "bufB_im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufB_im", "role": "ce0" }} , 
 	{ "name": "bufB_im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufB_im", "role": "q0" }} , 
 	{ "name": "bufB_im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufB_im", "role": "address1" }} , 
 	{ "name": "bufB_im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufB_im", "role": "ce1" }} , 
 	{ "name": "bufB_im_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufB_im", "role": "we1" }} , 
 	{ "name": "bufB_im_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufB_im", "role": "d1" }} , 
 	{ "name": "bufB_im_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufB_im", "role": "q1" }} , 
 	{ "name": "bufA_re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufA_re", "role": "address0" }} , 
 	{ "name": "bufA_re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufA_re", "role": "ce0" }} , 
 	{ "name": "bufA_re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufA_re", "role": "q0" }} , 
 	{ "name": "bufA_re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufA_re", "role": "address1" }} , 
 	{ "name": "bufA_re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufA_re", "role": "ce1" }} , 
 	{ "name": "bufA_re_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufA_re", "role": "we1" }} , 
 	{ "name": "bufA_re_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufA_re", "role": "d1" }} , 
 	{ "name": "bufA_re_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufA_re", "role": "q1" }} , 
 	{ "name": "bufA_im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufA_im", "role": "address0" }} , 
 	{ "name": "bufA_im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufA_im", "role": "ce0" }} , 
 	{ "name": "bufA_im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufA_im", "role": "q0" }} , 
 	{ "name": "bufA_im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufA_im", "role": "address1" }} , 
 	{ "name": "bufA_im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufA_im", "role": "ce1" }} , 
 	{ "name": "bufA_im_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufA_im", "role": "we1" }} , 
 	{ "name": "bufA_im_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufA_im", "role": "d1" }} , 
 	{ "name": "bufA_im_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufA_im", "role": "q1" }} , 
 	{ "name": "state_cur_223131", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "state_cur_223131", "role": "default" }} , 
 	{ "name": "trunc_ln102_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "trunc_ln102_cast", "role": "default" }} , 
 	{ "name": "sext_ln127", "direction": "in", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "sext_ln127", "role": "default" }} , 
 	{ "name": "state_next_222129", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "state_next_222129", "role": "default" }} , 
 	{ "name": "grp_fu_917_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_917_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_917_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "grp_fu_917_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_917_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":52, "type": "signal", "bundle":{"name": "grp_fu_917_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_917_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_917_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_52_2_1_U41", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_52_2_1_U42", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_22s_52_2_1_U43", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "2050", "Max" : "2050"}
	, {"Name" : "Interval", "Min" : "2050", "Max" : "2050"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	zext_ln128_1 { ap_none {  { zext_ln128_1 in_data 0 3 } } }
	shl49 { ap_none {  { shl49 in_data 0 3 } } }
	mask { ap_none {  { mask in_data 0 9 } } }
	bufB_re { ap_memory {  { bufB_re_address0 mem_address 1 9 }  { bufB_re_ce0 mem_ce 1 1 }  { bufB_re_q0 mem_dout 0 32 }  { bufB_re_address1 MemPortADDR2 1 9 }  { bufB_re_ce1 MemPortCE2 1 1 }  { bufB_re_we1 MemPortWE2 1 1 }  { bufB_re_d1 MemPortDIN2 1 32 }  { bufB_re_q1 MemPortDOUT2 0 32 } } }
	bufB_im { ap_memory {  { bufB_im_address0 mem_address 1 9 }  { bufB_im_ce0 mem_ce 1 1 }  { bufB_im_q0 mem_dout 0 32 }  { bufB_im_address1 MemPortADDR2 1 9 }  { bufB_im_ce1 MemPortCE2 1 1 }  { bufB_im_we1 MemPortWE2 1 1 }  { bufB_im_d1 MemPortDIN2 1 32 }  { bufB_im_q1 MemPortDOUT2 0 32 } } }
	bufA_re { ap_memory {  { bufA_re_address0 mem_address 1 9 }  { bufA_re_ce0 mem_ce 1 1 }  { bufA_re_q0 mem_dout 0 32 }  { bufA_re_address1 MemPortADDR2 1 9 }  { bufA_re_ce1 MemPortCE2 1 1 }  { bufA_re_we1 MemPortWE2 1 1 }  { bufA_re_d1 MemPortDIN2 1 32 }  { bufA_re_q1 MemPortDOUT2 0 32 } } }
	bufA_im { ap_memory {  { bufA_im_address0 mem_address 1 9 }  { bufA_im_ce0 mem_ce 1 1 }  { bufA_im_q0 mem_dout 0 32 }  { bufA_im_address1 MemPortADDR2 1 9 }  { bufA_im_ce1 MemPortCE2 1 1 }  { bufA_im_we1 MemPortWE2 1 1 }  { bufA_im_d1 MemPortDIN2 1 32 }  { bufA_im_q1 MemPortDOUT2 0 32 } } }
	state_cur_223131 { ap_none {  { state_cur_223131 in_data 0 1 } } }
	trunc_ln102_cast { ap_none {  { trunc_ln102_cast in_data 0 22 } } }
	sext_ln127 { ap_none {  { sext_ln127 in_data 0 22 } } }
	state_next_222129 { ap_none {  { state_next_222129 in_data 0 1 } } }
}
