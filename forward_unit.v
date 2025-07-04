`timescale 1ns / 1ns
module forward_unit(
    input [3:0] ex_src_reg1, ex_src_reg2,
    input [3:0] mem_dest_reg, wb_dest_reg,
    input MEM_RegWrite, WB_RegWrite,
    output reg [1:0] FA, FB
);
    always @(*) begin
        // FA
        if (MEM_RegWrite && (mem_dest_reg == ex_src_reg1)) 
            FA = 2'b10;
        else if (WB_RegWrite && (wb_dest_reg == ex_src_reg1)) 
            FA = 2'b01;
        else 
            FA = 2'b00;

        // FB
        if (MEM_RegWrite && (mem_dest_reg == ex_src_reg2)) 
            FB = 2'b10;
        else if (WB_RegWrite && (wb_dest_reg == ex_src_reg2)) 
            FB = 2'b01;
        else 
            FB = 2'b00;
    end
endmodule

