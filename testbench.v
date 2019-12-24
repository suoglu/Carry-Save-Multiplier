`timescale 1ns / 1ps

module tb();
    reg [3:0] zero, one, two, three, four, five, six, seven, eight, nine, ten,  eleven, twelve, thirtn, fourtn, fiftn, dummy;
    wire [8:0] v1_1, v1_2, v1_3, v1_4, fbc_1, fbc_2, fbc_3, fbc_4, v1_5, fbc_5, fbc_6, fbc_7, fbc_8, v1_6, v1_7, v1_8;
    reg [15:0] binary_result;

    multiCS4_v1 uut0_0(three, four, v1_1);
    multiCS4_v1 uut0_1(ten, seven, v1_2);
    multiCS4_v1 uut0_2(nine, fourtn, v1_3);
    multiCS4_v1 uut0_3(six, six, v1_4);
    multiCS4_v1 uut0_4(fiftn, fiftn, v1_5);
    multiCS4_v1 uut0_5(zero, twelve, v1_6);
    multiCS4_v1 uut0_6(five, thirtn, v1_7);
    multiCS4_v1 uut0_7(eleven, eleven, v1_8);

    multiCS4_fullbasecell uut1_0(three, four, fbc_1[7:0]);
    multiCS4_fullbasecell uut1_1(ten, seven, fbc_2[7:0]);
    multiCS4_fullbasecell uut1_2(nine, fourtn, fbc_3[7:0]);
    multiCS4_fullbasecell uut1_3(six, six, fbc_4[7:0]);
    multiCS4_fullbasecell uut1_4(fiftn, fiftn, fbc_5[7:0]);
    multiCS4_fullbasecell uut1_5(zero, twelve, fbc_6[7:0]);
    multiCS4_fullbasecell uut1_6(five, thirtn, fbc_7[7:0]);
    multiCS4_fullbasecell uut1_7(eleven, eleven, fbc_8[7:0]);

    assign fbc_1[8] = 1'b0;
    assign fbc_2[8] = 1'b0;
    assign fbc_3[8] = 1'b0;
    assign fbc_4[8] = 1'b0;
    assign fbc_5[8] = 1'b0;
    assign fbc_6[8] = 1'b0;
    assign fbc_7[8] = 1'b0;
    assign fbc_8[8] = 1'b0;


    initial //test cases here
        begin
           zero <= 4'd0;
           one <= 4'd1;
           two <= 4'd2;
           three <= 4'd3;
           four <= 4'd4;
           five <= 4'd5;
           six <= 4'd6;
           seven <= 4'd7;
           eight <= 4'd8;
           nine <= 4'd9;
           ten <= 4'd10;
           eleven <= 4'd11;
           twelve <= 4'd12;
           thirtn <= 4'd13;
           fourtn <= 4'd14;
           fiftn <= 4'd15;
           #100
           binary_result[0] <= (v1_1 == 9'd12);
           binary_result[1] <= (v1_2 == 9'd70);
           binary_result[2] <= (v1_3 == 9'd126);
           binary_result[3] <= (v1_4 == 9'd36);
           binary_result[4] <= (v1_5 == 9'd225);
           binary_result[5] <= (v1_6 == 9'd0);
           binary_result[6] <= (v1_7 == 9'd65);
           binary_result[7] <=  (v1_8 == 9'd121);

           binary_result[8] <= (fbc_1 == 9'd12);
           binary_result[9] <= (fbc_2 == 9'd70);
           binary_result[10] <= (fbc_3 == 9'd126);
           binary_result[11] <= (fbc_4 == 9'd36);
           binary_result[12] <= (fbc_5 == 9'd225);
           binary_result[13] <= (fbc_6 == 9'd0);
           binary_result[14] <= (fbc_7 == 9'd65);
           binary_result[15] <= (fbc_8 == 9'd121);
           #100
           dummy =  0;
        end
endmodule // tb
