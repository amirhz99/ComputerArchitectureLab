`include "clock_generator.v"

module tb_clock_gen;

 wire clk;

 clock_gen cg (
  .clk(clk)
 );

    initial begin
    $monitor("clk is %d",clk);
    end


endmodule