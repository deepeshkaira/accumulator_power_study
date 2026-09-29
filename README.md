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
excluded from this repository as they are needed to be installed from IT -no access for providing those to open public.
see `Prime_time_UPF/lib/asap7_db/README.md` for the expected filenames.

*testbench follow the standard structure of UVM with sequences run. The one sequence is mixed/basic so that I can have a proper SAIF file generation for the design's proper Power estimation.

*The library used is 7nm. Even if we change voltage from 0.7 to 1 volts - the libraries are going to work for operating voltage at 25 celcius i.e 0.7 volts
*The power figures did not change even when the voltage in upf file was changed to some other voltage because the library is generating its reports at 0.7 volts. For bringing in real change there is a need of compatible library for the design.

This repository is an archive of completed runs perfomed by me, not yet a verified rerun from this packaged layout.

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

`accumulator_power_gated` is a filename. Its optimization is
**operand isolation**, not switching off VDD. The clock-gated variant combines
clock gating with operand isolation, so it does not isolate the power benefit
of clock gating alone.

The shared UPF defines the accumulator power domain and supplies for Questa
power-aware simulation. The useful simulation interval keeps VDD on. The
current Design Compiler and PrimeTime scripts do not read UPF or implement a
power switch, retention, or isolation. Consequently these results are not a
measurement of supply power gating.

## Flow
Run each design variant and its testbench in QuestaSim. After reset, collect switching activity in a SAIF file for the full test sequence.
Synthesize each variant with Design Compiler using the ASAP7 libraries and timing constraints. This produces a mapped netlist for power analysis.
Run PrimeTime with the matching netlist, constraints, libraries, and SAIF file to generate timing and power reports.
For the clock-gated variant, confirm that PrimeTime recognizes both the source and generated clocks. Check the mapped design to see whether clock gating and operand isolation survived synthesis.

## Power estimates

### Design Compiler synthesis estimates

Design Compiler estimated power after synthesis using the ASAP7 libraries. Values are shown in microwatts.

| Power group or component | Baseline | Operand gated | Clock + operand gated |
|---|---:|---:|---:|
| Net switching | 1.53 µW | 1.56 µW | 1.95 µW |
| Cell internal | 4.99 µW | 4.98 µW | 3.42 µW |
| Leakage | 0.0197 µW | 0.0221 µW | 0.0224 µW |
| **Total** | **6.54 µW** | **6.57 µW** | **5.40 µW** |

The clock-gated design's estimated total is 1.14 µW lower than the baseline. These are preliminary synthesis estimates:
Design Compiler reported unannotated primary inputs, so they should not be
compared directly with the SAIF-based results below.

### PrimeTime/PrimePower estimates

The following are averaged, pre-layout estimates at the same library
condition. Values are converted from watts to microwatts. No wire-load model
or extracted interconnect parasitics were used.

| Power group or component | Baseline | Operand gated | Clock + operand gated |
|---|---:|---:|---:|
| Clock network | 3.763 µW | 3.781 µW | 2.653 µW |
| Registers | 3.574 µW | 1.333 µW | 1.407 µW |
| Combinational | 8.704 µW | 3.203 µW | 4.405 µW |
| Cell internal | 9.805 µW | 5.790 µW | 5.082 µW |
| Net switching | 6.217 µW | 2.505 µW | 3.360 µW |
| Leakage | 0.02050 µW | 0.02275 µW | 0.02312 µW |
| **Total** | **16.040 µW** | **8.317 µW** | **8.465 µW** |

The clock + operand-gated total is 7.575 µW (47.2%) lower than the baseline
total in these PrimeTime reports.

These are the power figures obtained from the available reports. **They are
not yet a controlled three-way comparison.** The earlier baseline SAIF had
`enable` high for approximately 98.6% of its recorded interval; the mixed
comparison sequence contains 50 enabled and 50 disabled transactions. The
operand-gated run's exact stimulus has not yet been verified against the mixed
sequence. 

The clock-gated report shows 2.653 µW for the clock network, compared with
3.763 µW for the baseline and 3.781 µW for the operand-gated run.

## Controlled comparison to complete

Ran the same deterministic `acc_mixed_sequence` in all three testbenches. Its
100 transactions are 20 enabled, 40 disabled with changing input data, 20
enabled, then 20 alternating. Use the same clock period, reset release,
Questa seed, SAIF recording start, and simulation end for each run.

Before comparing power, the three SAIF files should have same on `DURATION`
and on `T0`, `T1`, `TX`, and `TC` for every primary input: `clk`, `rst_n`,
`enable`, and each `data_in` bit. Internal signal activity is expected to
differ.
