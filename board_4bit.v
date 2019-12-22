module board(leds, in1, in2, conSW);
  input [3:0] in1, in2;
  input conSW;
  output [8:0] leds;
  wire [8:0]  result1, result2;

  multiCS4_fullbasecell uut0(in1, in2, result1);
  multiCS4_v1 uut1(in1, in2, result2);

assign leds = (conSW) ? result1 : result2;

endmodule // board
