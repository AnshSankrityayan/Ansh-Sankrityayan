// ============================================================
// Project  : 01_Combinational
// Module   : full_adder
// Author   : Ansh Sankrityayan
// Date     : 2026-06-12
// Tool     : Icarus Verilog
// ============================================================
// Description:
//   1-bit full adder. Computes sum and carry-out from two
//   input bits and a carry-in.
// ============================================================

`timescale 1ns / 1ps

module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule
