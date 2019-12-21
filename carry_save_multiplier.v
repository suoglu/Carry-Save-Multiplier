// Yigit Suoglu
// This file contains various Carry Save Multiplier modules
// Multiplier sizes: 4 bit, more to be added
`timescale 1ns / 1ps

// 4 bit Carry Save Multiplier
module multiCS4(factor1, factor2, product);
  input [3:0] factor1, factor2;
  output [8:0] product;



endmodule

// 4 bit Carry Save Multiplier version 1
module multiCS4_v1(factor1, factor2, product);
  input [3:0] factor1, factor2;
  output [8:0] product;

  wire [3:0] pproduct[3:0]; //partial products
  wire [4:0] carrySave[2:0];
  wire [3:0] merging_vec[1:0]; //to carry partial product sums
  wire [1:0] carryProp;

  genvar i, j;

  //Loops for partial product generation
  for(i = 0; i < 4; i = i + 1)
    for(j = 0; j < 4; j = j + 1)
      begin
        assign  pproduct[i][j] = factor1[i] & factor2[j];
      end

	//Adder array and product generation
	assign product[0] = pproduct[0][0];

	//first level of adders
	HA level0_0(pproduct[0][1], pproduct[1][0], product[1], carrySave[0][0]);
	HA level0_1(pproduct[0][2], pproduct[1][1], merging_vec[0][0], carrySave[0][1]);
	HA level0_2(pproduct[0][3], pproduct[1][2], merging_vec[0][1], carrySave[0][2]);
	HA level0_3(pproduct[1][3], pproduct[2][2], merging_vec[0][2], carrySave[0][3]);
	HA level0_4(pproduct[2][3], pproduct[3][2], merging_vec[0][3], carrySave[0][4]);

	//second level of adders
	FA level1_0(merging_vec[0][0], pproduct[2][0], carrySave[0][0], product[2], carrySave[1][0]);
	FA level1_1(merging_vec[0][1], pproduct[2][1], carrySave[0][1], merging_vec[1][0], carrySave[1][1]);
	FA level1_2(merging_vec[0][2], pproduct[3][1], carrySave[0][2], merging_vec[1][1], carrySave[1][2]);
	HA level1_3(merging_vec[0][3], carrySave[0][3], merging_vec[1][2], carrySave[1][3]);
	HA level1_4(pproduct[3][3], carrySave[0][4], merging_vec[1][3], carrySave[1][4]);

	//final level of adders (Vector merging adder)
	FA level2_0(merging_vec[1][0], pproduct[3][0], carrySave[1][0], product[3], carrySave[2][0]);
	FA level2_1(merging_vec[1][1], carrySave[2][0], carrySave[1][1], product[4], carrySave[2][1]);
	FA level2_2(merging_vec[1][2], carrySave[2][1], carrySave[1][2], product[5], carrySave[2][2]);
	FA level2_3(merging_vec[1][3], carrySave[2][2], carrySave[1][3], product[6], carrySave[2][3]);
	HA level2_4(carrySave[1][4], carrySave[2][3], product[7], product[8]);

endmodule

module basecell_ha(f1_i, f2_i, b_i, sum_o, c_o);
  input f1_i, f2_i, b_i;
  output sum_o, c_o;

  wire pp;

  assign pp = f1_i & f2_i;

endmodule // Base cell with half adder

module basecell_fa(f1_i, f2_i, b_i, c_i, sum_o, c_o);
  input f1_i, f2_i, b_i, c_i;
  output sum_o, c_o;

  wire pp;

  assign pp = f1_i & f2_i;

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
