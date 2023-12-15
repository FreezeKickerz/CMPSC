`timescale 1ns / 1ps

module Main(
    input clk,
    output [31:0] eqa, eqb, mr
);
    
    DataPath dp(.clk(clk), .eqa(eqa), .eqb(eqb), .mr(mr));
endmodule