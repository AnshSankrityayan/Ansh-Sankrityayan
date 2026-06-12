# Verilog Projects

A systematic collection of Verilog designs from basic combinational logic to a full RISC-V core. Every project includes RTL, a testbench, a Makefile, and a README.

## Roadmap

| Phase | Folder | Topics | Status |
|-------|--------|--------|--------|
| 1 | `01_Combinational` | Full adder, MUX, decoder, ALU | 🟡 In progress |
| 2 | `02_Sequential` | D FF, counter, shift register, FSM | ⬜ Planned |
| 3 | `03_Memory` | Sync FIFO, dual-port RAM | ⬜ Planned |
| 4 | `04_Protocols` | UART, SPI, I2C | ⬜ Planned |
| 5 | `05_DSP` | FIR filter, FFT | ⬜ Planned |
| 6 | `06_Processors` | RISC-V RV32I core | ⬜ Planned |

## How to Use the Template

Copy `_template/` into your new project folder and rename files:

```bash
cp -r _template/ 01_Combinational/my_module
cd 01_Combinational/my_module
mv design.v my_module.v
mv tb_design.v tb_my_module.v
# Edit Makefile: set TOP = my_module
```

## Every Project Contains

```
project_name/
├── project_name.v       # RTL design
├── tb_project_name.v    # Testbench (self-checking)
├── Makefile             # make / make wave / make clean
└── README.md            # Interface, truth table, waveform
```

## Tools

- **Simulator**: [Icarus Verilog](http://iverilog.icarus.com/) (free, cross-platform)
- **Waveform**: [GTKWave](http://gtkwave.sourceforge.net/) (free)
- **Synthesis**: Xilinx Vivado / Intel Quartus (optional, for FPGA results)

## Running Any Project

```bash
cd 01_Combinational/full_adder
make          # simulate
make wave     # open waveform
make clean    # clean build files
```
