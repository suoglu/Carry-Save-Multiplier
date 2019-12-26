module board(clk, rst, in0, in1, a, b, c, d, e, f, g, an);
  input clk,  rst;
  input [7:0] in0, in1;
  output a, b, c, d, e, f, g;
  output [3:0] an;

  wire [15:0] product;

  ssdMaster ssd_control(clk, rst, 4'b1111, product[3:0], product[7:4], product[11:8], product[15:12], a, b, c, d, e, f, g, an);

  csmulti_fullbasecell cs_multiplier(in0, in1, product);

endmodule // board
