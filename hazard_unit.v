`timescale 1ns / 1ns

module hazard_unit(
    input [3:0] id_src_reg1, id_src_reg2,
    input [3:0] ex_dest_reg,
    input ex_mem_read,
    output reg PCWrite, IFIDWrite, ST
);
    always @(*) begin
        if (ex_mem_read && ((ex_dest_reg == id_src_reg1) || (ex_dest_reg == id_src_reg2))) begin
            PCWrite = 0;
            IFIDWrite = 0;
            ST = 1;
        end else begin
            PCWrite = 1;
            IFIDWrite = 1;
            ST = 0;
        end
    end
endmodule
