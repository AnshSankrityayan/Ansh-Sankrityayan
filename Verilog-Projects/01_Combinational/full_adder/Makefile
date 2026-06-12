TOP  = full_adder
TB   = tb_$(TOP)
SRC  = $(TOP).v $(TB).v
OUT  = sim
VCD  = dump.vcd

all: $(OUT)
	vvp $(OUT)

$(OUT): $(SRC)
	iverilog -o $(OUT) $(SRC)

wave: all
	gtkwave $(VCD) &

clean:
	rm -f $(OUT) $(VCD)

.PHONY: all wave clean
