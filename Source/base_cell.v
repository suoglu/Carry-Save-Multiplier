// Yigit Suoglu
// This file contains basecells and basic adders for Carry Save Multiplier modules
`timescale 1ns / 1ps

module basecell_ha(f1_i, f2_i, b_i, sum_o, c_o);
  input f1_i, f2_i, b_i;
  output sum_o, c_o;

  wire pp;

  assign pp = f1_i & f2_i;

  HA adder(pp, b_i, sum_o, c_o);

endmodule // Base cell with half adder

module basecell_fa(f1_i, f2_i, b_i, c_i, sum_o, c_o);
  input f1_i, f2_i, b_i, c_i;
  output sum_o, c_o;

  wire pp;

  assign pp = f1_i & f2_i;

  FA adder(pp, b_i, c_i, sum_o, c_o);

endmodule // Base cell with full adder

//Simple 1 bit full adder
module FA(A, B, Cin, S, Cout);
  input A, B, Cin;
  output S, Cout;
  wire ha_sum; //Partial Sum without carry

  assign ha_sum = A ^ B;
  assign S =  ha_sum ^ Cin; //Sum
  assign Cout = (A & B) | (ha_sum & Cin); //Carry out
endmodule // full Adder

//Simple 1 bit half adder
module HA(A, B, S, Cout);
  input A, B;
  output S, Cout;

  assign S = A ^ B;
  assign Cout = A & B;
endmodule // half Adder
