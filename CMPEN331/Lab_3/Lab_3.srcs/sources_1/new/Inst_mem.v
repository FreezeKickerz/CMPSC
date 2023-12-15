`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2023 03:17:32 AM
// Design Name: 
// Module Name: Inst_mem
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


module Inst_mem(
pc,
instOut
    );
    input [31:0] pc;
    output [31:0] instOut;
    reg[31:0] instOut;
        
    reg[31:0] memory [0:63];
    
    integer i;
    initial begin
        for (i = 0; i <= 63; i = i + 1) begin
            memory[i] = 0;
        end
    end
    
    initial begin
        memory[25] = {6'b100011, 5'b00001, 5'b00010, 5'b00000, 5'b00000, 6'b000000};
        memory[26] = {6'b100011, 5'b00001, 5'b00011, 5'b00000, 5'b00000, 6'b000100};
        memory[27] = {6'b100011, 5'b00001, 5'b00100, 5'b00000, 5'b00000, 6'b001000};
        memory[28] = {6'b100011, 5'b00001, 5'b00101, 5'b00000, 5'b00000, 6'b001100};
    end
    always @(*)
    begin
        instOut = memory[pc[7:2]];
    end
endmodule