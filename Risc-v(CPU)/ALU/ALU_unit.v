module alu(data1,data2,alu_control,alu_result,zero);
 input  [63:0] data1,data2;
 input  [3:0] alu_control;
 output reg [63:0] alu_result;
 output zero;

always @(*)
begin
 case(alu_control)
 4'b0000: alu_result = data1 & data2;
 4'b0001: alu_result = data1 | data2;
 4'b0010: alu_result = data1 + data2;
 4'b0110: alu_result = data1 - data2;
 default: alu_result = data1 + data2;
 endcase
end

assign zero = (alu_result == 1'd0) ? 1'b1: 4'b0000;

endmodule
