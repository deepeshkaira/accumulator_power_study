set script_dir [file dirname [file normalize [info script]]]
set project_root [file normalize [file join $script_dir ..]]

puts "PrimeTime project root: $project_root"

set netlist_file [file join $project_root netlist accumulator_power_gated.v]
set sdc_file [file join $project_root netlist accumulator_power_gated.sdc]
set saif_file [file join $project_root saif accumulator_power_gated.saif]
set library_dir [file join $project_root lib asap7_db]
set report_dir [file join $project_root reports power]

set library_files [list \
    [file join $library_dir asap7sc7p5t_AO_RVT_TT_08302018.db] \
    [file join $library_dir asap7sc7p5t_INVBUF_RVT_TT_08302018.db] \
    [file join $library_dir asap7sc7p5t_OA_RVT_TT_08302018.db] \
    [file join $library_dir asap7sc7p5t_SEQ_RVT_TT_08302018.db] \
    [file join $library_dir asap7sc7p5t_SIMPLE_RVT_TT_08302018.db] \
]

# verify the netlist , sdc and saif
foreach required_file [list $netlist_file $sdc_file $saif_file] {
    if {![file readable $required_file]} {
        error "Cannot read required file: $required_file"
    }
}

# verify every technology file    
foreach library_file $library_files {
    if {![file readable $library_file]} {
        error "Cannot read library: $library_file"
    }
}

file mkdir $report_dir

set_app_var power_enable_analysis true
set_app_var power_analysis_mode averaged

set_app_var search_path \
    [concat $search_path [list $library_dir [file dirname $netlist_file]]]
set_app_var link_path [concat "*" $library_files]


read_verilog $netlist_file

link_design accumulator_power_gated
current_design accumulator_power_gated

read_sdc $sdc_file

redirect -file \
    [file join $report_dir accumulator_power_gated_units.rpt] {
    report_units
}

update_timing

redirect -file [file join $report_dir accumulator_power_gated_check_timing.rpt] {
    check_timing
}


redirect -file [file join $report_dir accumulator_power_gated_clocks.rpt] {
    report_units
}

redirect -file \
    [file join $report_dir accumulator_power_gated_timing.rpt] {
	report_timing -max_paths 10
}

read_saif -strip_path accumulator_power_gated_tb/dut $saif_file

redirect -file [file join $report_dir accumulator_power_gated_activity.rpt] {
    report_switching_activity
}

redirect -file [file join $report_dir accumulator_power_gated_check_power.rpt] {
    check_power
}

update_power

redirect -file [file join $report_dir accumulator_power_gated_power.rpt] {
    report_power -hierarchy
}

redirect -file [file join $report_dir accumulator_power_gated_power_verbose.rpt] {
    report_power -verbose
}
