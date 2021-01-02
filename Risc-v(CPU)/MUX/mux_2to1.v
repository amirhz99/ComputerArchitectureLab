module MUX_2to1(input1 ,input2,select,out);
  input [31:0] input1, input2;
  input select;
  output [31:0]out;
  reg [31:0]out;

  always @(input1 or input2 or select )
    begin
      case(select)
          1'b0:   out=input1;
          1'b1:  out=input2;
      endcase
    end
 endmodule