`timescale 1ns / 1ps

module RegRTMux(rd, rt, regrt, destReg);
    input[4:0] rd, rt;
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
