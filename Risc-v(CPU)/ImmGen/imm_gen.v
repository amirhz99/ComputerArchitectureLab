module immgen_32to64(inputData, outputData);

  input[31:0] inputData;
  output[63:0] outputData;
  reg [63:0] outputData;

  always@(inputData)
    begin
      outputData[31:0]  = inputData[31:0];
      outputData[63:32] = {32{inputData[31]}};
    end

endmodule