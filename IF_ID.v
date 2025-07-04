`timescale 1ns / 1ns

module IF_ID(
        input clk, reset, IFIDWrite,
        input [31:0] instr_in, pc_in,
        output reg [31:0] instr_out, pc_out);
    always @(posedge clk) begin
        if (reset) begin
            instr_out <= 0;
            pc_out <= 0;
        end else if (IFIDWrite) begin
            instr_out <= instr_in;
            pc_out <= pc_in;
        end
    end
endmodule
