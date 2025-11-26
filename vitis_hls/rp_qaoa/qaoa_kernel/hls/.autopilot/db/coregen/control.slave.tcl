dict set slaves control {ports {ap_start {type ap_ctrl width 1} ap_done {type ap_ctrl width 1} ap_ready {type ap_ctrl width 1} ap_idle {type ap_ctrl width 1} ap_return {type ap_return width 32} gamma {type i_ap_none width 32} beta {type i_ap_none width 32} get_best_state {type i_ap_none width 1} best_state {type o_ap_vld width 32} d {type i_ap_memory width 32}} mems {d {width 32}} has_ctrl 1}
set datawidth 32
set addrwidth 64
set intr_clr_mode TOW
