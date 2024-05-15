module shift2 (
  input [31:0] data_i,
  output [31:0] data_o
);

assign data_o = {data_i[29:0],2'b00};

endmodule