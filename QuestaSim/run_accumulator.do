vopt accumulator_tb +acc -pa_top /accumulator_tb/dut -pa_upf upf/accumulator_upf.upf -pa_lib work -pa_genrpt=pa+de -o accumulator_pa_opt

vsim -sv_seed 12345 accumulator_pa_opt -pa -pa_lib work

add wave sim:/accumulator_tb/clk
add wave sim:/accumulator_tb/intf/rst_n
add wave sim:/accumulator_tb/intf/enable
add wave sim:/accumulator_tb/intf/data_in
add wave sim:/accumulator_tb/intf/acc_out
add wave sim:/accumulator_tb/intf/overflow
add wave sim:/accumulator_tb/dut/extended_sum

file mkdir saif_reports

# Reset is released at 15 ns. Stop before the first transaction at 20 ns.
run 16ns

power add -r /accumulator_tb/dut/*

run -all

power report -all -bsaif saif_reports/accumulator.saif
