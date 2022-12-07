`timescale 1ns / 1ps

module ALUControl(out,ALUOp, rt, ALUControl);

    input rt; //take least significant bit of rt register (16th bit)
    input [5:0] out; //output from the sign extender
    input [3:0] ALUOp;    
    output reg [5:0] ALUControl; // control bits for ALU operation
                      // you need to adjust the bitwidth as needed

    initial begin
        ALUControl <= 0;
    end    

    always @(*)begin
        
    case(ALUOp)
    4'b0000: //R-type
    begin
    ALUControl <= out;
    end

    4'b0001://addi, lw, sw, lh, sh, lb, sb
    begin
    ALUControl <= 6'b001000;
    end
    4'b0010://XORi
    begin
    ALUControl <= 6'b001110;
    end
    4'b0011://slti
    begin
    ALUControl <= 6'b001010;
    end
    4'b0100://ANDi
    begin
    ALUControl <= 6'b001100;
    end
    4'b0101://ORi
    begin
    ALUControl <= 6'b001101;
    end
    4'b0110: //BGEZ, BLTZ
    begin
    if (rt==1)
    ALUControl <= 6'b100001; //BGEZ
    else
    ALUControl <= 6'b011011; //BLTZ
    end
    4'b0111: //BGTZ
    begin
    ALUControl <= 6'b000111;
    end
    4'b1000://BLEZ
    begin
    ALUControl <= 6'b000110;
    end
    4'b1001://bne
    begin
    ALUControl <= 6'b000101;
    end
    4'b1010://beq
    begin
    ALUControl <= 6'b000100;
    end
    4'b1011://mul
    begin
    ALUControl <= 6'b000011;
    end

    endcase
    end


endmodule