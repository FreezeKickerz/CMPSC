`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 04:28:05 PM
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    instOut,
    clk, 
    dinstOut
    ); 
    
    input[31:0] instOut;
    input clk;
    output[31:0] dinstOut;
    reg[31:0] dinstOut;
    
    always @(posedge clk) begin 
            dinstOut = instOut; 
        end
endmodule      
