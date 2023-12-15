`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 01:29:26 PM
// Design Name: 
// Module Name: EXEMEM_Pipeline_Register
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


module EXEMEM_Pipeline_Register(
clk, 
ewreg, 
em2reg, 
ewmem, 
edestReg, 
r, 
eqb, 
mwreg, 
mm2reg, 
mwmem, 
mdestReg, 
mr, 
mqb
    );
    
    input clk;
    input ewreg;
    input em2reg;
    input ewmem;
    input[4:0] edestReg;
    input[31:0] r;
    input[31:0] eqb;
    
    output mwreg;
    output mm2reg;
    output mwmem;
    output[4:0] mdestReg;
    output[31:0] mr;
    output[31:0] mqb;
    reg mwreg;
    reg mm2reg;
    reg mwmem;
    reg[4:0] mdestReg;
    reg[31:0] mr;
    reg[31:0] mqb;

   always @(posedge clk) begin
        mwreg = ewreg;
        mm2reg = em2reg;
        mwmem = ewmem;
        mdestReg = edestReg;
        mr = r;
        mqb = eqb;
    end        
endmodule
