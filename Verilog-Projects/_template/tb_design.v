// ============================================================
// Testbench : tb_module_name
// Tests     : <module_name>
// ============================================================
// How to run (Icarus Verilog):
//   iverilog -o sim tb_design.v design.v && vvp sim
// Dump waveform:
//   gtkwave dump.vcd
// ============================================================

`timescale 1ns / 1ps

module tb_module_name;

    // ---- DUT signal declarations ----
    reg         clk;
    reg         rst_n;
    reg  [7:0]  in_a;
    wire [7:0]  out;

    // ---- Instantiate DUT ----
    module_name #(.N(8)) dut (
        .clk   (clk),
        .rst_n (rst_n),
        .in_a  (in_a),
        .out   (out)
    );

    // ---- Clock generation ----
    initial clk = 0;
    always #5 clk = ~clk;   // 100 MHz

    // ---- VCD dump for GTKWave ----
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_module_name);
    end

    // ---- Task: apply reset ----
    task apply_reset;
        begin
            rst_n = 0;
            @(posedge clk); #1;
            rst_n = 1;
        end
    endtask

    // ---- Task: check output ----
    task check;
        input [7:0] expected;
        begin
            if (out !== expected)
                $display("FAIL at time %0t: expected %0d, got %0d", $time, expected, out);
            else
                $display("PASS at time %0t: out = %0d", $time, out);
        end
    endtask

    // ---- Stimulus ----
    initial begin
        // Init
        rst_n = 0;
        in_a  = 0;

        apply_reset;

        // Test case 1
        in_a = 8'hAA;
        @(posedge clk); #1;
        check(8'hAA);

        // Test case 2 — add more below
        in_a = 8'h55;
        @(posedge clk); #1;
        check(8'h55);

        $display("Simulation complete.");
        $finish;
    end

endmodule
