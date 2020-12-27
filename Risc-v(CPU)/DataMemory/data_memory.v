module DataMemory(inputAddress, inputData32bit, outputData32bit, MemRead, MemWrite);

input [31:0]inputAddress;
input [31:0]inputData32bit;
input MemRead, MemWrite;
output [31:0]outputData32bit;

/////// THE MAIN MEMORY REGISTERS WHICH HOLD EMULATE THE ACTUAL RAM.
        reg [7:0]MM[255:0];
///////

reg [7:0]address;
reg [7:0]dataBuff;
reg [31:0]outputData32bit;

integer addressInt, i, j, placeVal,var, baseAddress;
genvar k;

always @( inputData32bit or inputAddress or MemRead or MemWrite)
begin

  address=inputAddress[7:0];

  addressInt = 0;
  placeVal = 1;
  for( i=0 ; i<8 ; i=i+1 )
  begin
      if(address[i] == 1'b1)
        addressInt = addressInt + placeVal;
      placeVal = placeVal * 2;
  end

  if(MemRead == 1)
  begin
    baseAddress = addressInt;
    for(i=0 ; i<4 ; i=i+1)
    begin
       for(j = 0 ; j < 8 ; j = j+1 )
        begin
           outputData32bit[j] = MM[baseAddress + i][j];
        end
    end
  end

  if(MemWrite == 1)
  begin
    baseAddress = addressInt;
    for(i=0 ; i<4 ; i = i + 1)
    begin
      for(j = 0 ; j < 8 ; j = j+1 )
         begin
             MM[baseAddress + i][j] = inputData32bit[j] ;
         end
    end

  end
end

endmodule