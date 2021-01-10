module clock_gen(output reg clk);
    initial
    clk <= 0;
    always
    #10 clk = ~clk;
    initial
    #10000 $finish;
endmodule