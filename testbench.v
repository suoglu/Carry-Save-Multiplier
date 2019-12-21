`timescale 1ns / 1ps

module tb();
    reg [3:0] num1, num2, num3, num4, num5, num6, num7, num8, dummy;
    wire [8:0] result1, result2, result3, result4;

    multiCS4 uut1(num1, num2, result1);
    multiCS4 uut2(num3, num4, result2);
    multiCS4 uut3(num5, num6, result3);
    multiCS4 uut4(num7, num8, result4);

    initial //test cases here
        begin
            num1 <= 4'd3;
            num2 <= 4'd4;
            num3 <= 4'd10;
            num4 <= 4'd7;
           num5 <=  4'd9;
           num6 <= 4'd14;
           num7 <= 4'd6;
           num8 <= 4'd6;
           #1000
           dummy =  0;
        end
endmodule // tb
