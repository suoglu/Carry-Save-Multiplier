// Yigit Suoglu
// This file contains modules about seven segment display
// Modules in this file designed to work with Digilent Basys 3 and 100 MHz clock frequency
/*
 *    abcdefg signals correspond to:
 *
 *      a
 *    f   b        Note: abcdefg signals should driven low to ilmunate
 *      g                corresponding segment.
 *    e   c
 *      d
 */
`timescale 1ns / 1ps

//ssdMaster: takes 4 4-bit digits and generates ssd control signals to displays them
  input clk, rst;
  input [3:0] mode; //each bit represents enableing correspond ssd
  //e.g. mode=0001 means only least significant digit (rightmost, digit0) is going to be enabled
  input [3:0] digit0, digit1, digit2, digit3;
  output a, b, c, d, e, f, g;
  output reg an0, an1, an2, an3;

  reg [1:0] state; //shows a diffrent digit every state
  wire stateClk; //state changes every edge of stateClk
  reg [15:0] counter; //655.36µs or ~1.526 kHz

  //Some signals for better readability
  wire [3:0] encode_in;
  wire [6:0] abcdefg;
  reg [3:0] digit[3:0];

  assign stateClk = counter[15]; //state clock determined by MSB of counter

  //both state and counter will warp 11.. to 00.. at max
  always@(posedge stateClk or posedge rst) //state transactions
    begin
      if(rst)
        state <= 2'b0;
      else
        state <= state + 2'b1;
    end

  always@(posedge clk or posedge rst) //counter
    begin
      if(rst)
        counter <= 16'b0;
      else
        counter <= counter + 16'b1;
    end

  always@* //anode control
    begin
        case(state)
          2'd0:
            begin
              an0 = 1'b1;
              an1 = 1'b0;
              an2 = 1'b0;
              an3 = 1'b0;
            end
          2'd1:
            begin
              an0 = 1'b0;
              an1 = 1'b1;
              an2 = 1'b0;
              an3 = 1'b0;
            end
          2'd2:
            begin
              an0 = 1'b0;
              an1 = 1'b0;
              an2 = 1'b1;
              an3 = 1'b0;
            end
          2'd3:
            begin
              an0 = 1'b0;
              an1 = 1'b0;
              an2 = 1'b0;
              an3 = 1'b1;
            end
        endcase
    end

  always@* //collect digits in one block
    begin
      digit[0] = digit0;
      digit[1] = digit1;
      digit[2] = digit2;
      digit[3] = digit3;
    end

  assign {a,b,c,d,e,f,g} = (mod[state]) ? abcdefg : 7'b1111111;


  assign encode_in = digit[state];

  ssd_encode encoder(encode_in, abcdefg);

endmodule //Master seven segment display control

//Converts 4 bit input to hex abcdefg
module ssd_encode(in, abcdefg);
  parameter zero = 7'b0000001, one = 7'b1001111, two = 7'b0010010;
  parameter thr = 7'b0000110, four = 7'b1001100, five = 7'b0100100;
  parameter six = 7'b0100000, svn = 7'b0001111, eght = 7'b0000000;
  parameter nine = 7'b0000100, A = 7'b0001000, B = 7'b1100000;
  parameter C = 7'b0110001, D = 7'b1000010, E = 7'b0110000, F = 7'b0111000;
  input [3:0] in;
  output reg [6:0] abcdefg;

  always@*
    begin
        case (in)
          4'b0: abcdefg = zero;
          4'b1: abcdefg = one;
          4'b10: abcdefg = two;
          4'b11: abcdefg = thr;
          4'b100: abcdefg = four;
          4'b101: abcdefg = five;
          4'b110: abcdefg = six;
          4'b111: abcdefg = svn;
          4'b1000: abcdefg = eght;
          4'b1001: abcdefg = nine;
          4'b1010: abcdefg = A;
          4'b1011: abcdefg = B;
          4'b1100: abcdefg = C;
          4'b1101: abcdefg = D;
          4'b1110: abcdefg = E;
          4'b1111: abcdefg = F;
        endcase
    end

endmodule // ssdDecode
