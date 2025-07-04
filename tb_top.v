`timescale 1ns / 1ps

module top_tb();
    reg clk, reset;
    top uut(clk, reset);

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 1;
        #10;
        reset = 0;
        #200;  
        $finish;
    end
endmodule
