`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 02:36:07 AM
// Design Name: 
// Module Name: IF_PC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IF_PC(
    next_pc,
    clk,  
    pc
    );
    
    input [31:0]next_pc;
    input clk;
    output pc;
    reg[31:0] pc;
    
    initial begin
        pc = 100;
    end    
    always @(posedge clk)
    begin
        pc = next_pc;
    end    
endmodule