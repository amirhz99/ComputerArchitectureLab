`include "Nbit_adder.v"

module tb_N_bit_adder;

 reg [31:0] input1;
 reg [31:0] input2;

 wire [31:0] answer;

 N_bit_adder uut (
  .input1(input1),
  .input2(input2),
  .answer(answer)
 );

    initial begin
        
    input1 = 1209;
    input2 = 4565;
    #100;

    $monitor("your answer is %d",answer);

    end


endmodule