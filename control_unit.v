`timescale 1ns / 1ns

module control_unit(input [3:0] opcode,
                   input ST,
                   output reg ALUSrc,
                   output reg [1:0] ALUOp,
                   output reg MR, MW, MReg, EnIM, EnRW);

    always @(*) begin
        if (ST) begin
            ALUSrc = 0;
            ALUOp = 2'b00;
            MR = 0; MW = 0; MReg = 0;
            EnIM = 1;  
            EnRW = 0;
        end else begin
            ALUSrc = 0;
            ALUOp = 2'b00;
            MR = 0; MW = 0; MReg = 0;
            EnIM = 1;
            EnRW = 0;
            case (opcode)
                4'b0000: begin ALUSrc = 1; ALUOp = 2'b00; MR = 0; MW = 1; EnRW = 0; end // SW
                4'b0001: begin ALUSrc = 0; ALUOp = 2'b00; MR = 0; MW = 0; EnRW = 1; end // ADD
                4'b0011: begin ALUSrc = 0; ALUOp = 2'b01; MR = 0; MW = 0; EnRW = 1; end // OR
                4'b0111: begin ALUSrc = 1; ALUOp = 2'b10; MR = 0; MW = 0; EnRW = 1; end // SUBI
                4'b1111: begin ALUSrc = 0; ALUOp = 2'b11; MR = 0; MW = 0; EnRW = 1; end // NAND
            endcase
        end
    end
endmodule
