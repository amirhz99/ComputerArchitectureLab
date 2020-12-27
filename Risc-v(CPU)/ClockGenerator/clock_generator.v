module clock_generator (clk);

    parameter n = 64;
    output reg clk = 0;
    integer i = 0;

    initial begin

        clk = 0;

        for(i = 0; i < n; i = i + 1)
        begin

            #10

            clk = ~clk;

            $monitor("At time %2t: n = %d, clk = %d", $time, n, clk);

        end

    end

endmodule
