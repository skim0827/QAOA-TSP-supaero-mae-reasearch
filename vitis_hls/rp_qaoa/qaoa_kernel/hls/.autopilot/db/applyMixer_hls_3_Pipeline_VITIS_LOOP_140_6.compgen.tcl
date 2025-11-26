# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 47 \
    name bufB_re \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename bufB_re \
    op interface \
    ports { bufB_re_address0 { O 9 vector } bufB_re_ce0 { O 1 bit } bufB_re_q0 { I 32 vector } bufB_re_address1 { O 9 vector } bufB_re_ce1 { O 1 bit } bufB_re_we1 { O 1 bit } bufB_re_d1 { O 32 vector } bufB_re_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bufB_re'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 48 \
    name bufB_im \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename bufB_im \
    op interface \
    ports { bufB_im_address0 { O 9 vector } bufB_im_ce0 { O 1 bit } bufB_im_q0 { I 32 vector } bufB_im_address1 { O 9 vector } bufB_im_ce1 { O 1 bit } bufB_im_we1 { O 1 bit } bufB_im_d1 { O 32 vector } bufB_im_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bufB_im'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 49 \
    name bufA_re \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename bufA_re \
    op interface \
    ports { bufA_re_address0 { O 9 vector } bufA_re_ce0 { O 1 bit } bufA_re_q0 { I 32 vector } bufA_re_address1 { O 9 vector } bufA_re_ce1 { O 1 bit } bufA_re_we1 { O 1 bit } bufA_re_d1 { O 32 vector } bufA_re_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bufA_re'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 50 \
    name bufA_im \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename bufA_im \
    op interface \
    ports { bufA_im_address0 { O 9 vector } bufA_im_ce0 { O 1 bit } bufA_im_q0 { I 32 vector } bufA_im_address1 { O 9 vector } bufA_im_ce1 { O 1 bit } bufA_im_we1 { O 1 bit } bufA_im_d1 { O 32 vector } bufA_im_q1 { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'bufA_im'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name zext_ln128_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_zext_ln128_1 \
    op interface \
    ports { zext_ln128_1 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name shl49 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_shl49 \
    op interface \
    ports { shl49 { I 3 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name mask \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mask \
    op interface \
    ports { mask { I 9 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name state_cur_223131 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_state_cur_223131 \
    op interface \
    ports { state_cur_223131 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name trunc_ln102_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln102_cast \
    op interface \
    ports { trunc_ln102_cast { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name sext_ln127 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln127 \
    op interface \
    ports { sext_ln127 { I 22 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name state_next_222129 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_state_next_222129 \
    op interface \
    ports { state_next_222129 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


# flow_control definition:
set InstName qaoa_kernel_flow_control_loop_pipe_sequential_init_U
set CompName qaoa_kernel_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix qaoa_kernel_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


