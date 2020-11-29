
module connector( clk );

wire clk;
wire [63:0] pc_out;
wire [63:0] pc_Old = 64'b0;
integer write=1,reset=0;

N_bit_adder N_bit_adder1(.input1(pc_Old),.in_put2(64'b100),.answer(pc_Old));

pc pc1(.clk(clk), .in(pc_Old) , .out(pc_out) , .reset(reset) ,.write(write));


endmodule;