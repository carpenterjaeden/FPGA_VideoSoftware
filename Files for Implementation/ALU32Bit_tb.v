`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [5:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;
	reg Clk;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(
        .ALUControl(ALUControl), 
        .A(A), 
        .B(B), 
        .ALUResult(ALUResult), 
        .Zero(Zero),
        .Clk(Clk)
    );

    initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
    /* Please fill in the implementation here... */
	
    #100
    @(posedge Clk);
    A <= 5;
    B <= 5;
    @(posedge Clk);
    ALUControl <= 6'b100000; // add
    #50
    @(posedge Clk);
    A <= 3;
    B <= 3;
    @(posedge Clk);
    ALUControl <= 6'b100000; // add
    #50
    @(posedge Clk);
    A <= 5;
    B <= 5;
    @(posedge Clk);
    A <= 3;
    B <= 3;
    @(posedge Clk);
    ALUControl <= 6'b001000; // addi
    #50
    @(posedge Clk);
    A <= 5;
    B <= 3;
    @(posedge Clk);
    A <= 10;
    B <= 2;
    @(posedge Clk);
    ALUControl <= 6'b100010; // sub
    #50
    @(posedge Clk);
    A <= 5;
    B <= 7;
    @(posedge Clk);
    A <= 10;
    B <= 4;
    @(posedge Clk);
    ALUControl <= 6'b100100; // mul
    #50
    @(posedge Clk);
    A <= 3;
    B <= 2;
    @(posedge Clk);
    A <= 10;
    B <= 5;
    @(posedge Clk);
    ALUControl <= 6'b100001; // bgez
    #50
    @(posedge Clk);
    A <= 3;
    @(posedge Clk);
    A <= -2;
    @(posedge Clk);
    ALUControl <= 6'b000100; // beq
    #50
    @(posedge Clk);
    A <= 3;
    B <= 3;
    @(posedge Clk);
    A <= 2;
    B <= 4;
    @(posedge Clk);
    ALUControl <= 6'b000101; // bne
    #50
    @(posedge Clk);
    A <= 3;
    B <= 5;
    @(posedge Clk);
    A <= 7;
    B <= 7;
    @(posedge Clk);
    ALUControl <= 6'b011010; // bgtz
    #50
    @(posedge Clk);
    A <= 15;
    @(posedge Clk);
    A <= -4;
    @(posedge Clk);
    ALUControl <= 6'b000101; // blez
    #50
    @(posedge Clk);
    A <= 0;
    @(posedge Clk);
    A <= 5;
    @(posedge Clk);
    A <= -1;
    @(posedge Clk);
    ALUControl <= 6'b011011; // bltz
    #50
    @(posedge Clk);
    A <= 3;
    @(posedge Clk);
    A <= -5;
    @(posedge Clk);
    A <= 0;
    @(posedge Clk);
    ALUControl <= 6'b100100; // and
    #50
    @(posedge Clk);
    A <= 15;
    B <= 14;
    @(posedge Clk);
    A <= 2;
    B <= 40000;
    @(posedge Clk);
    A <= 3;
    B <= 123456789;
    @(posedge Clk);
    ALUControl <= 6'b001100; // andi
    #50
    @(posedge Clk);
    A <= 14;
    B <= 1;
    @(posedge Clk);
    A <= 84;
    B <= 2;
    @(posedge Clk);
    A <= 359;
    B <= 1;
    @(posedge Clk);
    ALUControl <= 6'b100101; // or
    #50
    @(posedge Clk);
    A <= 2;
    B <= 10;
    @(posedge Clk);
    A <= 5;
    B <= 8;
    @(posedge Clk);
    A <= 100;
    B <= 48965;
    @(posedge Clk);
    ALUControl <= 6'b001101; // ori
    #50
    @(posedge Clk);
    A <= 4;
    B <= 2;
    @(posedge Clk);
    A <= 6;
    B <= 1;
    @(posedge Clk);
    A <= 3;
    B <= 7;
    @(posedge Clk);
    ALUControl <= 6'b100110; // Xor
    #50
    @(posedge Clk);
    A <= 5;
    B <= 3;
    @(posedge Clk);
    A <= 1;
    B <= 6;
    @(posedge Clk);
    A <= 4;
    B <= 2;
    @(posedge Clk);
    ALUControl <= 6'b001110; // Xori
    #50
    @(posedge Clk);
    A <= 1;
    B <= 9;
    @(posedge Clk);
    A <= 4;
    B <= 7;
    @(posedge Clk);
    A <= 2;
    B <= 8;
    @(posedge Clk);
    ALUControl <= 6'b100111; // Nor
    #50
    @(posedge Clk);
    A <= 5;
    B <= 2;
    @(posedge Clk);
    A <= 1;
    B <= 7;
    @(posedge Clk);
    A <= 6;
    B <= 4;
    @(posedge Clk);
    ALUControl <= 6'b101010; // slt
    #50
    @(posedge Clk);
    A <= 5;
    B <= 2;
    @(posedge Clk);
    A <= 3;
    B <= 6;
    @(posedge Clk);
    A <= 8;
    B <= 8;
    @(posedge Clk);
    ALUControl <= 6'b001010; // slti
    #50
    @(posedge Clk);
    A <= 13;
    B <= 4;
    @(posedge Clk);
    A <= 10;
    B <= 10;
    @(posedge Clk);
    A <= 2;
    B <= 19;
    @(posedge Clk);
    end

endmodule

