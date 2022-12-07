`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - RegisterFile.v
// Description - Test the register_file
// Suggested test case - First write arbitrary values into 
// the saved and temporary registers (i.e., register 8 through 25). Then, 2-by-2, 
// read values from these registers.
////////////////////////////////////////////////////////////////////////////////


module RegisterFile_tb();

	reg [4:0] ReadRegister1;
	reg [4:0] ReadRegister2;
	reg	[4:0] WriteRegister;
	reg [31:0] WriteData;
	reg RegWrite;
	reg Clk;

	wire [31:0] ReadData1;
	wire [31:0] ReadData2;


	RegisterFile u0(
		.ReadRegister1(ReadRegister1), 
		.ReadRegister2(ReadRegister2), 
		.WriteRegister(WriteRegister), 
		.WriteData(WriteData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2)
	);

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	#100 // write to 8-25
	RegWrite <= 1;
	WriteRegister <= 8;
	WriteData <= 1;
	#100
	RegWrite <= 1;
	WriteRegister <= 9;
	WriteData <= 2;
	#100
	RegWrite <= 1;
	WriteRegister <= 10;
	WriteData <= 3;
	#100
	RegWrite <= 1;
	WriteRegister <= 11;
	WriteData <= 4;
	#100
	RegWrite <= 1;
	WriteRegister <= 12;
	WriteData <= 5;
	#100
	RegWrite <= 1;
	WriteRegister <= 13;
	WriteData <= 6;
	#100
	RegWrite <= 1;
	WriteRegister <= 14;
	WriteData <= 7;
	#100
	RegWrite <= 1;
	WriteRegister <= 15;
	WriteData <= 8;
	#100
	RegWrite <= 1;
	WriteRegister <= 16;
	WriteData <= 9;
	#100
	RegWrite <= 1;
	WriteRegister <= 17;
	WriteData <= 10;
	#100
	RegWrite <= 1;
	WriteRegister <= 18;
	WriteData <= 11;
	#100
	RegWrite <= 1;
	WriteRegister <= 19;
	WriteData <= 12;
	#100
	RegWrite <= 1;
	WriteRegister <= 20;
	WriteData <= 13;
	#100
	RegWrite <= 1;
	WriteRegister <= 21;
	WriteData <= 14;
	#100
	RegWrite <= 1;
	WriteRegister <= 22;
	WriteData <= 15;
	#100
	RegWrite <= 1;
	WriteRegister <= 23;
	WriteData <= 16;
	#100
	RegWrite <= 1;
	WriteRegister <= 24;
	WriteData <= 17;
	#100;
	RegWrite <= 1;
	WriteRegister <= 25;
	WriteData <= 18;
	#100                    // read from 8-25
	RegWrite <= 0;
	ReadRegister1 <= 8;
	ReadRegister2 <= 9;
	#100                    
	RegWrite <= 0;
	ReadRegister1 <= 10;
	ReadRegister2 <= 11;
	#100                    
	RegWrite <= 0;
	ReadRegister1 <= 12;
	ReadRegister2 <= 13;
	#100                    
	RegWrite <= 0;
	ReadRegister1 <= 14;
	ReadRegister2 <= 15;
	#100                    
	RegWrite <= 0;
	ReadRegister1 <= 16;
	ReadRegister2 <= 17;
	#100                    
	RegWrite <= 0;
	ReadRegister1 <= 18;
	ReadRegister2 <= 19;
	#100                    
	RegWrite <= 0;
	ReadRegister1 <= 20;
	ReadRegister2 <= 21;
	#100                    
	RegWrite <= 0;
	ReadRegister1 <= 22;
	ReadRegister2 <= 23;
	#100                    
	RegWrite <= 0;
	ReadRegister1 <= 24;
	ReadRegister2 <= 15;

	end

endmodule
