module board(leds, eq_led, in1, in2);
  input [3:0] in1, in2;
  output [8:0] leds;
  output eq_led;
  wire [8:0]  result1, result2, result_comb;

  multiCS4_fullbasecell uut0(in1, in2, result1);
  multiCS4_v1 uut1(in1, in2, result2);

  assign leds = result1;

  //Compare outputs of two modules
  assign result_comb = result1 ^ result2;
  assign eq_led = &result_comb;


endmodule // board
