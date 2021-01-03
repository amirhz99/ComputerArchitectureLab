module Instruction_Memory(
//As Master said, we get a 48-bit word in this part
 input[47:0] pc,
 output[31:0] instruction
);

parameter Data = "insteuctions.txt"

reg [31:0] mem [0:63];

 initial
 begin
  $readmemh(Data,mem);
 end
 assign data =  mem[pc[5:0]];

endmodule