`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 02:47:42 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
rs,
rt,
qa,
qb
    );
    
    input[4:0] rs;
    input[4:0] rt;
    output[31:0] qa;
    output[31:0] qb;
    reg[31:0] qa;
    reg[31:0] qb;
    
    reg[31:0] registers[31:0]; 
    
    integer i;
    initial begin
        for (i = 0; i <= 31; i = i + 1) begin
            registers[i] = 0;
        end
    end


    always @(*) begin
        qa = registers[rs];
        qb = registers[rt];
    end   
endmodule
