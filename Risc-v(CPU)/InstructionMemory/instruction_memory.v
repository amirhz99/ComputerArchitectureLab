module InstructionMemory(readAddress, instruction);
  input [31:0]readAddress;
  output [0:31]instruction;
  reg [0:31]instruction;

  reg [0:7]InstructionMemory[0:31];

  reg [4:0]internalAddress;

  integer internalAddressINT, placeVal, i, j;

  always@(readAddress)
  begin
      //Only 5 bit addresses supported.
//      InstructionMemory[0] = 32'b00000_00000_00000_00000_00000_000000;

      {InstructionMemory[0], InstructionMemory[1], InstructionMemory[2], InstructionMemory[3]} = 32'b001101_10010_10011_0000000000000001;    //ori $s2, $s1 , 1539;
      {InstructionMemory[4], InstructionMemory[5], InstructionMemory[6], InstructionMemory[7]} = 32'b000101_10011_00000_0000000000000100;     // bne $s2, reg1, 4h;               

      {InstructionMemory[24], InstructionMemory[24+1], InstructionMemory[24+2], InstructionMemory[24+3]} = 32'b001000_10011_10010_0000000000000100;    //addi $s1, $s2 ,4;
      {InstructionMemory[28], InstructionMemory[28+1], InstructionMemory[28+2], InstructionMemory[28+3]} = 32'b000010_00000_00000_0000000000000000;    // j 0;                               
//      InstructionMemory[1] = 32'b001001_10010_10011_00000_00000_000010;   //addi $s2, $s3, 2;
//      InstructionMemory[3] = 32'b000000_00010_00001_00000_00000_100000;


      internalAddress = readAddress[4:0];

      placeVal = 1;
      internalAddressINT = 0;
      for(i=0 ; i<5 ; i=i+1)
      begin
            if(internalAddress[i] == 1)
                internalAddressINT = internalAddressINT + placeVal;
            placeVal = placeVal * 2;
      end

      for(i=0 ; i<32 ; i=i+1)
      begin
             instruction[i] = InstructionMemory[internalAddressINT + i/8][i%8];        
      end
  end

endmodule