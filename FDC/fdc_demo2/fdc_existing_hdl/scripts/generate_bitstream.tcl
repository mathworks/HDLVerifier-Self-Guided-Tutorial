update_compile_order -fileset sources_1
generate_target all [get_files  $mw_proj_path/existing_hdl_dataCapture/existing_hdl_dataCapture.srcs/sources_1/bd/PulseDet_soc/PulseDet_soc.bd]
export_ip_user_files -of_objects [get_files $mw_proj_path/existing_hdl_dataCapture/existing_hdl_dataCapture.srcs/sources_1/bd/PulseDet_soc/PulseDet_soc.bd] -no_script -sync -force -quiet
create_ip_run [get_files -of_objects [get_fileset sources_1] $mw_proj_path/existing_hdl_dataCapture/existing_hdl_dataCapture.srcs/sources_1/bd/PulseDet_soc/PulseDet_soc.bd]

reset_run impl_1 -prev_step 
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
