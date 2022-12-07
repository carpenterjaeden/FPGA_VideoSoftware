`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address;
    reg     [31:0]  WriteData;
    reg             Clk;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData;

    DataMemory u0(
        .Address(Address), 
        .WriteData(WriteData), 
        .Clk(Clk), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead), 
        .ReadData(ReadData)
    ); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	#100
    Address <= 10;  // write in memory location 10-14 and 781
    MemWrite = 1;
    MemRead <= 0;
    WriteData <= 653;
    #100
    Address <= 11;
    MemWrite = 1;
    MemRead <= 0;
    WriteData <= 221;
    #100
    Address <= 12;
    MemWrite = 1;
    MemRead <= 0;
    WriteData <= 421;
    #100
    Address <= 13;
    MemWrite = 1;
    MemRead <= 0;
    WriteData <= 1343;
    #100
    Address <= 14;
    MemWrite = 1;
    MemRead <= 0;
    WriteData <= 5531;
    #100
    Address <= 781;
    MemWrite = 1;
    MemRead <= 0;
    WriteData <= 741;
    #100                // read memory location 10-14 and 781
    Address <= 10;
    MemWrite = 0;
    MemRead <= 1;
    WriteData <= 0;
    #100
    Address <= 11;
    MemWrite = 0;
    MemRead <= 1;
    WriteData <= 0;
    #100
    Address <= 12;
    MemWrite = 0;
    MemRead <= 1;
    WriteData <= 0;
    #100
    Address <= 13;
    MemWrite = 0;
    MemRead <= 1;
    WriteData <= 0;
    #100
    Address <= 14;
    MemWrite = 0;
    MemRead <= 1;
    WriteData <= 0;
    #100
    Address <= 781;
    MemWrite = 0;
    MemRead <= 1;
    WriteData <= 0;
    
	end

endmodule

