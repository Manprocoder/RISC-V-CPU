module Branch(
    input [31:0] data1_i,
    input [31:0] data2_i,
    input [2:0] funct_i,     //[14:12] funct3 in B-type instruction
    input isBranch_i,
    output isBranch_o  //
);
    reg branch_select;

    always@(*)begin
        if(isBranch){
            case(funct_i)
                3'b000: begin
                    if(data1_i == data2_i)branch_select = 1;
                    else branch_select = 0;
                end
                3'b001: begin
                    if(data1_i != data2_i)branch_select = 1;
                    else branch_select = 0;
                end
                3'b100: begin
                    if(data1_i < data2_i)branch_select = 1;
                    else branch_select = 0;
                end
                3'b101: begin
                    if(data1_i >= data2_i)branch_select = 1;
                    else branch_select = 0;
                end
                3'b110: begin
                    if(data1_i < data2_i)branch_select = 1;
                    else branch_select = 0;
                end
                3'b111: begin
                    if(data1_i >= data2_i)branch_select = 1;
                    else branch_select = 0;
                default: branch_select = 0;
                end
            endcase

        }else{
            branch_select = 0;
        }
    end

    assign isBranch_o = branch_select;
endmodule