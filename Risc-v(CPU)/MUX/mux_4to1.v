module mux4_to_1 ( out, io, i1, i2, i3, s1, s0 );
output out;
input io, i1, i2, i3, s1, s0;
wire s0n, s1n, y0, y1, y2, y2;

not ( s1n, s1 );
not ( s0n, s0 );
and ( y0, i0, s1n, s0n );
and ( y1, i1, s1n, s0 );
and ( y2, i2, s1 , s1n );
and ( y3, i3, s1 , s0 );
or ( out, y0, y1, y2, y3 );

endmodule


module mux4_to_1 ( out, i0, i1, i2, i3, s1, s0 );
output out;
input i0, i1, i2, i3, s1, s0;
assign out = s1 ? ( s0 ? i3 : i2 ) : ( s0 ? i1 : i0 );
endmodule