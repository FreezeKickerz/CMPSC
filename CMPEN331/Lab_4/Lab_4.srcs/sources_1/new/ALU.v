`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 01:26:47 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
eqa,
b,
ealuc,
r
    );
    
    input[3:0] ealuc;
    input[31:0] eqa;
    input[31:0] b;
    output[31:0] r;
    reg[31:0] r;
    
    always @(*)begin
        case(ealuc)
            4'b0000:
                begin
                    r = eqa & b;
                end
            4'b0001:
                begin
                    r = eqa | b;
                end
            4'b0010:
                begin
                    r = eqa + b;
                end
            4'b0110:
                begin
                    r = eqa - b;
                end
            4'b1100:
                begin
                    r = ~(eqa | b);
                end
        endcase
    end
        
endmodule
