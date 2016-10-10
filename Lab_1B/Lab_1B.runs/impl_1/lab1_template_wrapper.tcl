proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.cache/wt [current_project]
  set_property parent.project_path /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.xpr [current_project]
  set_property ip_repo_paths {
  /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.cache/ip
  /fs/student/mgdaily/Documents/ECE153/labfiles/vivado/seven/ip_repo
} [current_project]
  set_property ip_output_repo /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.cache/ip [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.runs/synth_1/lab1_template_wrapper.dcp
  add_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/lab1_template.bmm
  set_property SCOPED_TO_REF lab1_template [get_files -all /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/lab1_template.bmm]
  add_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_0/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF lab1_template [get_files -all /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_0/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_0/data/mb_bootloop_le.elf]
  read_xdc -ref lab1_template_microblaze_0_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_0/lab1_template_microblaze_0_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_0/lab1_template_microblaze_0_0.xdc]
  read_xdc -ref lab1_template_dlmb_v10_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_dlmb_v10_0/lab1_template_dlmb_v10_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_dlmb_v10_0/lab1_template_dlmb_v10_0.xdc]
  read_xdc -ref lab1_template_ilmb_v10_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_ilmb_v10_0/lab1_template_ilmb_v10_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_ilmb_v10_0/lab1_template_ilmb_v10_0.xdc]
  read_xdc -ref lab1_template_microblaze_0_axi_intc_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_axi_intc_0/lab1_template_microblaze_0_axi_intc_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_axi_intc_0/lab1_template_microblaze_0_axi_intc_0.xdc]
  read_xdc -ref lab1_template_mdm_1_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_mdm_1_0/lab1_template_mdm_1_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_mdm_1_0/lab1_template_mdm_1_0.xdc]
  read_xdc -prop_thru_buffers -ref lab1_template_clk_wiz_1_0 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_clk_wiz_1_0/lab1_template_clk_wiz_1_0_board.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_clk_wiz_1_0/lab1_template_clk_wiz_1_0_board.xdc]
  read_xdc -ref lab1_template_clk_wiz_1_0 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_clk_wiz_1_0/lab1_template_clk_wiz_1_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_clk_wiz_1_0/lab1_template_clk_wiz_1_0.xdc]
  read_xdc -prop_thru_buffers -ref lab1_template_rst_clk_wiz_1_100M_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_rst_clk_wiz_1_100M_0/lab1_template_rst_clk_wiz_1_100M_0_board.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_rst_clk_wiz_1_100M_0/lab1_template_rst_clk_wiz_1_100M_0_board.xdc]
  read_xdc -ref lab1_template_rst_clk_wiz_1_100M_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_rst_clk_wiz_1_100M_0/lab1_template_rst_clk_wiz_1_100M_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_rst_clk_wiz_1_100M_0/lab1_template_rst_clk_wiz_1_100M_0.xdc]
  read_xdc -ref lab1_template_axi_timer_0_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_timer_0_0/lab1_template_axi_timer_0_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_timer_0_0/lab1_template_axi_timer_0_0.xdc]
  read_xdc -prop_thru_buffers -ref lab1_template_axi_gpio_0_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_gpio_0_0/lab1_template_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_gpio_0_0/lab1_template_axi_gpio_0_0_board.xdc]
  read_xdc -ref lab1_template_axi_gpio_0_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_gpio_0_0/lab1_template_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_gpio_0_0/lab1_template_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref lab1_template_axi_gpio_0_1 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_gpio_0_1/lab1_template_axi_gpio_0_1_board.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_gpio_0_1/lab1_template_axi_gpio_0_1_board.xdc]
  read_xdc -ref lab1_template_axi_gpio_0_1 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_gpio_0_1/lab1_template_axi_gpio_0_1.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_axi_gpio_0_1/lab1_template_axi_gpio_0_1.xdc]
  read_xdc -ref lab1_template_mig_7series_0_0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_mig_7series_0_0/lab1_template_mig_7series_0_0/user_design/constraints/lab1_template_mig_7series_0_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_mig_7series_0_0/lab1_template_mig_7series_0_0/user_design/constraints/lab1_template_mig_7series_0_0.xdc]
  read_xdc -prop_thru_buffers -ref lab1_template_rst_mig_7series_0_81M_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_rst_mig_7series_0_81M_0/lab1_template_rst_mig_7series_0_81M_0_board.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_rst_mig_7series_0_81M_0/lab1_template_rst_mig_7series_0_81M_0_board.xdc]
  read_xdc -ref lab1_template_rst_mig_7series_0_81M_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_rst_mig_7series_0_81M_0/lab1_template_rst_mig_7series_0_81M_0.xdc
  set_property processing_order EARLY [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_rst_mig_7series_0_81M_0/lab1_template_rst_mig_7series_0_81M_0.xdc]
  read_xdc /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/constrs_1/imports/labfiles/Nexys4_master_DDR.xdc
  read_xdc -ref lab1_template_microblaze_0_axi_intc_0 -cells U0 /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_axi_intc_0/lab1_template_microblaze_0_axi_intc_0_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_microblaze_0_axi_intc_0/lab1_template_microblaze_0_axi_intc_0_clocks.xdc]
  read_xdc -ref lab1_template_auto_ds_0 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_0/lab1_template_auto_ds_0_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_0/lab1_template_auto_ds_0_clocks.xdc]
  read_xdc -ref lab1_template_auto_ds_1 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_1/lab1_template_auto_ds_1_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_1/lab1_template_auto_ds_1_clocks.xdc]
  read_xdc -ref lab1_template_auto_ds_2 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_2/lab1_template_auto_ds_2_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_2/lab1_template_auto_ds_2_clocks.xdc]
  read_xdc -ref lab1_template_auto_ds_3 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_3/lab1_template_auto_ds_3_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_3/lab1_template_auto_ds_3_clocks.xdc]
  read_xdc -ref lab1_template_auto_ds_4 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_4/lab1_template_auto_ds_4_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_4/lab1_template_auto_ds_4_clocks.xdc]
  read_xdc -ref lab1_template_auto_ds_5 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_5/lab1_template_auto_ds_5_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_ds_5/lab1_template_auto_ds_5_clocks.xdc]
  read_xdc -ref lab1_template_auto_cc_0 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_cc_0/lab1_template_auto_cc_0_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_cc_0/lab1_template_auto_cc_0_clocks.xdc]
  read_xdc -ref lab1_template_auto_us_0 -cells inst /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_us_0/lab1_template_auto_us_0_clocks.xdc
  set_property processing_order LATE [get_files /fs/student/mgdaily/Documents/ECE153/Lab_1B/Lab_1B.srcs/sources_1/bd/lab1_template/ip/lab1_template_auto_us_0/lab1_template_auto_us_0_clocks.xdc]
  link_design -top lab1_template_wrapper -part xc7a100tcsg324-1
  write_hwdef -file lab1_template_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  set src_rc [catch { 
    puts "source /fs/student/mgdaily/Documents/ECE153/labfiles/MIGFiles/drc_err_warning.tcl"
    source /fs/student/mgdaily/Documents/ECE153/labfiles/MIGFiles/drc_err_warning.tcl
  } _RESULT] 
  if {$src_rc} { 
    send_msg_id runtcl-1 error "$_RESULT"
    send_msg_id runtcl-2 error "sourcing script /fs/student/mgdaily/Documents/ECE153/labfiles/MIGFiles/drc_err_warning.tcl failed"
    return -code error
  }
  opt_design 
  write_checkpoint -force lab1_template_wrapper_opt.dcp
  report_drc -file lab1_template_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force lab1_template_wrapper_placed.dcp
  report_io -file lab1_template_wrapper_io_placed.rpt
  report_utilization -file lab1_template_wrapper_utilization_placed.rpt -pb lab1_template_wrapper_utilization_placed.pb
  report_control_sets -verbose -file lab1_template_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force lab1_template_wrapper_routed.dcp
  report_drc -file lab1_template_wrapper_drc_routed.rpt -pb lab1_template_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file lab1_template_wrapper_timing_summary_routed.rpt -rpx lab1_template_wrapper_timing_summary_routed.rpx
  report_power -file lab1_template_wrapper_power_routed.rpt -pb lab1_template_wrapper_power_summary_routed.pb -rpx lab1_template_wrapper_power_routed.rpx
  report_route_status -file lab1_template_wrapper_route_status.rpt -pb lab1_template_wrapper_route_status.pb
  report_clock_utilization -file lab1_template_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set src_rc [catch { 
    puts "source /fs/student/mgdaily/Documents/ECE153/labfiles/MIGFiles/drc_err_warning.tcl"
    source /fs/student/mgdaily/Documents/ECE153/labfiles/MIGFiles/drc_err_warning.tcl
  } _RESULT] 
  if {$src_rc} { 
    send_msg_id runtcl-1 error "$_RESULT"
    send_msg_id runtcl-2 error "sourcing script /fs/student/mgdaily/Documents/ECE153/labfiles/MIGFiles/drc_err_warning.tcl failed"
    return -code error
  }
  catch { write_mem_info -force lab1_template_wrapper.mmi }
  catch { write_bmm -force lab1_template_wrapper_bd.bmm }
  write_bitstream -force lab1_template_wrapper.bit 
  catch { write_sysdef -hwdef lab1_template_wrapper.hwdef -bitfile lab1_template_wrapper.bit -meminfo lab1_template_wrapper.mmi -file lab1_template_wrapper.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

