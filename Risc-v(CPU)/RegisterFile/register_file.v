module registers(
 input clk,
 input enable,
 input  [4:0] write_register,read_register_1,read_register_2
 input  [63:0] reg_write_dSata
 output  [63:0] read_data_1,read_data_2
);

 reg [63:0] RegistersArr [31:0];

 integer iter;
 initial begin
  for(iter=0;iter<8;iter=iter+1)
   RegistersArr[iter] <= 64'd0;
 end

 always @ (posedge clk) begin
   if(enable) begin
    RegistersArr[write_register] <= reg_write_data;
   end
 end


 assign read_data_1 = RegistersArr[read_register_1];
 assign read_data_2 = RegistersArr[read_register_2];
