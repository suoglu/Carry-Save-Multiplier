`timescale 1ns / 1ps

module tb();
  reg [7:0] testcase0[1:0];
  reg [7:0] testcase1[1:0];
  reg [7:0] testcase2[1:0];
  reg [7:0] testcase3[1:0];
  reg [7:0] testcase4[1:0];
  reg [7:0] testcase5[1:0];
  reg [7:0] testcase6[1:0];
  reg [7:0] testcase7[1:0];
  wire [15:0] result[7:0];
  reg [7:0] binary_result;
  reg dummy;

  csmulti_fullbasecell uut0(testcase0[0], testcase0[1], result[0]);
  csmulti_fullbasecell uut1(testcase1[0], testcase1[1], result[1]);
  csmulti_fullbasecell uut2(testcase2[0], testcase2[1], result[2]);
  csmulti_fullbasecell uut3(testcase3[0], testcase3[1], result[3]);
  csmulti_fullbasecell uut4(testcase4[0], testcase4[1], result[4]);
  csmulti_fullbasecell uut5(testcase5[0], testcase5[1], result[5]);
  csmulti_fullbasecell uut6(testcase6[0], testcase6[1], result[6]);
  csmulti_fullbasecell uut7(testcase7[0], testcase7[1], result[7]);

  initial
    begin
        dummy = 1;
        testcase0[0] = 8'd255;
        testcase0[1] = 8'd255;
        testcase1[0] = 8'd150;
        testcase1[1] = 8'd100;
        testcase2[0] = 8'd23;
        testcase2[1] = 8'd45;
        testcase3[0] = 8'd11;
        testcase3[1] = 8'd243;
        testcase4[0] = 8'd121;
        testcase4[1] = 8'd212;
        testcase5[0] = 8'd88;
        testcase5[1] = 8'd25;
        testcase6[0] = 8'd96;
        testcase6[1] = 8'd231;
        testcase7[0] = 8'd1;
        testcase7[1] = 8'd255;
        #100
        binary_result[0] = (result[0] == 16'd65_025);
        binary_result[1] = (result[1] == 16'd15_000);
        binary_result[2] = (result[2] == 16'd1035);
        binary_result[3] = (result[3] == 16'd2673);
        binary_result[4] = (result[4] == 16'd25_652);
        binary_result[5] = (result[5] == 16'd2200);
        binary_result[6] = (result[6] == 16'd22_176);
        binary_result[7] = (result[7] == 16'd255);
        #100
        dummy = 0;
    end


endmodule //
