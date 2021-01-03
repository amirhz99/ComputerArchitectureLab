
module control_unit(
      input[6:0] op_code,
      output reg[1:0] alu_op,
      output reg branch,mem_read,mem_to_reg,mem_write,alu_src,reg_write
    );

always @(op_code)
begin
 casex(op_code)
  7'b0000011:
  // load data
    begin
      alu_src = 1'b1
      mem_to_reg = = 1'b1
      reg_write = 1'b1
      mem_read = 1'b1
      mem_write = 1'b0
      branch = 1'b0
      alu_op = 2'b00
    end
  7'b0100011:
  // store data
    begin
      alu_src = 1'b1
      mem_to_reg = = 1'bx
      reg_write = 1'b0
      mem_read = 1'b0
      mem_write = 1'b1
      branch = 1'b0
      alu_op = 2'b00
    end
  7'b0110011:
    // R-Type
    begin
      alu_src = 1'b0
      mem_to_reg = = 1'b0
      reg_write = 1'b1
      mem_read = 1'b0
      mem_write = 1'b0
      branch = 1'b0
      alu_op = 2'b10
    end
  7'b1100011:
  // beq
    begin
      alu_src = 1'b0
      mem_to_reg = = 1'bx
      reg_write = 1'b0
      mem_read = 1'b0
      mem_write = 1'b0
      branch = 1'b1
      alu_op = 2'b01
    end
  default:
    begin
      alu_src = 1'b0
      mem_to_reg = = 1'b0
      reg_write = 1'b0
      mem_read = 1'b0
      mem_write = 1'b0
      branch = 1'b0
      alu_op = 2'bxx
    end

 end

endmodule