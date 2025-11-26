set ModuleHierarchy {[{
"Name" : "qaoa_kernel","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "retval_0_loc_channel1_U","ID" : "1","Type" : "sequential",
		"SubInsts" : [
		{"Name" : "grp_Block_entry_state_re_wr_d_rd_proc_Pipeline_1_fu_151","ID" : "2","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Loop 1","ID" : "3","Type" : "pipeline"},]},
		{"Name" : "grp_qaoaStep_hls_3_1_s_fu_159","ID" : "4","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_build_feasible_superposition_3_s_fu_58","ID" : "5","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_60_2","ID" : "6","Type" : "pipeline"},]},
			{"Name" : "grp_applyCost_hls_3_s_fu_66","ID" : "7","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_86_1_VITIS_LOOP_61_1","ID" : "8","Type" : "pipeline",
				"SubInsts" : [
				{"Name" : "grp_costHamiltonian_3_s_fu_209","ID" : "9","Type" : "pipeline"},]},]},
			{"Name" : "grp_applyMixer_hls_3_s_fu_80","ID" : "10","Type" : "sequential",
				"SubInsts" : [
				{"Name" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_61_1_fu_262","ID" : "11","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_61_1","ID" : "12","Type" : "pipeline"},]},
				{"Name" : "grp_applyMixer_hls_3_Pipeline_2_fu_271","ID" : "13","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","ID" : "14","Type" : "pipeline"},]},
				{"Name" : "grp_applyMixer_hls_3_Pipeline_3_fu_277","ID" : "15","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "Loop 1","ID" : "16","Type" : "pipeline"},]},
				{"Name" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_116_1_fu_283","ID" : "17","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_116_1","ID" : "18","Type" : "pipeline"},]},
				{"Name" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_166_7_fu_293","ID" : "19","Type" : "sequential",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_166_7","ID" : "20","Type" : "pipeline"},]},],
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_127_2","ID" : "21","Type" : "no",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_131_3","ID" : "22","Type" : "no",
					"SubLoops" : [
					{"Name" : "VITIS_LOOP_132_4","ID" : "23","Type" : "no",
						"SubInsts" : [
						{"Name" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_134_5_fu_307","ID" : "24","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_134_5","ID" : "25","Type" : "pipeline"},]},
						{"Name" : "grp_applyMixer_hls_3_Pipeline_VITIS_LOOP_140_6_fu_319","ID" : "26","Type" : "sequential",
								"SubLoops" : [
								{"Name" : "VITIS_LOOP_140_6","ID" : "27","Type" : "pipeline"},]},]},]},]},]},]},
		{"Name" : "grp_expectation_cost_3_s_fu_175","ID" : "28","Type" : "sequential",
			"SubInsts" : [
			{"Name" : "grp_expectation_cost_3_Pipeline_VITIS_LOOP_177_1_fu_144","ID" : "29","Type" : "sequential",
				"SubLoops" : [
				{"Name" : "VITIS_LOOP_177_1","ID" : "30","Type" : "pipeline"},]},]},]},
	{"Name" : "Block_entry_proc_proc_U0","ID" : "31","Type" : "sequential"},]
}]}