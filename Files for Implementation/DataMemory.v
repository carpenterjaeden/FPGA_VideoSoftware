`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - data_memory.v
// Description - 32-Bit wide data memory.
//
// INPUTS:-
// Address: 32-Bit address input port.
// WriteData: 32-Bit input port.
// Clk: 1-Bit Input clock signal.
// MemWrite: 1-Bit control signal for memory write.
// MemRead: 1-Bit control signal for memory read.
//
// OUTPUTS:-
// ReadData: 32-Bit registered output port.
//
// FUNCTIONALITY:-
// Design the above memory similar to the 'RegisterFile' model in the previous 
// assignment.  Create a 1K memory, for which we need 10 bits.  In order to 
// implement byte addressing, we will use bits Address[11:2] to index the 
// memory location. The 'WriteData' value is written into the address 
// corresponding to Address[11:2] in the positive clock edge if 'MemWrite' 
// signal is 1. 'ReadData' is the value of memory location Address[11:2] if 
// 'MemRead' is 1, otherwise, it is 0x00000000. The reading of memory is not 
// clocked.
//
// you need to declare a 2d array. in this case we need an array of 1024 (1K)  
// 32-bit elements for the memory.   
// for example,  to declare an array of 256 32-bit elements, declaration is: reg[31:0] memory[0:255]
// if i continue with the same declaration, we need 8 bits to index to one of 256 elements. 
// however , address port for the data memory is 32 bits. from those 32 bits, least significant 2 
// bits help us index to one of the 4 bytes within a single word. therefore we only need bits [9-2] 
// of the "Address" input to index any of the 256 words. 
////////////////////////////////////////////////////////////////////////////////

module DataMemory(Address, WriteData, Clk, MemWrite, MemRead, ReadData); 

    input [31:0] Address; 	// Input Address 
    input [31:0] WriteData; // Data that needs to be written into the address 
    input Clk;
    input [1:0] MemWrite; 		// Control signal for memory write 
    input [1:0] MemRead; 			// Control signal for memory read 

    output reg[31:0] ReadData; // Contents of memory location at Address

    reg [31:0] memory [0:8016]; // 1k memory
    integer i;
    
    initial begin
    $readmemh("data_memory.mem", memory);

    end
    
//    always @(*)begin
//    memat6 <= Memory[Address[11:2]]; //DELETE THIS
//    end

 always @(posedge Clk) begin
    //memat6 <= Memory[Address[9:0]]; //DELETE THIS
        if (MemWrite == 2'b01) begin
           //Memory[Address[9:0]][31:24] <= WriteData[7:0];
           case (Address[1:0])//byte
           2'b00:
           begin
           memory[Address[16:2]][7:0] <= WriteData[7:0];
           end
           2'b01:
           begin
           memory[Address[16:2]][15:8] <= WriteData[7:0];
           end
           2'b10:
           begin
           memory[Address[16:2]][24:16] <= WriteData[7:0];
           end
           2'b11:
           begin
           memory[Address[16:2]][31:25] <= WriteData[7:0];
           end
           endcase
            //gotta offset by 0 1 2 or 3
           //memory[Address[9:0]] <= WriteData[7:0];
        end
        else if (MemWrite == 2'b10) begin//half
            //memory[Address[10:1]][31:16] <= WriteData[15:0];
            case (Address[1])
           0:
           begin
           memory[Address[16:2]][15:0] <= WriteData[15:0];
           end
           1:
           begin
           memory[Address[16:2]][31:16] <= WriteData[15:0];
           end
           endcase
            //memory[Address[10:1]] <= WriteData[15:0];
            
        end
        else if (MemWrite == 2'b11)  begin//word
            memory[Address[16:2]] <= WriteData;
        end
        else begin
        end
           
    end 

    always @(*) begin
        if (MemRead == 1)
        //ReadData[7:0] <= memory[Address[9:0]][31:24]; // read from memory
         case (Address[1:0])//byte
           2'b00:
           begin
           ReadData[7:0] <= memory[Address[16:2]][7:0];
           end
           2'b01:
           begin
           ReadData[7:0] <= memory[Address[16:2]][15:8];
           end
           2'b10:
           begin
           ReadData[7:0] <= memory[Address[16:2]][24:16];
           end
           2'b11:
           begin
           ReadData[7:0] <= memory[Address[16:2]][31:25];
           end
           endcase
        
        else if (MemRead == 2)//half
        //ReadData[15:0] <= memory[Address[10:1]][31:16];
        case (Address[1])
           0:
           begin
           ReadData[15:0] <= memory[Address[16:2]][15:0];
           end
           1:
           begin
           ReadData[15:0] <= memory[Address[16:2]][31:16];
           end
           endcase
        
        else if (MemRead == 3)//word
        ReadData <= memory[Address[16:2]];
        else
        ReadData <= 0;

    end          



endmodule
