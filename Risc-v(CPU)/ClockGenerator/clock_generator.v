module clock_gen;
reg clk;
initial
clk = 1’b0;
always
#10 clk = ~clk;
initial
#1000 $finish;
endmodule