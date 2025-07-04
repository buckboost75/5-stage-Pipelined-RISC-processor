`timescale 1ns / 1ns

module ALU(input [31:0] A, B,
           input [1:0] ALUOp,
           output reg [31:0] ALU_Result);
           
    always @(*) begin
        case (ALUOp)
            2'b00: ALU_Result = A + B;
            2'b01: ALU_Result = A | B;
            2'b10: ALU_Result = A - B;
            2'b11: ALU_Result = ~(A & B);
            default: ALU_Result = 32'b0;
        endcase
    end
endmodule


