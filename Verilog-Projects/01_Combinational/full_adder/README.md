# Full Adder

> 1-bit full adder with carry-in and carry-out.

## Block Diagram

```
       ┌───────────────┐
  a ───►               ├──► sum  (a ⊕ b ⊕ cin)
  b ───►  full_adder   │
cin ───►               ├──► cout (majority of a,b,cin)
       └───────────────┘
```

## Interface

| Port   | Direction | Width | Description           |
|--------|-----------|-------|-----------------------|
| `a`    | Input     | 1     | First operand bit     |
| `b`    | Input     | 1     | Second operand bit    |
| `cin`  | Input     | 1     | Carry-in              |
| `sum`  | Output    | 1     | Sum bit               |
| `cout` | Output    | 1     | Carry-out             |

## Truth Table

| a | b | cin | sum | cout |
|---|---|-----|-----|------|
| 0 | 0 |  0  |  0  |  0   |
| 0 | 0 |  1  |  1  |  0   |
| 0 | 1 |  0  |  1  |  0   |
| 0 | 1 |  1  |  0  |  1   |
| 1 | 0 |  0  |  1  |  0   |
| 1 | 0 |  1  |  0  |  1   |
| 1 | 1 |  0  |  0  |  1   |
| 1 | 1 |  1  |  1  |  1   |

## How It Works

`sum` is XOR of all three inputs. `cout` goes high when at least two of the three inputs are high (majority function), implemented as sum-of-products.

## Simulation

```bash
make          # compile + run
make wave     # open GTKWave
make clean    # remove artifacts
```

### Expected Output

```
PASS: a=0 b=0 cin=0 | sum=0 cout=0
PASS: a=0 b=0 cin=1 | sum=1 cout=0
PASS: a=0 b=1 cin=0 | sum=1 cout=0
PASS: a=0 b=1 cin=1 | sum=0 cout=1
PASS: a=1 b=0 cin=0 | sum=1 cout=0
PASS: a=1 b=0 cin=1 | sum=0 cout=1
PASS: a=1 b=1 cin=0 | sum=0 cout=1
PASS: a=1 b=1 cin=1 | sum=1 cout=1

--- Results: 8 PASS, 0 FAIL ---
```

## Tools Used

- Simulator: Icarus Verilog
- Waveform: GTKWave
