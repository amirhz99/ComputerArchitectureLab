module fullAdder(Sum ,C_out,A , B , C_in );
	input A,B,C_in;
	output Sum,C_out;
	wire s1,s2,c1;
	
	xor (s1,A,B);
	xor (Sum,s1,C_in);
	and (c1,A,B);
	and (s2,s1,C_in);
	or (C_out,s2,c1);
endmodule

module 4bit_Adder(Sum ,C_out,A , B , C_in );
	input [3:0] A,B;
	input C_in;
	output [3:0] Sum;
	output C_out;	
	
	wire C1,C2,C3;
	
	Adder bit1 (Sum[0], C1,    A[0], B[0],C_in);
	Adder bit2 (Sum[1], C2,    A[1], B[1],C1  );
	Adder bit3 (Sum[2], C3,	   A[2], B[2],C2  );
	Adder bit4 (Sum[3], C_out, A[3], B[3],C3  );
	
	
endmodule