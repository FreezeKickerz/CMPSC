`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 02:35:39 PM
// Design Name: 
// Module Name: Regrt_Multiplexer
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


module Regrt_Multiplexer(
rd,
rt,
regrt,
destReg
    );
    input[4:0] rd;
    input[4:0] rt;
    input regrt;
    output[4:0] destReg;
    reg[4:0] destReg;
    
    always @(*) begin
        case(regrt)
            1'b0:
                begin
                    destReg = rd;
                end
            1'b1:
                begin
                    destReg = rt;
                end
        endcase
      end  
endmodule
