source ./scripts/setup.tcl
puts $mw_proj_path
open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target
set_property PROGRAM.FILE {./existing_hdl_dataCapture/existing_hdl_dataCapture.runs/impl_1/PulseDet_soc_wrapper.bit} [get_hw_devices xc7z020_1]
current_hw_device [get_hw_devices xc7z020_1]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7z020_1] 0]
update_compile_order -fileset sources_1
set_property PROBES.FILE {} [get_hw_devices xc7z020_1]
set_property FULL_PROBES.FILE {} [get_hw_devices xc7z020_1]
program_hw_devices [get_hw_devices xc7z020_1]
refresh_hw_device [lindex [get_hw_devices xc7z020_1] 0]
close_hw_manager
