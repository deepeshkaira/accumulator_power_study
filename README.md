# 32-bit accumulator

This project compares three implementations of a 32-bit unsigned accumulator:
the baseline design, a design with input operand isolation, and a design with
both clock gating and input operand isolation. All three expose the same
`clk`, `rst_n`, `enable`, `data_in[31:0]`, `acc_out[31:0]`, and `overflow` ports.

The accumulator adds `data_in` on an enabled rising clock edge. `acc_out` wraps
modulo 2³², and `overflow` reports the carry beyond bit 31. When `enable` is
low, `acc_out` holds and `overflow` clears. The clock-gated version permits one
final gated-clock edge after an overflow so it can clear that status bit.

## Repository layout

QuestaSim and PrimeTime project folders are as follows - the scripts use the same layout. 
The files from the completed runs are collected in the layout below.

```text
accumulator-power-study/
├── README.md
├── QuestaSim/
│   ├── rtl/
│   │   ├── accumulator.sv
│   │   ├── accumulator_power_gated.sv
│   │   └── accumulator_clock_gated.sv  # Includes the gated_clk module
│   ├── tb/
│   │   ├── accumulator_tb.sv
│   │   ├── accumulator_power_gated_tb.sv
│   │   └── accumulator_clock_gated_tb.sv
│   ├── upf/
│   │   └── accumulator_upf.upf
│   ├── run_accumulator.do
│   ├── run_accumulator_power_gated.do
│   ├── run_accumulator_clock_gated.do
│   └── saif_reports/
│       ├── accumulator.saif
│       ├── accumulator_power_gated.saif
│       └── accumulator_clock_gated.saif
└── Prime_time_UPF/
    ├── rtl/                         
    ├── constraints/
    │   ├── accumulator.sdc
    │   └── accumulator_clock_gated.sdc
    ├── scripts/
    │   ├── synthesize_accumulator.tcl
    │   ├── synthesize_accumulator_power_gated.tcl
    │   ├── synthesize_accumulator_clock_gated.tcl
    │   ├── primetime_accumulator.tcl
    │   ├── primetime_accumulator_power_gated.tcl
    │   └── primetime_accumulator_clock_gated.tcl
    ├── lib/asap7_db/               
    ├── saif/                       
    ├── netlist/                    
    └── reports/
        ├── synthesis/              
        └── power/                  
```

The `lib/asap7_db` directory must contain the same AO, INVBUF, OA, SEQ, and
SIMPLE RVT TT libraries for every run. The `.db` libraries are deliberately
excluded from this repository until their redistribution terms are confirmed;
see `Prime_time_UPF/lib/asap7_db/README.md` for the expected filenames. Do not
commit Questa's compiled `work` library; it is regenerated from the sources.

The baseline and operand-gated netlists were stored in subfolders in the
original run directory. They are placed directly under `netlist/` here because
the PrimeTime scripts read them from that location. This repository is an
archive of completed runs, not yet a verified rerun from this packaged layout.

If a script currently writes reports to `reports/clock_gated` or another
directory, either keep that directory in the repository or update its
`report_dir` before rerunning. Report filenames should always include the
design name so one variant cannot overwrite another.

## Design variants

| Variant | RTL top | Clock behavior | Adder input while disabled |
|---|---|---|---|
| Baseline | `accumulator` | Source clock reaches state registers | `data_in` can toggle the adder |
| Operand gated | `accumulator_power_gated` | Source clock reaches state registers | `data_in` is masked to zero |
| Clock + operand gated | `accumulator_clock_gated` | Latch-and-AND clock gate stops register edges while idle | `data_in` is masked to zero |

`accumulator_power_gated` is a historical filename. Its optimization is
**operand isolation**, not switching off VDD. The clock-gated variant combines
clock gating with operand isolation, so it does not isolate the power benefit
of clock gating alone.

