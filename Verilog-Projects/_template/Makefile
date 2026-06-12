# ============================================================
# Makefile — Icarus Verilog simulation
# Usage:
#   make        → compile + run
#   make wave   → open waveform in GTKWave
#   make clean  → remove build artifacts
# ============================================================

TOP    = module_name
TB     = tb_$(TOP)
SRC    = $(TOP).v $(TB).v
OUT    = sim
VCD    = dump.vcd

all: $(OUT)
	vvp $(OUT)

$(OUT): $(SRC)
	iverilog -o $(OUT) $(SRC)

wave: $(VCD)
	gtkwave $(VCD) &

$(VCD): all

clean:
	rm -f $(OUT) $(VCD)

.PHONY: all wave clean
