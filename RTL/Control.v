module Control(
    Op_i       ,
    ALUOp_o    ,
    ALUSrc_o   ,
    RegWrite_o ,
    MemRd_o,
    MemWr_o,
    MemToReg_o,
    Branch_o,
    immSelect_o,
    Flush_o //flush the pipeline
);

//ports

input [6:0]     Op_i;
output reg[1:0]     ALUOp_o;  //what operation to perform.
output  reg      ALUSrc_o, immSelect_o;

//=======================================================
// ALUSrc_o : = '1': (register and immediate value)
//            = '0': (value of two registers)
output  reg    RegWrite_o, MemRd_o, MemWr_o, MemToReg_o, Branch_o, Flush_o;




always@(*)begin

  case(Op_i)

  7'b0010011 : begin //addi
    ALUOp_o = 2'b11;
    ALUSrc_o = 1'b1;
    RegWrite_o = 1'b1;   //write result back to register file
    MemRd_o = 1'b0;     //read data from memory
    MemWr_o = 1'b0;     //write data to memory
    MemToReg_o = 1'b0;      //write data from memory to register file
    Branch_o = 1'b0;
    immSelect_o = 1'b0;
    Flush_o = 1'b0;
  end
  
  7'b0110011 : begin //others
    ALUOp_o = 2'b10;
    ALUSrc_o = 1'b0;
    RegWrite_o = 1'b1;
    MemRd_o = 1'b0;
    MemWr_o = 1'b0;
    MemToReg_o = 1'b0;
    Branch_o = 1'b0;
    immSelect_o = 1'b0;
    Flush_o = 1'b0;
  end

  7'b1100011 : begin //branch
    ALUOp_o = 2'b01;
    ALUSrc_o = 1'b1;
    RegWrite_o = 1'b0;
    MemRd_o = 1'b0;
    MemWr_o = 1'b0;
    MemToReg_o = 1'b0;
    Branch_o = 1'b1;
    immSelect_o = 1'b0;
    Flush_o = 1'b1;
  end

  7'b0000011 : begin //lw
    ALUOp_o = 2'b00;
    ALUSrc_o = 1'b1;
    MemRd_o = 1'b1;
    MemToReg_o = 1'b1;
    RegWrite_o = 1'b1;
    MemWr_o = 1'b0;
    Branch_o = 1'b0;
    immSelect_o = 1'b0;
    Flush_o = 1'b0;
  end

  7'b0100011 : begin //sw
    ALUOp_o = 2'b00;
    ALUSrc_o = 1'b1;
    MemWr_o = 1'b1;
    RegWrite_o = 1'b0;
    MemRd_o = 1'b0;
    MemToReg_o = 1'b0;
    Branch_o = 1'b0;
    immSelect_o = 1'b1;
    Flush_o = 1'b0;
  end

  //---------NEW-----------
  7'b1010111: begin //vector
    ALUOp_o = 2'b00; //useless
    ALUSrc_o = 1'b0;
    RegWrite_o = 1'b1;
    MemRd_o = 1'b0;
    MemWr_o = 1'b0;
    MemToReg_o = 1'b0;
    Branch_o = 1'b0;
    immSelect_o = 1'b0;
    Flush_o = 1'b0;
  end
  //---------NEW-----------

  default : begin
    ALUOp_o = 2'b11;
    ALUSrc_o = 1'b1;
    RegWrite_o = 1'b0;
    MemRd_o = 1'b0;
    MemWr_o = 1'b0;
    MemToReg_o = 1'b0;
    Branch_o = 1'b0;
    immSelect_o = 1'b0;
    Flush_o = 1'b0;
  end
  endcase
end
endmodule