The shared UPF defines the accumulator power domain and supplies for Questa
power-aware simulation. The useful simulation interval keeps VDD on. The
current Design Compiler and PrimeTime scripts do not read UPF or implement a
power switch, retention, or isolation. Consequently these results are not a
measurement of supply power gating.

## Flow

1. In `QuestaSim`, compile the selected RTL and its testbench, then run the
   matching `.do` file. The scripts optimize with `accumulator_upf.upf`, start
   SAIF collection after reset (`run 16ns` in the current flow), run to the
   end of the UVM test, and write a variant-specific file to `saif_reports/`.
2. Copy the selected RTL into `Prime_time_UPF/rtl/` and its SAIF into
   `Prime_time_UPF/saif/`. The copies of each RTL file must be identical.
3. From `Prime_time_UPF`, run the matching `synthesize_*.tcl` with Design
   Compiler. Each script reads the ASAP7 libraries and SDC, then writes a
   uniquely named Verilog netlist and exported SDC under `netlist/`.
4. From the same folder, run the matching `primetime_*.tcl`. PrimeTime reads
   that netlist, its exported SDC, the five ASAP7 libraries, and the matching
   SAIF. The `read_saif -strip_path` value must match the testbench top and
   `/dut` instance used to generate that SAIF.

For the clock-gated version, the source and generated clocks must both appear
in a real `report_clock` result. The output of `u_gate` is the generated-clock
point used in the clock-gated SDC. After synthesis, inspect the mapped netlist
and reference report to establish whether the clock gate and operand isolation
survived optimization.

## Power measured so far

All figures below are PrimeTime/PrimePower averaged, pre-layout estimates at
the ASAP7 `PVT_0P7V_25C` library condition. Values are converted from watts
to microwatts. No wire-load model or extracted interconnect parasitics were
used.

| Power group or component | Baseline | Operand gated | Clock + operand gated |
|---|---:|---:|---:|
| Clock network | 3.763 µW | 3.781 µW | 2.653 µW |
| Registers | 3.574 µW | 1.333 µW | 1.407 µW |
| Combinational | 8.704 µW | 3.203 µW | 4.405 µW |
| Cell internal | 9.805 µW | 5.790 µW | 5.082 µW |
| Net switching | 6.217 µW | 2.505 µW | 3.360 µW |
| Leakage | 0.02050 µW | 0.02275 µW | 0.02312 µW |
| **Total** | **16.040 µW** | **8.317 µW** | **8.465 µW** |

These are the power figures obtained from the available reports. **They are
not yet a controlled three-way comparison.** The earlier baseline SAIF had
`enable` high for approximately 98.6% of its recorded interval; the mixed
comparison sequence contains 50 enabled and 50 disabled transactions. The
operand-gated run's exact stimulus has not yet been verified against the mixed
sequence. Differences between the totals therefore cannot yet be credited to
the RTL optimizations.

The clock-gated report shows 2.653 µW for the clock network, compared with
3.763 µW for the baseline and 3.781 µW for the operand-gated run. Its current
`accumulator_clock_gated_clocks.rpt` accidentally contains `report_units`
output; regenerate it using `report_clock` before treating the generated
clock as verified. The clock-gated `check_power` report also lists 34 ramps
and 38 loads outside the characterized table range.

## Controlled comparison to complete

Run the same deterministic `acc_mixed_sequence` in all three testbenches. Its
100 transactions are 20 enabled, 40 disabled with changing input data, 20
enabled, then 20 alternating. Use the same clock period, reset release,
Questa seed, SAIF recording start, and simulation end for each run.

Before comparing power, verify that the three SAIF files agree on `DURATION`
and on `T0`, `T1`, `TX`, and `TC` for every primary input: `clk`, `rst_n`,
`enable`, and each `data_in` bit. Internal signal activity is expected to
differ. Then rerun the baseline and operand-gated PrimeTime analyses using
their new, matched SAIF files. Only those matched results should be used to
calculate percentage savings or rank the designs.
