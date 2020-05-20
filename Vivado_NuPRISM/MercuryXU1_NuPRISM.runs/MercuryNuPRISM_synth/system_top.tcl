# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param power.BramSDPPropagationFix 1
set_param power.enableUnconnectedCarry8PinPower 1
set_param power.enableCarry8RouteBelPower 1
set_param power.enableLutRouteBelPower 1
create_project -in_memory -part xczu6eg-ffvc900-1-i

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.cache/wt [current_project]
set_property parent.project_path C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/simlink/src/VhpiGeneric.h
set_property file_type "Verilog Header" [get_files C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/simlink/src/VhpiGeneric.h]
read_vhdl -library xil_defaultlib {
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/hdl/MercuryXU1_wrapper.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/src/system_top_NuPRISM.vhd
}
read_vhdl -library surf {
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/SlvDelay.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/xilinx/TrueDualPortRamXpm.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SynchronizerEdge.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/inferred/FifoSync.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SynchronizerOneShotCntVector.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/Gearbox.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/inferred/DualPortRam.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SyncTrigRateVector.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/TextUtilPkg.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SyncStatusVector.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/xilinx/general/rtl/DeviceDna.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SynchronizerVector.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SynchronizerOneShotCnt.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/tb/ClkRst.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/inferred/SimpleDualPortRam.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/CRC32Rtl.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/Arbiter.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/Crc32.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/RstPipelineVector.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/PwrUpRst.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SyncMinMax.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/ArbiterPkg.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/xilinx/FifoXpm.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SyncTrigPeriod.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/PrbsPkg.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/Synchronizer.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/RstSync.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SyncTrigRate.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/FifoOutputPipeline.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/tb/GearboxTb.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/Crc32Parallel.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/StdRtlPkg.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/RstPipeline.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/ClockDivider.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/xilinx/SimpleDualPortRamXpm.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/inferred/FifoWrFsm.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/inferred/QuadPortRam.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/tb/SynchronizerFifoTb.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/xilinx/general/rtl/ClkOutBufDiff.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/Fifo.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SynchronizerOneShotVector.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/inferred/FifoRdFsm.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/Scrambler.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/xilinx/SimpleDualPortRamAlteraMfDummy.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SynchronizerOneShot.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/xilinx/general/rtl/Iprog.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/AsyncGearbox.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/OneShot.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/inferred/TrueDualPortRam.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/inferred/FifoAsync.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/FifoMux.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SyncClockFreq.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/tb/SynchronizerOneShotTb.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/xilinx/FifoAlteraMfDummy.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/xilinx/TrueDualPortRamXpmAlteraMfDummy.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/sync/rtl/SynchronizerFifo.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/xilinx/general/rtl/ClkOutBufSingle.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/Heartbeat.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/tb/glbl.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/tb/HeartbeatTb.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/SlvDelayFifo.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/RegisterVector.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/ram/inferred/OctalPortRam.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/Debouncer.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/fifo/rtl/FifoCascade.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/WatchDogRst.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/surf/base/general/rtl/CrcPkg.vhd
}
read_vhdl -library amc_carrier_core {
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/amc_carrier_core/Ad9229Core.vhd
  C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/lib/amc_carrier_core/Ad9229Deserializer.vhd
}
add_files C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/MercuryXU1.bd
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_0/MercuryXU1_axi_gpio_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_0/MercuryXU1_axi_gpio_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_axi_gpio_0_0/MercuryXU1_axi_gpio_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_0_0/MercuryXU1_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_proc_sys_reset_0_0/MercuryXU1_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0/MercuryXU1_system_management_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0/MercuryXU1_system_management_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_system_management_wiz_0_0/MercuryXU1_system_management_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_zynq_ultra_ps_e_0_0/MercuryXU1_zynq_ultra_ps_e_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_zynq_ultra_ps_e_0_0/MercuryXU1_zynq_ultra_ps_e_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/ip/MercuryXU1_auto_pc_0/MercuryXU1_auto_pc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/bd/MercuryXU1/MercuryXU1_ooc.xdc]

read_ip -quiet C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm.xci
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm_board.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0_b65_mmcm/clk_wiz_0_b65_mmcm_ooc.xdc]

read_ip -quiet C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_1_b64_b66_pll/clk_wiz_1_b64_b66_pll.xci
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_1_b64_b66_pll/clk_wiz_1_b64_b66_pll_board.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_1_b64_b66_pll/clk_wiz_1_b64_b66_pll.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_1_b64_b66_pll/clk_wiz_1_b64_b66_pll_ooc.xdc]

read_ip -quiet C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_divider_pll/clk_divider_pll.xci
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_divider_pll/clk_divider_pll_board.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_divider_pll/clk_divider_pll.xdc]
set_property used_in_implementation false [get_files -all c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_divider_pll/clk_divider_pll_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/src/MercuryXU1_NuPRISM.xdc
set_property used_in_implementation false [get_files C:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/src/MercuryXU1_NuPRISM.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top system_top -part xczu6eg-ffvc900-1-i


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef system_top.dcp
create_report "MercuryNuPRISM_synth_synth_report_utilization_0" "report_utilization -file system_top_utilization_synth.rpt -pb system_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]