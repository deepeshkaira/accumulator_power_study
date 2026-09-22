vopt accumulator_clock_gated_tb +acc -pa_top /accumulator_clock_gated_tb/dut -pa_upf upf/accumulator_upf.upf -pa_lib work -pa_genrpt=pa+de -o accumulator_clock_gated_pa_opt

vsim -sv_seed 12345 accumulator_clock_gated_pa_opt -pa -pa_lib work

add wave sim:/accumulator_clock_gated_tb/clk
add wave sim:/accumulator_clock_gated_tb/intf/rst_n
add wave sim:/accumulator_clock_gated_tb/intf/enable
add wave sim:/accumulator_clock_gated_tb/intf/data_in
add wave sim:/accumulator_clock_gated_tb/intf/acc_out
add wave sim:/accumulator_clock_gated_tb/intf/overflow
add wave sim:/accumulator_clock_gated_tb/dut/extended_sum
add wave sim:/accumulator_clock_gated_tb/dut/data_in_gated
add wave sim:/accumulator_clock_gated_tb/dut/gate_request
add wave sim:/accumulator_clock_gated_tb/dut/gated_clk

file mkdir saif_reports

# Reset is released at 15 ns. Stop before the first transaction at 20 ns.
run 16ns

power add -r /accumulator_clock_gated_tb/dut/*

run -all

power report -all -bsaif saif_reports/accumulator_clock_gated.saif
