//Yiğit Süoğlu
//This file contains (various) parameterized Carry Save Multiplier module(s)

module csmulti_fullbasecell#(parameter bitsize = 8)(factor0, factor1, product);
  input [(bitsize-1):0] factor0, factor1;
  output reg [((2*bitsize)-1):0] product;

  //Wires to carry signals between cells
  reg [(bitsize-1):0] sum_vec[(bitsize-1):0];
  reg [(bitsize-1):0] carry_vec[(bitsize-1):0];

  //Inputs & Outputs of basecells
  reg [(bitsize-1):0] f1_i[(bitsize-1):0];
  reg [(bitsize-1):0] f2_i[(bitsize-1):0];
  reg [(bitsize-1):0] b_i[(bitsize-1):0];
  reg [(bitsize-1):0] c_i[(bitsize-1):0];
  wire [(bitsize-1):0] sum_o[(bitsize-1):0];
  wire [(bitsize-1):0] c_o[(bitsize-1):0];

  integer i, j; //for rewiring loops
  genvar k, l;

  //Generate basecell modules
  generate
      for (k = 0; k < bitsize; k = k + 1)
        begin
          for (l = 0; l < bitsize; l = l + 1)
            begin : basecell
              basecell_fa bscll(f1_i[k][l], f2_i[k][l], b_i[k][l], c_i[k][l], sum_o[k][l], c_o[k][l]);
            end
        end
  endgenerate

  always@*
    begin
      //Wire renameing for basecell ports
      for(i = 0; i < bitsize; i = i + 1)
         begin
          for(j = 0; j < bitsize; j = j + 1)
             begin
              f1_i[i][j] = factor0[i];

              f2_i[i][j] = factor1[j];

              if(i == 0)
                begin
                  b_i[i][j] = 1'b0;
                end
              else if(j == (bitsize - 1))
                begin
                  b_i[i][j] = carry_vec[i-1][j]; //note: j = bitsize - 1
                end
              else
                begin
                  b_i[i][j] = sum_vec[i-1][j+1];
                end

              if(j == 0)
                begin
                  c_i[i][j] = 1'b0;
                end
              else
                begin
                  c_i[i][j] = carry_vec[i][j-1];
                end

              sum_vec[i][j] = sum_o[i][j];
              
              carry_vec[i][j] = c_o[i][j];
             end
         end

      //Output wire renameing
      for(i = 0; i < bitsize; i = i + 1)
         begin
            product[i] = sum_vec[i][0];
         end
      for(i = 1; i < bitsize; i = i + 1)
         begin
            product[bitsize+i-1] = sum_vec[bitsize-1][i];
         end
      product[(2*bitsize)-1] = carry_vec[bitsize-1][bitsize-1];
    end

endmodule // Parameterized Carry Save Multiplier
