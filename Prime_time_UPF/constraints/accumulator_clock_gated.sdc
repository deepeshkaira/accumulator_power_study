create_clock -name clk -period 10000.000 [get_ports clk]

set_clock_uncertainty 100.000 [get_clocks clk]
set_clock_transition 20.000 [get_clocks clk]

set_input_delay 1000.000 -clock [get_clocks clk] [get_ports {enable data_in[*]}]

set_output_delay 1000.000 -clock [get_clocks clk] [get_ports {acc_out[*] overflow}]

set_input_transition 50 [get_ports {rst_n enable data_in[*]}]

#output loading assumption
set_load 5 [all_outputs]

#rst_n is an asynhronous reset , not synhcronous data
set_false_path -from [get_ports rst_n]
