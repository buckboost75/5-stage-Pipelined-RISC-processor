`timescale 1ns / 1ns

module data_mem(
      input clk,
      input MR, MW,
      input [31:0] addr,
      input [31:0] WD,
      output reg [31:0] RD);
      
    reg [31:0] memory[0:31];

    always @(posedge clk) begin
        if (MR)
            RD <= memory[addr[4:0]];
        if (MW)
            memory[addr[4:0]] <= WD;
    end
endmodule
