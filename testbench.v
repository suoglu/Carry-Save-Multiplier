`timescale 1ns / 1ps

module tb();
    reg [3:0] num1, num2, num3, num4, num5, num6, num7, num8, dummy;
    wire [8:0] result1, result2, result3, result4, result5, result6, result7, result8;
    reg [7:0] binary_result;

    multiCS4_v1 uut1(num1, num2, result1);
    multiCS4_v1 uut2(num3, num4, result2);
    multiCS4_v1 uut3(num5, num6, result3);
    multiCS4_v1 uut4(num7, num8, result4);

    multiCS4_fullbasecell uut5(num1, num2, result5);
    multiCS4_fullbasecell uut6(num3, num4, result6);
    multiCS4_fullbasecell uut7(num5, num6, result7);
    multiCS4_fullbasecell uut8(num7, num8, result8);

    initial //test cases here
        begin
           num1 <= 4'd3;
           num2 <= 4'd4;
           num3 <= 4'd10;
           num4 <= 4'd7;
           num5 <= 4'd9;
           num6 <= 4'd14;
           num7 <= 4'd6;
           num8 <= 4'd6;
           #100
           binary_result[0] <= (result1 == 9'd12);
           binary_result[1] <= (result2 == 9'd70);
           binary_result[2] <= (result3 == 9'd126);
           binary_result[3] <= (result4 == 9'd36);

           binary_result[4] <= (result1 == 9'd12);
           binary_result[5] <= (result2 == 9'd70);
           binary_result[6] <= (result3 == 9'd126);
           binary_result[7] <= (result4 == 9'd36);
           #100
           dummy =  0;
        end
endmodule // tb
