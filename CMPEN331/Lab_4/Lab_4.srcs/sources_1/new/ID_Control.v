`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2023 06:03:12 PM
// Design Name: 
// Module Name: Control
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


module ID_Control(
op,
func,
wreg,
m2reg,
wmem,
aluc,
aluimm,
regrt
    );
    
    input[5:0] op;
    input[5:0] func;
    output wreg;
    output m2reg;
    output wmem;
    output[3:0] aluc;
    output aluimm;
    output regrt;
    
    reg wreg;
    reg m2reg;
    reg wmem;
    reg[3:0] aluc;
    reg aluimm;
    reg regrt;
    
    always @(*) begin
        case(op)
            6'b000000:
            begin
                case(func)
                    6'b100000:
                        begin
                            wreg = 1'b1;
                            m2reg = 1'b0;
                            wmem = 1'b0;
                            aluc = 4'b0010;
                            aluimm = 1'b0;
                            regrt = 1'b1;
                        end
                endcase
            end
            6'b100011:
            begin
                wreg = 1'b1;
                m2reg = 1'b1;
                wmem = 1'b0;
                aluc = 4'b0000;
                aluimm = 1'b1;
                regrt = 1'b0;
            end
        endcase
    end
endmodule 
