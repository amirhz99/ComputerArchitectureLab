module alu_control(alu_op, funct7_field, funct3_field, alu_control);

input [1:0] alu_op;
input [6:0] funct7_field;
input [2:0] funct3_field;
output reg [3:0] alu_control;

always @(alu_op or funct7_field or funct3_field)

case(alu_op)
    2'b00: alu_control <= 4'b0010; //add ld,sd
    2'b01: alu_control <= 4'b0110; //sub

    default:
        casex(funct7_field)
        7'b0100000:
            begin
                //subtract
                alu_control = 4'b0110;
            end

        7'b0000000:
            begin
                casex(funct3_field)
                //and
                3'b111: alu_control = 4'b0000;
                //add
                3'b000: alu_control = 4'b0010;
                //or
                3'b110: alu_control = 4'b0001;

                default: alu_control = 4'b000;

                endcase
            end

        default:
        begin
            alu_control = 4'b0000;
        end

        endcase

endcase

endmodule
