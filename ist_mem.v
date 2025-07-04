`timescale 1ns / 1ns

module ist_mem(
    input clk,
    input EnIM,
    input [31:0] addr,
    output reg [31:0] instr
);

    reg [7:0] memory [0:31];

    initial begin
        // Load instructions 
        {memory[0], memory[1], memory[2], memory[3]}     = 32'b0000_0001_0010_0001_0000000000000011; // 1
        {memory[4], memory[5], memory[6], memory[7]}     = 32'b00010011000101000000000000000000;     // 2
        {memory[8], memory[9], memory[10], memory[11]}   = 32'b00110110001101010000000000000000;     // 3
        {memory[12], memory[13], memory[14], memory[15]} = 32'b0111_1000_0011_0000_0010_0100_0000_0000; // 4
        {memory[16], memory[17], memory[18], memory[19]} = 32'b11111001011110000000000000000000;     // 5
    end

    always @(posedge clk) begin
        if (EnIM)
            instr <= {memory[addr], memory[addr+1], memory[addr+2], memory[addr+3]};
    end
endmodule

