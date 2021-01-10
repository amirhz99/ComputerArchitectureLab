module data_memory (clk,address, write_data,read_data,mem_write,mem_read);
input clk;
input wire [47:0] address;
input [63:0] write_data;
input mem_write, mem_read;
output reg [63:0] read_data;


reg [63:0] MEMO[0:123];

integer iter;
initial begin
  read_data <= 0;
  for (iter = 0; iter < 100; iter = iter + 1)
  begin
    MEMO[iter] = iter;
  end
end

always @(posedge clk) begin
  if (mem_write == 1) begin
    MEMO[address] <= write_data;
  end

  if (mem_read == 1) begin
    read_data <= MEMO[address];
  end
end

endmodule
