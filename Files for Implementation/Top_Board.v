`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Team Members: Malcolm Hayes, Sam Kerns, Jaeden Carpenter
// Overall percent effort of each team meber: 33% each 
// 
// ECE369A - Computer Architecture
// THIS IS THE CORRECT TOP FILE

module Top_Board(Clk,Reset,out7,en_out);
    input Clk, Reset;
    //wire noReset;
    //wire ClkOut;
    wire [31:0] v0;
    wire [31:0] v1;
    output [6:0] out7;
    output [7:0] en_out;
    
    //assign noReset = 0; // drive a 0 to clkdiv reset always
    
    //ClkDiv ClkDiv1(Clk, noReset, ClkOut);
    Top Top1(Clk, Reset, v0, v1);
    Two4DigitDisplay TwoDigitDisplay1(Clk, v1[15:0], v0[15:0], out7, en_out);
endmodule
