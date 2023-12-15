`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 06:20:04 PM
// Design Name: 
// Module Name: PC_Adder
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


module PC_Adder(
    pc,
    nextPc 
    );
    input [31:0] pc;
    output [31:0] nextPc;
    reg[31:0] nextPc;
    
    always @(*)
    begin 
        nextPc = pc + 32'd4;
    end
endmodule
