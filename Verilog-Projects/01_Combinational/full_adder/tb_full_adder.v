// ============================================================
// Testbench : tb_full_adder
// Tests     : full_adder — exhaustive (all 8 input combos)
// ============================================================
// How to run:
//   iverilog -o sim tb_full_adder.v full_adder.v && vvp sim
//   make wave  →  gtkwave dump.vcd
// ============================================================

`timescale 1ns / 1ps

module tb_full_adder;

    reg  a, b, cin;
    wire sum, cout;

    // ---- Instantiate DUT ----
    full_adder dut (
        .a    (a),
        .b    (b),
        .cin  (cin),
        .sum  (sum),
        .cout (cout)
    );

    // ---- VCD dump ----
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_full_adder);
    end

    // ---- Task: check one case ----
    integer pass_count = 0;
    integer fail_count = 0;

    task check;
        input exp_sum, exp_cout;
        begin
            #5;
            if (sum !== exp_sum || cout !== exp_cout) begin
                $display("FAIL: a=%b b=%b cin=%b | sum=%b(exp %b) cout=%b(exp %b)",
                         a, b, cin, sum, exp_sum, cout, exp_cout);
                fail_count = fail_count + 1;
            end else begin
                $display("PASS: a=%b b=%b cin=%b | sum=%b cout=%b",
                         a, b, cin, sum, cout);
                pass_count = pass_count + 1;
            end
        end
    endtask

    // ---- Exhaustive stimulus ----
    initial begin
        // {a, b, cin} → {sum, cout}
        {a,b,cin} = 3'b000; check(1'b0, 1'b0);
        {a,b,cin} = 3'b001; check(1'b1, 1'b0);
        {a,b,cin} = 3'b010; check(1'b1, 1'b0);
        {a,b,cin} = 3'b011; check(1'b0, 1'b1);
        {a,b,cin} = 3'b100; check(1'b1, 1'b0);
        {a,b,cin} = 3'b101; check(1'b0, 1'b1);
        {a,b,cin} = 3'b110; check(1'b0, 1'b1);
        {a,b,cin} = 3'b111; check(1'b1, 1'b1);

        $display("\n--- Results: %0d PASS, %0d FAIL ---", pass_count, fail_count);
        $finish;
    end

endmodule
