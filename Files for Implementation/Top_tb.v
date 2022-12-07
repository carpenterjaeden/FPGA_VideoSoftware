////////////////////////////////////////////////////////////////////////////////
// Team Members: Malcolm Hayes, Sam Kerns, Jaeden Carpenter
// Overall percent effort of each team meber: 33% each 
// 
// ECE369A - Computer Architecture

module Top_tb();
    reg Clk, Reset;
    wire [31:0] v0, v1;
  //  wire [31:0] zeroreg, s0, memat6; //delete this

    Top Top_1(Clk, Reset, v0, v1);
    
    initial begin
		Clk = 1'b0;
		forever #100 Clk = ~Clk;
	end
    
    
    initial
    begin
        Reset = 1'b1; 
        #200;
        @(posedge Clk);
        #100 Reset = 1'b0; 
    end
	
endmodule