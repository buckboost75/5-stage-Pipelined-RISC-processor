`timescale 1ns / 1ns
module reg_file(input clk,
                input EnRW,
                input [3:0] RN1, RN2, WN,
                input [31:0] WD,
                output [31:0] RD1, RD2);

    reg [31:0] regs [0:15];
        initial begin
        regs[0] = 32'h0;
        regs[1] = 32'h0000AABB;
        regs[2] = 32'h00000005;
        regs[4] = 32'h00001034;
        regs[5] = 32'h000BACC1;
        regs[7] = 32'h000101ED;
    end

    assign RD1 = regs[RN1];
    assign RD2 = regs[RN2];
    always @(negedge clk) begin
        if (EnRW)
            regs[WN] <= WD;
    end
endmodule