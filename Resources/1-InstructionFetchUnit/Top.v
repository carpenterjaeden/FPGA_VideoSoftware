`timescale 1ns / 1ps

module Top(Clk, Reset, en_out, out7);

input Clk, Reset;

wire [31:0] Instruction;
wire [31:0] PCResult;
wire ClkOut;
output [7:0] en_out;
output [6:0] out7;

ClkDiv ClkDiv1(Clk, Reset, ClkOut);
InstructionFetchUnit fetch1(Reset, ClkOut, Instruction, PCResult);
Two4DigitDisplay Two4DigitDisplay_1(Clk, Instruction[15:0], PCResult[15:0], out7, en_out);


endmodule