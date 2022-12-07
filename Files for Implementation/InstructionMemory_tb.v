`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 
// Module - InstructionMemory_tb.v
// Description - Test the 'InstructionMemory_tb.v' module.
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_tb(); 

    wire [31:0] Instruction;

    reg [31:0] Address;

	InstructionMemory u0(
		.Address(Address),
        .Instruction(Instruction)
	);

	initial begin
	#50 Address <= 0;
	#50 Address <= 1;
	#50 Address <= 2;
	#50 Address <= 3;
	#50 Address <= 4;
	#50 Address <= 5;
	#50 Address <= 6;
	#50 Address <= 7;
	#50 Address <= 8;
	#50 Address <= 9;
	#50 Address <= 10;
	#50 Address <= 11;
	#50 Address <= 12;
	#50 Address <= 13;
	#50 Address <= 14;
	#50 Address <= 15;
	#50 Address <= 16;
	#50 Address <= 17;
	#50 Address <= 18;
	#50 Address <= 19;
	#50 Address <= 20;
	#50 Address <= 21;
	#50 Address <= 22;
	#50 Address <= 23;
	#50 Address <= 24;
	#50 Address <= 25;
	#50 Address <= 26;
	#50 Address <= 27;
	#50 Address <= 28;
	#50 Address <= 29;
	#50 Address <= 30;
	#50 Address <= 31;
	#50 Address <= 32;
	#50 Address <= 33;
	#50 Address <= 34;
	#50 Address <= 35;
	#50 Address <= 36;
	#50 Address <= 37;
	#50 Address <= 38;
	#50 Address <= 39;
	#50 Address <= 40;
	#50 Address <= 41;
	#50 Address <= 42;
	#50 Address <= 43;
	#50 Address <= 44;
	#50 Address <= 45;
	#50 Address <= 46;
	#50 Address <= 47;
	#50 Address <= 48;
	#50 Address <= 49;
	#50 Address <= 50;
	#50 Address <= 51;
	#50 Address <= 52;
	#50 Address <= 53;
	#50 Address <= 54;
	#50 Address <= 55;
	#50 Address <= 56;
	#50 Address <= 57;
	#50 Address <= 58;
	#50 Address <= 59;
	#50 Address <= 60;
	#50 Address <= 61;
	#50 Address <= 62;
	#50 Address <= 63;
	#50 Address <= 64;
	#50 Address <= 65;
	#50 Address <= 66;
	#50 Address <= 67;
	#50 Address <= 68;
	#50 Address <= 69;
	#50 Address <= 70;
	#50 Address <= 71;
	#50 Address <= 72;
	#50 Address <= 73;
	#50 Address <= 74;
	#50 Address <= 75;
	#50 Address <= 76;
	#50 Address <= 77;
	#50 Address <= 78;
	#50 Address <= 79;
	#50 Address <= 80;
	#50 Address <= 81;
	#50 Address <= 82;
	#50 Address <= 83;
	#50 Address <= 84;
	#50 Address <= 85;
	#50 Address <= 86;
	#50 Address <= 87;
	#50 Address <= 88;
	#50 Address <= 89;
	#50 Address <= 90;
	#50 Address <= 91;
	#50 Address <= 92;
	#50 Address <= 93;
	#50 Address <= 94;
	#50 Address <= 95;
	#50 Address <= 96;
	#50 Address <= 97;
	#50 Address <= 98;
	#50 Address <= 99;
	#50 Address <= 100;
	#50 Address <= 101;
	#50 Address <= 102;
	#50 Address <= 103;
	#50 Address <= 104;
	#50 Address <= 105;
	#50 Address <= 106;
	#50 Address <= 107;
	#50 Address <= 108;
	#50 Address <= 109;
	#50 Address <= 110;
	#50 Address <= 111;
	#50 Address <= 112;
	#50 Address <= 113;
	#50 Address <= 114;
	#50 Address <= 115;
	#50 Address <= 116;
	#50 Address <= 117;
	#50 Address <= 118;
	#50 Address <= 119;
	#50 Address <= 120;	
	#50 Address <= 121;
	#50 Address <= 122;
	#50 Address <= 123;
	#50 Address <= 124;
	#50 Address <= 125;
	#50 Address <= 126;
	#50 Address <= 127;
	#50 Address <= 128;
	#50 Address <= 129;
	#50 Address <= 130;
	end

endmodule

