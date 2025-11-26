# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
ap_return { 
	dir o
	width 32
	depth 1
	mode ap_ctrl_hs
	offset 16
	offset_end 0
}
gamma { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
beta { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
get_best_state { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
best_state { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 48
	offset_end 55
}
d { 
	dir I
	width 32
	depth 9
	mode ap_memory
	offset 64
	offset_end 127
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
interrupt {
}
}
dict set axilite_register_dict control $port_control


