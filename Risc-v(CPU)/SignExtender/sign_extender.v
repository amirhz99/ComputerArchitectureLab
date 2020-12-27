module SignExtender_16to32(inputData, outputData);

  input[15:0] inputData;
  output[31:0] outputData;
  reg [31:0] outputData;

  always@(inputData)
    begin
      outputData[15:0]  = inputData[15:0];
      outputData[31:16] = {16{inputData[15]}};
    end
endmodule