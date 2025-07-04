`timescale 1ns / 1ns

module EX_MEM(
    input clk, reset,
      input [31:0] ALU_in, RD2_in,
      input [3:0] WN_in,
      input MR_in, MW_in, MReg_in, EnRW_in,
      output reg [31:0] ALU_out, RD2_out,
      output reg [3:0] WN_out,
      output reg MR_out, MW_out, MReg_out, EnRW_out);

    always @(posedge clk) begin
        if (reset) begin
            ALU_out <= 0; RD2_out <= 0; WN_out <= 0;
            MR_out <= 0; MW_out <= 0; MReg_out <= 0; EnRW_out <= 0;
        end else begin
            ALU_out<= ALU_in; RD2_out <= RD2_in; WN_out <= WN_in;
            MR_out <= MR_in; MW_out <= MW_in; MReg_out <= MReg_in; EnRW_out <= EnRW_in;
        end
    end
endmodule
