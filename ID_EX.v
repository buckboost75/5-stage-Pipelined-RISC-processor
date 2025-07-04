`timescale 1ns /1ns

module ID_EX(input clk, reset,
             input [31:0] pc_in, RD1_in, RD2_in, Imm_in,
             input [3:0] RN1_in, RN2_in, WN_in,
             input [1:0] ALUOp_in,
             input ALUSrc_in, MR_in, MW_in, MReg_in, EnRW_in,
             output reg [31:0] pc_out, RD1_out, RD2_out, Imm_out,
             output reg [3:0] RN1_out, RN2_out, WN_out,
             output reg [1:0] ALUOp_out,
             output reg ALUSrc_out, MR_out, MW_out, MReg_out, EnRW_out);

    always @(posedge clk) begin
        if (reset) begin
            pc_out <= 0; RD1_out <= 0; RD2_out <= 0; Imm_out <= 0;
            RN1_out <= 0; RN2_out <= 0; WN_out <= 0;
            ALUOp_out <= 0; ALUSrc_out <= 0;
            MR_out <= 0; MW_out <= 0; MReg_out <= 0; EnRW_out <= 0;
        end else begin
            pc_out <= pc_in; RD1_out <= RD1_in; RD2_out <= RD2_in; Imm_out <= Imm_in;
            RN1_out <= RN1_in; RN2_out <= RN2_in; WN_out <= WN_in;
            ALUOp_out <= ALUOp_in; ALUSrc_out <= ALUSrc_in;
            MR_out <= MR_in; MW_out <= MW_in; MReg_out <= MReg_in; EnRW_out <= EnRW_in;
        end
    end
endmodule
