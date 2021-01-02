module left_shifter(inData,outData);

  input [63:0]inData;
  output [63:0]outData;
  reg [63:0]outData;

  always@(inData)
    begin

      outData=inData<<1;

    end

endmodule