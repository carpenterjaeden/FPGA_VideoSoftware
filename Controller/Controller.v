`timescale 1ns / 1ps

module Controller(rsgz, tes, rsez, Instruction, RegWrite, RegDst, ALUSrc, ALUOp, 
        MemWrite, MemRead, MemToReg,
        Branch, jump, jal, jr, isBranch);
        
        input [31:0] Instruction;
        input rsgz, tes, rsez;
        output reg isBranch; //for hazard detection

output reg RegWrite, RegDst, ALUSrc,   //  // we need JumpPC control signal for a mux, 1 if we are jumping (read from opcode) and 0 if we are not jumping
        MemToReg, Branch, jump, jal, jr;

output reg [1:0] MemRead, MemWrite; // extend the amount of bits for how many different funct codes we need to specify
output reg [3:0] ALUOp;
        //PCSrc depends on Branch

        initial begin
        isBranch <= 0; 
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        MemToReg <= 0;
        Branch <= 0;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end

        always @(Instruction, rsgz, tes, rsez) begin
        case (Instruction[31:26])
        
        6'b000000: //R-type, add, and, nor, or, slt, sub, xor, sll, srl, jr  
        begin
        isBranch <= 0;        
        RegDst <=   1;
        ALUSrc <=   0;
        MemToReg <= 0;
        //RegWrite <= 1;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=    4'b0000;
        jump <= 0;
        jal <= 0;
        if (Instruction[5:0] == 6'b001000) begin
        jr <= 1;
        Branch <= 1;
        RegWrite <= 0;
        end
        else begin
        jr <= 0;
        RegWrite <= 1;
        end   
        end  
        6'b011100: // mul
        begin
        isBranch <= 0; 
        RegDst <=   1;
        ALUSrc <=   0;
        MemToReg <= 0;
        RegWrite <= 1;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=    4'b1011;
        jump <= 0;
        jal <= 0;
        jr <= 0;     
        end   
        //Immediates
        6'b001000: //addi
        begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   1;
        MemToReg <= 0;
        RegWrite <= 1;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=    4'b0001;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b001110: //XORi
        begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   1;
        MemToReg <= 0;
        RegWrite <= 1;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=    4'b0010;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b001010: //slti 
        begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   1;
        MemToReg <= 0;
        RegWrite <= 1;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=    4'b0011;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b001100: //ANDi 
        begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   1;
        MemToReg <= 0;
        RegWrite <= 1;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=    4'b0100;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b001101: //ORi 
        begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   1;
        MemToReg <= 0;
        RegWrite <= 1;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=    4'b0101;
        jump <= 0;
        jal <= 0;
        jr <= 0;        
        end
        //Branches jr is included at top

        6'b000001: //BGEZ, BLTZ
        begin
        //RegDst <=   0;
        //ALUSrc <=   1;
        //MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        isBranch <= 1;
        ALUOp <=    4'b0000;  
        jump <= 0;
        jal <= 0;
        jr <= 0;  
        if ((rsez == 1 || rsgz == 1) && Instruction[16] == 1) begin
                Branch <= 1;
        end
        else if ((rsez == 0 && rsgz == 0) && Instruction[16] == 0) begin
                Branch <= 1;  
        end
        else
                Branch <= 0;

        end
        6'b000111: //BGTZ 
        begin
        //RegDst <=   0;
        //ALUSrc <=   1;
        //MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        isBranch <= 1;
        ALUOp <=    4'b0111;  
        jump <= 0;
        jal <= 0;
        jr <= 0;
        if (rsez == 0 && rsgz == 1)
                Branch <= 1;
        else
                Branch <= 0;

        end
        6'b000110: //BLEZ 
        begin
        //RegDst <=   0;
        //ALUSrc <=   1;
        //MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        isBranch <= 1;
        ALUOp <=    4'b1000;  
        jump <= 0;
        jal <= 0;
        jr <= 0;
        if (rsez == 1 || rsgz == 0)
                Branch <= 1;
        else
                Branch <= 0;
        end
        6'b000101: //bne
        begin
        //RegDst <=   0;
        ALUSrc <=   0;
        //MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        isBranch <= 1;
        //ALUOp <=    4'b1001; 
        jump <= 0;
        jal <= 0;
        jr <= 0;
        if (tes == 0)
                Branch <= 1;
        else
                Branch <= 0;
        end
        6'b000100: //BEQ 
        begin
        //RegDst <=   0;
        ALUSrc <=   0;
        //MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  2'b00;
        MemWrite <= 2'b00;
        isBranch <= 1;
        //ALUOp <=    4'b1010;
        if (tes == 1)
                Branch <= 1;
        else
                Branch <= 0;
        end
        6'b000010: //j 
        begin
        isBranch <= 0; 
        //RegDst <=   0;
        //ALUSrc <=   0;
        //MemToReg <= 0;
        RegWrite <= 0;
        //MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   1;
        //ALUOp <=    2'b01;
        jump <= 1;
        jal <= 0;
        jr <= 0;
        end
        6'b000011: //jal 
        begin
        isBranch <= 0; 
        //RegDst <=   0;
        //ALUSrc <=   0;
        //MemToReg <= 0;
        RegWrite <= 0;
        //MemRead <=  2'b00;
        MemWrite <= 2'b00;
        Branch <=   1;
        //ALUOp <=    2'b01;
        jump <= 1;
        jal <= 1;
        jr <= 0;
        end
        //Memory
        6'b100011: //lw
        begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   1;
        MemToReg <= 1;
        RegWrite <= 1;
        MemRead <=  2'b11;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=  4'b0001;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b101011: //sw 
        begin
        isBranch <= 0; 
        //RegDst <=   0;
        ALUSrc <=   1;
        //MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  2'b00;
        MemWrite <= 2'b11;
        Branch <=   0;
        ALUOp <=  4'b0001;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b101000: //sb need another mux
        begin
        isBranch <= 0; 
        //RegDst <=   0;
        ALUSrc <=   1;
        //MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  2'b00;
        MemWrite <= 2'b01;
        Branch <=   0;
        ALUOp <=  4'b0001;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b100001: //lh 
        begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   1;
        MemToReg <= 1;
        RegWrite <= 1;
        MemRead <=  2'b10;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=  4'b0001;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b100000: //lb 
        begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   1;
        MemToReg <= 1;
        RegWrite <= 1;
        MemRead <=  2'b01;
        MemWrite <= 2'b00;
        Branch <=   0;
        ALUOp <=  4'b0001;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        6'b101001: //sh 
        begin
        isBranch <= 0; 
        //RegDst <=   0;
        ALUSrc <=   1;
        //MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  2'b00;
        MemWrite <= 2'b10;
        Branch <=   0;
        ALUOp <=  4'b0001;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        default: begin
        isBranch <= 0; 
        RegDst <=   0;
        ALUSrc <=   0;
        MemToReg <= 0;
        RegWrite <= 0;
        MemRead <=  0;
        MemWrite <= 0;
        Branch <=   0;
        ALUOp <=  0;
        jump <= 0;
        jal <= 0;
        jr <= 0;
        end
        endcase
        end
        

endmodule