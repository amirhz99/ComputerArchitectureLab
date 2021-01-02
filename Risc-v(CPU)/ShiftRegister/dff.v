module d_ff ( d, clk, rst, q );
input d, clk, rst;
output q;
reg q;
always @( posedge clk )
begin
if (rst)
q = 1’b0;
else
q = d;
end
endmodule