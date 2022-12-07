`timescale 1ns / 1ps

module ForwardBranch(rs_ID, rt_ID, EX_MEM_rd, EX_MEM_RegWrite, rs_MUX, rt_MUX);

    input EX_MEM_RegWrite; //checks if the register is being written to
    input [4:0] rs_ID, rt_ID; //register addresses for branch instruction
    input [4:0] EX_MEM_rd; //rd register being written to by the ALU
    //input EX_MEM_MemRead; // checks if it is loadword in memory

    output reg rs_MUX, rt_MUX; //controls the mux signals
    // MUX SIGNAL KEY:
    // 0 --> value from Register File
    // 1 --> value from EX_MEM pipeline

    initial begin
            rs_MUX <= 0;
            rt_MUX <= 0;
    end
        always @(rs_ID, rt_ID, EX_MEM_rd, EX_MEM_RegWrite)begin
        
            if (EX_MEM_RegWrite/* && !EX_MEM_MemRead*/)begin
                if ((rs_ID == EX_MEM_rd) && (rt_ID != EX_MEM_rd))begin
                    rs_MUX <= 1;
                    rt_MUX <= 0;
                end
                else if ((rs_ID != EX_MEM_rd) && (rt_ID == EX_MEM_rd))begin
                    rs_MUX <= 0;
                    rt_MUX <= 1;
                end
                else if ((rs_ID == EX_MEM_rd) && (rt_ID == EX_MEM_rd))begin
                    rs_MUX <= 1;
                    rt_MUX <= 1;
                end
                else begin
                    rs_MUX <= 0;
                    rt_MUX <= 0;
                end

            end
            
            else begin
                rs_MUX <= 0;
                rt_MUX <= 0;
            end
    end



endmodule