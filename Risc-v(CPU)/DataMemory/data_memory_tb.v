`timescale 1ns / 1ns
`include "../ClockGenerator/clock_generator.v"
`include "data_memory.v"

module data_memory_tb;
    wire clk;
    reg [47:0] address;
    reg mem_Write, mem_Read;
    reg [63:0] write_data;
    wire [63:0] read_data;

    clock_gen clck_g (clk);
    data_memory dm (clk,address,write_data,read_data,mem_Write,mem_Read);

    integer iter;
    initial
    begin

        $dumpfile("data_memory_tb.vcd");
        $dumpvars(0, data_memory_tb);

        mem_Write <= 0;
        mem_Read <= 0;

        iter = 0;

        for (iter = 0; iter < 40; iter = iter + 1)
        begin
            @(posedge clk);
            address <= iter;
        end

        #10 mem_Write <= 1;
        iter = 0;
        for (iter = 0; iter < 40; iter = iter + 1)
        begin
            @(posedge clk);
            address <= iter;
            write_data <= iter+1;
        end

        #10 mem_Write <= 0; mem_Read <= 1;
        iter = 0;
        for (iter = 0; iter < 40; iter = iter + 1)
        begin
            @(posedge clk);
            address <= iter;
        end

        #1000 $finish;
    end
endmodule