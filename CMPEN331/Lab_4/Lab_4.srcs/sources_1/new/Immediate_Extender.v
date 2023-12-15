`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 04:23:11 PM
// Design Name: 
// Module Name: Immediate_Extender
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


module Immediate_Extender(
imm,
imm32
    );
    input[15:0] imm;
    output[31:0] imm32;
    reg[31:0] imm32;
    
    always @(*) begin
        imm32 <= {{16{imm[15]}},{imm[15:0]}};
    end    
endmodule
