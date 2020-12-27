module RegisterFile(readReg1, readReg2, writeReg, writeData, readData1, readData2, RegWrite);
     input [4:0]readReg1, readReg2, writeReg;
     input [31:0]writeData;
     input RegWrite;
     output [31:0]readData1, readData2;
     reg [31:0]readData1, readData2;

     reg [31:0]RegMemory[0:31];

     integer placeVal, i, j, writeRegINT=0, readReg1INT=0, readReg2INT=0;

     initial
     begin
       for(i=0 ; i<32 ; i=i+1)
       begin
              for(j=0 ; j<32 ; j= j+1)
                RegMemory[i][j] = 1'b0;
       end
     end

     always@ (RegWrite or readReg1 or readReg2 or writeReg or writeData)
     begin

        if(RegWrite == 1)
        begin

          placeVal = 1;
          readReg1INT=0;
          readReg2INT=0;
          for(i=0 ; i<5 ; i=i+1)
          begin
               if(readReg1[i] == 1)
                  readReg1INT = readReg1INT + placeVal;

               if(readReg2[i] == 1)
                  readReg2INT = readReg2INT + placeVal;

               placeVal = placeVal * 2;
          end

          for(i=0 ; i<32 ; i=i+1)
          begin
              readData1[i] = RegMemory[readReg1INT][i];
              readData2[i] = RegMemory[readReg2INT][i];
          end

          //binary to decimal address translation.
          placeVal = 1;
          writeRegINT=0;
          for(i=0 ; i<5 ; i=i+1)
          begin
               if(writeReg[i] == 1)
                  writeRegINT = writeRegINT + placeVal;
               placeVal = placeVal * 2;
          end
          $display("before writing %d at %d", writeData, writeRegINT);
          for(i=0 ; i<32 ; i=i+1)
          begin
                RegMemory[writeRegINT][i] = writeData[i];
          end
          $display("after writing %d at %d", writeData, writeRegINT);
        end
        if(RegWrite == 0)
        begin
        //binary to decimal address translation.
          placeVal = 1;
          readReg1INT=0;
          readReg2INT=0;
          for(i=0 ; i<5 ; i=i+1)
          begin
               if(readReg1[i] == 1)
                  readReg1INT = readReg1INT + placeVal;
               if(readReg2[i] == 1)
                  readReg2INT = readReg2INT + placeVal;
               placeVal = placeVal * 2;
          end
          for(i=0 ; i<32 ; i=i+1)
          begin
              readData1[i] = RegMemory[readReg1INT][i];
              readData2[i] = RegMemory[readReg2INT][i];
          end
        end
     end

endmodule