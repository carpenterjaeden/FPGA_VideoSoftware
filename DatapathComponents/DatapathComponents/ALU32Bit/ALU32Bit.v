`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, immediate, ALUResult /*, Zero*/);

	input [5:0] ALUControl; // control bits for ALU operation
                      // you need to adjust the bitwidth as needed
	input signed [31:0] A, B;	    // inputs
	input signed [31:0] immediate;

	output reg [31:0] ALUResult;	// answer
	//output reg Zero;	    // Zero=1 if ALUResult == 0



	always @(ALUControl, A, B, immediate) begin

	ALUResult <= 0;
	//Zero <= 0;

	case(ALUControl)
	// Arithmetic Instructions
	6'b100000:           // add
	begin
	ALUResult <= A + B;
	//Zero <= 0;	
	end					
	6'b001000:          // addi
	begin
	ALUResult <= A + immediate;
	//Zero <= 0;
	end
	6'b100010:         // sub
	begin
	ALUResult <= A - B;
	//Zero <= 0;
	end
	6'b000011:
	begin
	ALUResult <= A * B;   // mul
	//Zero <= 0;
	end
	6'b000000:
	begin
	ALUResult <= B << immediate[10:6];   // sll
	end
	6'b000010:
	begin
	ALUResult <= B >> immediate[10:6];   // srl
	end
	// Branch Instructions
	/*
Bgez 100001
Beq 000100
Bne 000101
Bgtz 000111
Blez 000110
Bltz 011011
	6'b100001:		// bgez --> be greater than or equal to zero
	begin
	if (A >= 0) begin
		Zero <= 1;
	end else begin
		Zero <= 0;
	end
	end
	6'b000100:		// beq --> be equal to
	begin
	if (A == B) begin
		Zero <= 1;
	end else begin
		Zero <= 0;
	end
	end
	6'b000101:		// bne --> be not equal to
	begin
	if (A != B) begin
		Zero <= 1;
	end else begin
		Zero <= 0;
	end
	end
	6'b000111:		// bgtz --> be greater than zero
	begin
	if (A > 0) begin
		Zero <= 1;
	end else begin
		Zero <= 0;
	end
	end
	6'b000110:		// blez --> be less than equal to zero
	begin
	if (A <= 0) begin
		Zero <= 1;
	end else begin
		Zero <= 0;
	end
	end
	6'b011011:		// bltz --> be less than zero
	begin
	if (A < 0) begin
		Zero <= 1;
	end else begin
		Zero <= 0;
	end
	end
And 100100
Andi 001100
Or 100101
Ori 001101
Xor 100110
Xori 001110
Nor 100111
Slt 101010
Slti 001010
	*/
	6'b100100:		// and
	begin
	ALUResult <= A & B;
	end
	6'b001100:		// andi
	begin
	ALUResult <= A & immediate;
	end
	6'b100101:		// or
	begin
	ALUResult <= A | B;
	end
	6'b001101:		// ori
	begin
	ALUResult <= A | immediate;
	end
	6'b100110:		// Xor
	begin
	ALUResult <= A ^ B;
	end
	6'b001110:		// Xori
	begin
	ALUResult <= A ^ immediate;
	end
	6'b100111:		// Nor
	begin
	ALUResult <= ~(A | B);
	end
	6'b101010:		// slt
	begin
	if (A < B) begin
		ALUResult <= 1;
	end else begin
		ALUResult <= 0;
	end
	end
	6'b001010:		// slti
	begin
	if (A < immediate) begin
		ALUResult <= 1;
	end else begin
		ALUResult <= 0;
	end
	end
	default: begin
		ALUResult <= 0;
	//	Zero <= 0;
	end
	endcase


	end

	
endmodule

