module pc(clk , in , out , reset ,write);
input clk , reset,write;
input [63:0] in ;
output  reg [63:0]  out;
always @(posedge clk)
begin
    if(reset)
        out = 0 ;
    else
       if (write)
          out = in ;
end
endmodule;