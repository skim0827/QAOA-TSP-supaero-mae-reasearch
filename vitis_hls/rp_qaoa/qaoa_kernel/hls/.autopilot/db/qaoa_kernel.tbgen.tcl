set moduleName qaoa_kernel
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
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
set C_modelName {qaoa_kernel}
set C_modelType { float 32 }
set ap_memory_interface_dict [dict create]
dict set ap_memory_interface_dict d { MEM_WIDTH 32 MEM_SIZE 36 MASTER_TYPE BRAM_CTRL MEM_ADDRESS_MODE WORD_ADDRESS PACKAGE_IO port READ_LATENCY 1 }
set C_modelArgList {
	{ d int 32 regular {axi_slave 0}  }
	{ gamma int 32 regular {axi_slave 0}  }
	{ beta int 32 regular {axi_slave 0}  }
	{ get_best_state uint 1 regular {axi_slave 0}  }
	{ best_state int 32 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "d", "interface" : "axi_slave", "bundle":"control","type":"ap_memory","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":127}} , 
 	{ "Name" : "gamma", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "beta", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "get_best_state", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "best_state", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":48}, "offset_end" : {"out":55}} , 
 	{ "Name" : "ap_return", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "offset" : {"out":16}} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"qaoa_kernel","role":"start","value":"0","valid_bit":"0"},{"name":"qaoa_kernel","role":"continue","value":"0","valid_bit":"4"},{"name":"qaoa_kernel","role":"auto_start","value":"0","valid_bit":"7"},{"name":"gamma","role":"data","value":"24"},{"name":"beta","role":"data","value":"32"},{"name":"get_best_state","role":"data","value":"40"},{"name":"d","role":"data","value":"64"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"qaoa_kernel","role":"start","value":"0","valid_bit":"0"},{"name":"qaoa_kernel","role":"done","value":"0","valid_bit":"1"},{"name":"qaoa_kernel","role":"idle","value":"0","valid_bit":"2"},{"name":"qaoa_kernel","role":"ready","value":"0","valid_bit":"3"},{"name":"qaoa_kernel","role":"auto_start","value":"0","valid_bit":"7"},{"name":"return","role":"data","value":"16"},{"name":"best_state","role":"data","value":"48"}, {"name":"best_state","role":"valid","value":"52","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "62", "63"],
		"CDFG" : "qaoa_kernel",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "159885", "EstimateLatencyMax" : "206110",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "2", "Name" : "Block_entry_state_re_wr_d_rd_proc_U0"}],
		"OutputProcess" : [
			{"ID" : "2", "Name" : "Block_entry_state_re_wr_d_rd_proc_U0"},
			{"ID" : "62", "Name" : "Block_entry_proc_proc_U0"}],
		"Port" : [
			{"Name" : "d", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Block_entry_state_re_wr_d_rd_proc_U0", "Port" : "d"}]},
			{"Name" : "gamma", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Block_entry_state_re_wr_d_rd_proc_U0", "Port" : "gamma"}]},
			{"Name" : "beta", "Type" : "None", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Block_entry_state_re_wr_d_rd_proc_U0", "Port" : "beta"}]},
			{"Name" : "get_best_state", "Type" : "None", "Direction" : "I"},
			{"Name" : "best_state", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Block_entry_state_re_wr_d_rd_proc_U0", "Port" : "best_state"}]},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Block_entry_state_re_wr_d_rd_proc_U0", "Port" : "cordic_apfixed_circ_table_arctan_128"}]},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "2", "SubInstance" : "Block_entry_state_re_wr_d_rd_proc_U0", "Port" : "circ_table_arctan_1289"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0", "Parent" : "0", "Child" : ["3", "4", "5", "7", "47", "58", "59", "60", "61"],
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
					{"ID" : "7", "SubInstance" : "grp_qaoaStep_hls_3_1_s_fu_159", "Port" : "d", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "47", "SubInstance" : "grp_expectation_cost_3_s_fu_175", "Port" : "d", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "gamma", "Type" : "None", "Direction" : "I"},
			{"Name" : "beta", "Type" : "None", "Direction" : "I"},
			{"Name" : "get_best_state", "Type" : "None", "Direction" : "I"},
			{"Name" : "best_state", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_qaoaStep_hls_3_1_s_fu_159", "Port" : "cordic_apfixed_circ_table_arctan_128", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "grp_qaoaStep_hls_3_1_s_fu_159", "Port" : "circ_table_arctan_1289", "Inst_start_state" : "3", "Inst_end_state" : "4"}]}]},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.state_im_i_U", "Parent" : "2"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.state_re_i_U", "Parent" : "2"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151", "Parent" : "2", "Child" : ["6"],
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
	{"ID" : "6", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159", "Parent" : "2", "Child" : ["8", "10", "19", "46"],
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
					{"ID" : "8", "SubInstance" : "grp_build_feasible_superposition_3_s_fu_58", "Port" : "state_re", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "state_re", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "19", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "state_re", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_build_feasible_superposition_3_s_fu_58", "Port" : "state_im", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "10", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "state_im", "Inst_start_state" : "3", "Inst_end_state" : "4"},
					{"ID" : "19", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "state_im", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "d", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "gamma_0_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "beta_0_0_val", "Type" : "None", "Direction" : "I"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "10", "SubInstance" : "grp_applyCost_hls_3_s_fu_66", "Port" : "cordic_apfixed_circ_table_arctan_128", "Inst_start_state" : "3", "Inst_end_state" : "4"}]},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "grp_applyMixer_hls_3_s_fu_80", "Port" : "circ_table_arctan_1289", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58", "Parent" : "7", "Child" : ["9"],
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
	{"ID" : "9", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_build_feasible_superposition_3_s_fu_58.flow_control_loop_pipe_sequential_init_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66", "Parent" : "7", "Child" : ["11", "12", "14", "15", "16", "17", "18"],
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
					{"ID" : "12", "SubInstance" : "grp_costHamiltonian_3_s_fu_209", "Port" : "d", "Inst_start_state" : "2", "Inst_end_state" : "31"}]},
			{"Name" : "gamma", "Type" : "None", "Direction" : "I"},
			{"Name" : "cordic_apfixed_circ_table_arctan_128", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_86_1_VITIS_LOOP_61_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "9", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage8", "LastStateIter" : "ap_enable_reg_pp0_iter4", "LastStateBlock" : "ap_block_pp0_stage8_subdone", "QuitState" : "ap_ST_fsm_pp0_stage8", "QuitStateIter" : "ap_enable_reg_pp0_iter4", "QuitStateBlock" : "ap_block_pp0_stage8_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "11", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.cordic_apfixed_circ_table_arctan_128_U", "Parent" : "10"},
	{"ID" : "12", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209", "Parent" : "10", "Child" : ["13"],
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
	{"ID" : "13", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.grp_costHamiltonian_3_s_fu_209.mul_49s_23s_68_3_1_U5", "Parent" : "12"},
	{"ID" : "14", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.mul_11ns_33ns_34_2_1_U9", "Parent" : "10"},
	{"ID" : "15", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.mul_32ns_46ns_76_3_1_U10", "Parent" : "10"},
	{"ID" : "16", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.sparsemux_7_2_33_1_1_U13", "Parent" : "10"},
	{"ID" : "17", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.sparsemux_7_2_33_1_1_U14", "Parent" : "10"},
	{"ID" : "18", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyCost_hls_3_s_fu_66.flow_control_loop_pipe_sequential_init_U", "Parent" : "10"},
	{"ID" : "19", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80", "Parent" : "7", "Child" : ["20", "21", "22", "23", "24", "27", "29", "31", "33", "35", "37", "42", "43", "44", "45"],
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
					{"ID" : "31", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Port" : "state_re", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "33", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Port" : "state_re", "Inst_start_state" : "17", "Inst_end_state" : "23"}]},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "31", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Port" : "state_im", "Inst_start_state" : "15", "Inst_end_state" : "16"},
					{"ID" : "33", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Port" : "state_im", "Inst_start_state" : "17", "Inst_end_state" : "23"}]},
			{"Name" : "beta", "Type" : "None", "Direction" : "I"},
			{"Name" : "circ_table_arctan_1289", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "24", "SubInstance" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262", "Port" : "circ_table_arctan_1289", "Inst_start_state" : "13", "Inst_end_state" : "14"}]}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_132_4", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state19", "LastState" : ["ap_ST_fsm_state22"], "QuitState" : ["ap_ST_fsm_state19"], "PreState" : ["ap_ST_fsm_state18"], "PostState" : ["ap_ST_fsm_state18"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_131_3", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state18", "LastState" : ["ap_ST_fsm_state19"], "QuitState" : ["ap_ST_fsm_state18"], "PreState" : ["ap_ST_fsm_state17"], "PostState" : ["ap_ST_fsm_state17"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "VITIS_LOOP_127_2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "23", "FirstState" : "ap_ST_fsm_state17", "LastState" : ["ap_ST_fsm_state18"], "QuitState" : ["ap_ST_fsm_state17"], "PreState" : ["ap_ST_fsm_state16"], "PostState" : ["ap_ST_fsm_state23"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "20", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.bufA_re_U", "Parent" : "19"},
	{"ID" : "21", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.bufA_im_U", "Parent" : "19"},
	{"ID" : "22", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.bufB_re_U", "Parent" : "19"},
	{"ID" : "23", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.bufB_im_U", "Parent" : "19"},
	{"ID" : "24", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262", "Parent" : "19", "Child" : ["25", "26"],
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
	{"ID" : "25", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.circ_table_arctan_1289_U", "Parent" : "24"},
	{"ID" : "26", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262.flow_control_loop_pipe_sequential_init_U", "Parent" : "24"},
	{"ID" : "27", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271", "Parent" : "19", "Child" : ["28"],
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
	{"ID" : "28", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_2_fu_271.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277", "Parent" : "19", "Child" : ["30"],
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
	{"ID" : "30", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_3_fu_277.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283", "Parent" : "19", "Child" : ["32"],
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
	{"ID" : "32", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293", "Parent" : "19", "Child" : ["34"],
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
	{"ID" : "34", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "35", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307", "Parent" : "19", "Child" : ["36"],
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
	{"ID" : "36", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "37", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319", "Parent" : "19", "Child" : ["38", "39", "40", "41"],
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
	{"ID" : "38", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U41", "Parent" : "37"},
	{"ID" : "39", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U42", "Parent" : "37"},
	{"ID" : "40", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.mul_32s_22s_52_2_1_U43", "Parent" : "37"},
	{"ID" : "41", "Level" : "5", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "42", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.mul_12ns_65ns_66_5_1_U62", "Parent" : "19"},
	{"ID" : "43", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.mul_53ns_90ns_141_5_1_U63", "Parent" : "19"},
	{"ID" : "44", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.sparsemux_7_2_65_1_1_U64", "Parent" : "19"},
	{"ID" : "45", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.grp_applyMixer_hls_3_s_fu_80.sparsemux_7_2_65_1_1_U65", "Parent" : "19"},
	{"ID" : "46", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_qaoaStep_hls_3_1_s_fu_159.mul_32s_22s_52_2_1_U74", "Parent" : "7"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175", "Parent" : "2", "Child" : ["48"],
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
					{"ID" : "48", "SubInstance" : "grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144", "Port" : "state_re", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "state_im", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "48", "SubInstance" : "grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144", "Port" : "state_im", "Inst_start_state" : "10", "Inst_end_state" : "11"}]},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "48", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144", "Parent" : "47", "Child" : ["49", "50", "51", "52", "53", "54", "55", "56", "57"],
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
	{"ID" : "49", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_32s_32s_52_2_1_U83", "Parent" : "48"},
	{"ID" : "50", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_32s_32s_52_2_1_U84", "Parent" : "48"},
	{"ID" : "51", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U85", "Parent" : "48"},
	{"ID" : "52", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U86", "Parent" : "48"},
	{"ID" : "53", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U87", "Parent" : "48"},
	{"ID" : "54", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U88", "Parent" : "48"},
	{"ID" : "55", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U89", "Parent" : "48"},
	{"ID" : "56", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.mul_49s_23s_68_3_1_x_U90", "Parent" : "48"},
	{"ID" : "57", "Level" : "4", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.grp_expectation_cost_3_s_fu_175.grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144.flow_control_loop_pipe_sequential_init_U", "Parent" : "48"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.ctlz_32_32_1_1_U109", "Parent" : "2"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.bitselect_1ns_32ns_32s_1_1_1_U110", "Parent" : "2"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.bitselect_1ns_32ns_32s_1_1_1_U111", "Parent" : "2"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Block_entry_state_re_wr_d_rd_proc_U0.mul_32s_32s_52_2_1_U112", "Parent" : "2"},
	{"ID" : "62", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Block_entry_proc_proc_U0", "Parent" : "0",
		"CDFG" : "Block_entry_proc_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_read", "Type" : "None", "Direction" : "I", "DependentProc" : ["2"], "DependentChan" : "63", "DependentChanDepth" : "2", "DependentChanType" : "1"}]},
	{"ID" : "63", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.retval_0_loc_channel1_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	qaoa_kernel {
		d {Type I LastRead 17 FirstWrite -1}
		gamma {Type I LastRead 2 FirstWrite -1}
		beta {Type I LastRead 2 FirstWrite -1}
		get_best_state {Type I LastRead 0 FirstWrite -1}
		best_state {Type O LastRead -1 FirstWrite 5}
		cordic_apfixed_circ_table_arctan_128 {Type I LastRead -1 FirstWrite -1}
		circ_table_arctan_1289 {Type I LastRead -1 FirstWrite -1}}
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
		argmax_out {Type O LastRead -1 FirstWrite 30}}
	Block_entry_proc_proc {
		p_read {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "159885", "Max" : "206110"}
	, {"Name" : "Interval", "Min" : "159885", "Max" : "206110"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
