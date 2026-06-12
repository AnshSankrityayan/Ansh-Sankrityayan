// ============================================================
// Project  : <Project Name>
// Module   : <module_name>
// Author   : Ansh Sankrityayan
// Date     : <YYYY-MM-DD>
// Tool     : Icarus Verilog / Vivado / ModelSim
// ============================================================
// Description:
//   <One or two lines describing what this module does>
// ============================================================

`timescale 1ns / 1ps

module module_name (
    // Inputs
    input  wire        clk,      // remove if combinational
    input  wire        rst_n,    // active-low reset; remove if not needed
    input  wire [N-1:0] in_a,

    // Outputs
    output reg  [N-1:0] out
);

    // Parameters
    parameter N = 8;

    // Internal signals
    wire [N-1:0] internal_sig;

    // ---- Logic ----
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            out <= {N{1'b0}};
        else
            out <= in_a;
    end

endmodule
