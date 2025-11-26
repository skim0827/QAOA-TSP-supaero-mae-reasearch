set moduleName applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7
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
set C_modelName {applyMixer_hls<3>_Pipeline_VITIS_LOOP_166_7}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict state_re { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict state_im { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 0 }
dict set ap_memory_interface_dict bufB_re { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bufB_im { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bufA_re { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
dict set ap_memory_interface_dict bufA_im { MEM_WIDTH 32 MEM_SIZE 2048 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ state_re int 32 regular {array 512 { 3 0 } 0 1 }  }
	{ state_im int 32 regular {array 512 { 3 0 } 0 1 }  }
	{ bufB_re int 32 regular {array 512 { 1 3 } 1 1 }  }
	{ bufB_im int 32 regular {array 512 { 1 3 } 1 1 }  }
	{ bufA_re int 32 regular {array 512 { 1 3 } 1 1 }  }
	{ bufA_im int 32 regular {array 512 { 1 3 } 1 1 }  }
	{ state_cur_030126 int 1 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "state_re", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "state_im", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "bufB_re", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bufB_im", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bufA_re", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "bufA_im", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "state_cur_030126", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 27
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ state_re_address1 sc_out sc_lv 9 signal 0 } 
	{ state_re_ce1 sc_out sc_logic 1 signal 0 } 
	{ state_re_we1 sc_out sc_logic 1 signal 0 } 
	{ state_re_d1 sc_out sc_lv 32 signal 0 } 
	{ state_im_address1 sc_out sc_lv 9 signal 1 } 
	{ state_im_ce1 sc_out sc_logic 1 signal 1 } 
	{ state_im_we1 sc_out sc_logic 1 signal 1 } 
	{ state_im_d1 sc_out sc_lv 32 signal 1 } 
	{ bufB_re_address0 sc_out sc_lv 9 signal 2 } 
	{ bufB_re_ce0 sc_out sc_logic 1 signal 2 } 
	{ bufB_re_q0 sc_in sc_lv 32 signal 2 } 
	{ bufB_im_address0 sc_out sc_lv 9 signal 3 } 
	{ bufB_im_ce0 sc_out sc_logic 1 signal 3 } 
	{ bufB_im_q0 sc_in sc_lv 32 signal 3 } 
	{ bufA_re_address0 sc_out sc_lv 9 signal 4 } 
	{ bufA_re_ce0 sc_out sc_logic 1 signal 4 } 
	{ bufA_re_q0 sc_in sc_lv 32 signal 4 } 
	{ bufA_im_address0 sc_out sc_lv 9 signal 5 } 
	{ bufA_im_ce0 sc_out sc_logic 1 signal 5 } 
	{ bufA_im_q0 sc_in sc_lv 32 signal 5 } 
	{ state_cur_030126 sc_in sc_lv 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "state_re_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "state_re", "role": "address1" }} , 
 	{ "name": "state_re_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_re", "role": "ce1" }} , 
 	{ "name": "state_re_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_re", "role": "we1" }} , 
 	{ "name": "state_re_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "state_re", "role": "d1" }} , 
 	{ "name": "state_im_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "state_im", "role": "address1" }} , 
 	{ "name": "state_im_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_im", "role": "ce1" }} , 
 	{ "name": "state_im_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "state_im", "role": "we1" }} , 
 	{ "name": "state_im_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "state_im", "role": "d1" }} , 
 	{ "name": "bufB_re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufB_re", "role": "address0" }} , 
 	{ "name": "bufB_re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufB_re", "role": "ce0" }} , 
 	{ "name": "bufB_re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufB_re", "role": "q0" }} , 
 	{ "name": "bufB_im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufB_im", "role": "address0" }} , 
 	{ "name": "bufB_im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufB_im", "role": "ce0" }} , 
 	{ "name": "bufB_im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufB_im", "role": "q0" }} , 
 	{ "name": "bufA_re_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufA_re", "role": "address0" }} , 
 	{ "name": "bufA_re_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufA_re", "role": "ce0" }} , 
 	{ "name": "bufA_re_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufA_re", "role": "q0" }} , 
 	{ "name": "bufA_im_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "bufA_im", "role": "address0" }} , 
 	{ "name": "bufA_im_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "bufA_im", "role": "ce0" }} , 
 	{ "name": "bufA_im_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "bufA_im", "role": "q0" }} , 
 	{ "name": "state_cur_030126", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "state_cur_030126", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7 {
		state_re {Type O LastRead -1 FirstWrite 1}
		state_im {Type O LastRead -1 FirstWrite 1}
		bufB_re {Type I LastRead 0 FirstWrite -1}
		bufB_im {Type I LastRead 0 FirstWrite -1}
		bufA_re {Type I LastRead 0 FirstWrite -1}
		bufA_im {Type I LastRead 0 FirstWrite -1}
		state_cur_030126 {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "514", "Max" : "514"}
	, {"Name" : "Interval", "Min" : "514", "Max" : "514"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	state_re { ap_memory {  { state_re_address1 MemPortADDR2 1 9 }  { state_re_ce1 MemPortCE2 1 1 }  { state_re_we1 MemPortWE2 1 1 }  { state_re_d1 MemPortDIN2 1 32 } } }
	state_im { ap_memory {  { state_im_address1 MemPortADDR2 1 9 }  { state_im_ce1 MemPortCE2 1 1 }  { state_im_we1 MemPortWE2 1 1 }  { state_im_d1 MemPortDIN2 1 32 } } }
	bufB_re { ap_memory {  { bufB_re_address0 mem_address 1 9 }  { bufB_re_ce0 mem_ce 1 1 }  { bufB_re_q0 mem_dout 0 32 } } }
	bufB_im { ap_memory {  { bufB_im_address0 mem_address 1 9 }  { bufB_im_ce0 mem_ce 1 1 }  { bufB_im_q0 mem_dout 0 32 } } }
	bufA_re { ap_memory {  { bufA_re_address0 mem_address 1 9 }  { bufA_re_ce0 mem_ce 1 1 }  { bufA_re_q0 mem_dout 0 32 } } }
	bufA_im { ap_memory {  { bufA_im_address0 mem_address 1 9 }  { bufA_im_ce0 mem_ce 1 1 }  { bufA_im_q0 mem_dout 0 32 } } }
	state_cur_030126 { ap_none {  { state_cur_030126 in_data 0 1 } } }
}
