`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 01:21:31 PM
// Design Name: 
// Module Name: Alu_Mux
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


module Alu_Mux(
ealuimm, 
eqb, 
eimm32, 
b
    );
    
    input ealuimm;
    input[31:0] eqb;
    input[31:0] eimm32;
    output[31:0] b;
    reg[31:0] b;

    always @(*) begin
        case(ealuimm)
            1'b0:
                begin
                    b = eqb; 
                end
            1'b1:
                begin
                    b = eimm32;
                end
        endcase
     end

endmodule
