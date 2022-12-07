`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1
// Module - ProgramCounter_tb.v
// Description - Test the 'ProgramCounter.v' module.
////////////////////////////////////////////////////////////////////////////////

module ProgramCounter_tb(); 

	reg [31:0] Address;
	reg Reset, Clk;

	wire [31:0] PCResult;

    ProgramCounter u0(
        .Address(Address), 
        .PCResult(PCResult), 
        .Reset(Reset), 
        .Clk(Clk)
    );

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
		#50 Reset <= 1;
		#50 Reset <= 0;
		@(posedge Clk);
		Address <= 1;
		@(posedge Clk);
		Address <= 2;
		@(posedge Clk);
		Address <= 3;
		@(posedge Clk);
		Address <= 4;
    /* Please fill in the implementation here... */
	
	end

endmodule

