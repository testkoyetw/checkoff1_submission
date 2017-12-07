set projDir "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/planAhead"
set projName "1D_Game"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/mojo_top_0.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/reset_conditioner_1.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/button_2.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/multi_seven_seg_3.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/alu_4.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/button_conditioner_5.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/edge_detector_6.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/button_conditioner_5.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/edge_detector_6.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/button_conditioner_5.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/edge_detector_6.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/button_conditioner_5.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/edge_detector_6.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/button_conditioner_5.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/edge_detector_6.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/counter_15.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/seven_seg_16.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/decoder_17.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/adder_18.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/compare_19.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/boole_20.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/shifter_21.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/pipeline_22.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/pipeline_22.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/pipeline_22.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/pipeline_22.v" "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/work/verilog/pipeline_22.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/CaCO3/Desktop/1D_Game_really_final/1D_Game_really_final/constraint/custom.ucf" "E:/Mojo\ IDE/library/components/io_shield.ucf" "E:/Mojo\ IDE/library/components/mojo.ucf"]
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
