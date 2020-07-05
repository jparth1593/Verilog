/* 
	Full Adder using AND,OR and XOR gate
	full adder equation
	S = A xor B xor Cin
	Cout = (A and B) or (A and B) or (B and C)
	 
	implemented this logic in structual model
	*/

module full_adder (A,B,Cin,S,Cout);

input A;
input B;
input Cin;
output S;
output Cout;

wire w1;
wire w2;
wire w3;
wire w4;

//implement eq for S

xor G1 (w1,A,B);
xor G2 (S,Cin,w1);

// implement eq for Cout

and G3 (w2,A,B);
and G4 (w3,B,Cin);
and G5 (w4,A,Cin);
or G6 (Cout,w2,w3,w4);

endmodule

