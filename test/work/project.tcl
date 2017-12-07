set projDir "E:/mojo/External IO/work/planAhead"
set projName "External IO"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "E:/mojo/External IO/work/verilog/mojo_top_0.v" "E:/mojo/External IO/work/verilog/alu_1.v" "E:/mojo/External IO/work/verilog/reset_conditioner_2.v" "E:/mojo/External IO/work/verilog/button_3.v" "E:/mojo/External IO/work/verilog/multi_seven_seg_4.v" "E:/mojo/External IO/work/verilog/adder_5.v" "E:/mojo/External IO/work/verilog/comparer_6.v" "E:/mojo/External IO/work/verilog/boolean_7.v" "E:/mojo/External IO/work/verilog/shifter_8.v" "E:/mojo/External IO/work/verilog/button_conditioner_9.v" "E:/mojo/External IO/work/verilog/edge_detector_10.v" "E:/mojo/External IO/work/verilog/button_conditioner_9.v" "E:/mojo/External IO/work/verilog/edge_detector_10.v" "E:/mojo/External IO/work/verilog/button_conditioner_9.v" "E:/mojo/External IO/work/verilog/edge_detector_10.v" "E:/mojo/External IO/work/verilog/counter_15.v" "E:/mojo/External IO/work/verilog/seven_seg_16.v" "E:/mojo/External IO/work/verilog/decoder_17.v" "E:/mojo/External IO/work/verilog/pipeline_18.v" "E:/mojo/External IO/work/verilog/pipeline_18.v" "E:/mojo/External IO/work/verilog/pipeline_18.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "E:/mojo/External\ IO/constraint/custom.ucf" "E:/Mojo\ IDE/library/components/io_shield.ucf" "E:/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
