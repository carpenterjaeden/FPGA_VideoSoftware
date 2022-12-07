`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369A - Computer Architecture
// Laboratory 1 
// Module - PCAdder_tb.v
// Description - Test the 'PCAdder.v' module.
////////////////////////////////////////////////////////////////////////////////

module PCAdder_tb();

    reg [31:0] PCResult;

    wire [31:0] PCAddResult;

    PCAdder u0(
        .PCResult(PCResult), 
        .PCAddResult(PCAddResult)
    );

	initial begin
    #50 PCResult <= 0;
	#50 PCResult <= 1;
	#50 PCResult <= 2;
	#50 PCResult <= 3;
	#50 PCResult <= 4;
	#50 PCResult <= 5;
	#50 PCResult <= 6;
	#50 PCResult <= 7;
	#50 PCResult <= 8;
	#50 PCResult <= 9;
	#50 PCResult <= 10;
	#50 PCResult <= 11;
	#50 PCResult <= 12;
	#50 PCResult <= 13;
	#50 PCResult <= 14;
	#50 PCResult <= 15;
	#50 PCResult <= 16;
	#50 PCResult <= 17;
	#50 PCResult <= 18;
	#50 PCResult <= 19;
	#50 PCResult <= 20;
	#50 PCResult <= 21;
	#50 PCResult <= 22;
	#50 PCResult <= 23;
	#50 PCResult <= 24;
	#50 PCResult <= 25;
	#50 PCResult <= 26;
	#50 PCResult <= 27;
	#50 PCResult <= 28;
	#50 PCResult <= 29;
	#50 PCResult <= 30;
	#50 PCResult <= 31;
	#50 PCResult <= 32;
	#50 PCResult <= 33;
	#50 PCResult <= 34;
	#50 PCResult <= 35;
	#50 PCResult <= 36;
	#50 PCResult <= 37;
	#50 PCResult <= 38;
	#50 PCResult <= 39;
	#50 PCResult <= 40;
	#50 PCResult <= 41;
	#50 PCResult <= 42;
	#50 PCResult <= 43;
	#50 PCResult <= 44;
	#50 PCResult <= 45;
	#50 PCResult <= 46;
	#50 PCResult <= 47;
	#50 PCResult <= 48;
	#50 PCResult <= 49;
	#50 PCResult <= 50;
	#50 PCResult <= 51;
	#50 PCResult <= 52;
	#50 PCResult <= 53;
	#50 PCResult <= 54;
	#50 PCResult <= 55;
	#50 PCResult <= 56;
	#50 PCResult <= 57;
	#50 PCResult <= 58;
	#50 PCResult <= 59;
	#50 PCResult <= 60;
	#50 PCResult <= 61;
	#50 PCResult <= 62;
	#50 PCResult <= 63;
	#50 PCResult <= 64;
	#50 PCResult <= 65;
	#50 PCResult <= 66;
	#50 PCResult <= 67;
	#50 PCResult <= 68;
	#50 PCResult <= 69;
	#50 PCResult <= 70;
	#50 PCResult <= 71;
	#50 PCResult <= 72;
	#50 PCResult <= 73;
	#50 PCResult <= 74;
	#50 PCResult <= 75;
	#50 PCResult <= 76;
	#50 PCResult <= 77;
	#50 PCResult <= 78;
	#50 PCResult <= 79;
	#50 PCResult <= 80;
	#50 PCResult <= 81;
	#50 PCResult <= 82;
	#50 PCResult <= 83;
	#50 PCResult <= 84;
	#50 PCResult <= 85;
	#50 PCResult <= 86;
	#50 PCResult <= 87;
	#50 PCResult <= 88;
	#50 PCResult <= 89;
	#50 PCResult <= 90;
	#50 PCResult <= 91;
	#50 PCResult <= 92;
	#50 PCResult <= 93;
	#50 PCResult <= 94;
	#50 PCResult <= 95;
	#50 PCResult <= 96;
	#50 PCResult <= 97;
	#50 PCResult <= 98;
	#50 PCResult <= 99;
	#50 PCResult <= 100;
	#50 PCResult <= 101;
	#50 PCResult <= 102;
	#50 PCResult <= 103;
	#50 PCResult <= 104;
	#50 PCResult <= 105;
	#50 PCResult <= 106;
	#50 PCResult <= 107;
	#50 PCResult <= 108;
	#50 PCResult <= 109;
	#50 PCResult <= 110;
	#50 PCResult <= 111;
	#50 PCResult <= 112;
	#50 PCResult <= 113;
	#50 PCResult <= 114;
	#50 PCResult <= 115;
	#50 PCResult <= 116;
	#50 PCResult <= 117;
	#50 PCResult <= 118;
	#50 PCResult <= 119;
	#50 PCResult <= 120;	
	#50 PCResult <= 121;
	#50 PCResult <= 122;
	#50 PCResult <= 123;
	#50 PCResult <= 124;
	#50 PCResult <= 125;
	#50 PCResult <= 126;
	#50 PCResult <= 127;
	#50 PCResult <= 128;
	#50 PCResult <= 129;
	#50 PCResult <= 130;
	end

endmodule

