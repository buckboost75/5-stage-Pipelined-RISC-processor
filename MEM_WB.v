`timescale 1ns / 1ns

module MEM_WB(input clk, reset,
              input [31:0] ALU_in, MEM_in,
              input [3:0] WN_in,
              input MReg_in, EnRW_in,
              output reg [31:0] Result_out,
              output reg [3:0] WN_out,
              output reg EnRW_out);

    always @(posedge clk) begin
        if (reset) begin
            Result_out <= 0; WN_out <= 0; EnRW_out <= 0;
        end else begin
            Result_out <= MReg_in ? MEM_in : ALU_in;
            WN_out <= WN_in;
            EnRW_out <= EnRW_in;
        end
    end
endmodule