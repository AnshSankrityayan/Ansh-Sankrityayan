# Module Name

> One-line description of what this module does.

## Block Diagram

```
        ┌─────────────────┐
 in_a ──►                 ├──► out
        │   module_name   │
  clk ──►                 │
rst_n ──►                 │
        └─────────────────┘
```

## Interface

| Port    | Direction | Width | Description          |
|---------|-----------|-------|----------------------|
| `clk`   | Input     | 1     | System clock         |
| `rst_n` | Input     | 1     | Active-low reset     |
| `in_a`  | Input     | N     | Input operand        |
| `out`   | Output    | N     | Result               |

## Parameters

| Parameter | Default | Description        |
|-----------|---------|--------------------|
| `N`       | 8       | Data width (bits)  |

## How It Works

Explain the logic in 2–4 sentences. No need to repeat what the code says — focus on *why* you made key design choices.

## Simulation

```bash
# Using Makefile (recommended)
make

# Manual
iverilog -o sim tb_design.v design.v && vvp sim

# Open waveform
make wave
```

### Expected Output

```
PASS at time 15: out = 170
PASS at time 25: out = 85
Simulation complete.
```

### Waveform

<!-- Replace with your own screenshot -->
![Waveform](waveform.png)

## Synthesis (optional)

If synthesized on FPGA, add results here:

| Target FPGA   | LUTs | FFs | Fmax     |
|---------------|------|-----|----------|
| Artix-7 35T   | —    | —   | —        |

## Tools Used

- Simulator: Icarus Verilog v11 / ModelSim / Vivado Simulator
- Waveform: GTKWave

## References

- Relevant datasheet or spec link
