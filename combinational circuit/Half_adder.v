module Half_adder (A,S,C);

// definr input output with width size
output S,C;
input [0:1] A;

xor N1 (S,A[0],A[1]);
and N2 (C,A[0],A[1]);

endmodule
