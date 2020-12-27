module Adder32Bit(input1, input2, out, overflowBit);

  input [31:0] input1, input2;
  output [31:0] out;
  reg [31:0]out;
  output overflowBit;
  reg overflowBit;

      always@(input1 or input2)
        begin

          {overflowBit , out } = input1 + input2;

        end

endmodule