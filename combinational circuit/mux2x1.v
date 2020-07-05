/*
	2 to 1 multiplexer using AND, OR & NOT gate
	output Y= (A and ~Sel) or (Sel and B)
	number of gate 4 */
	
module mux_2_1 (A,B,Sel,Y);

output Y;
input A;
input B;
input Sel;


wire w1,w2,w3,w4;

not G1 (w1,Sel);
and G2 (w2,w1,A);
and G3 (w3,Sel,B);
or G4 (Y,w2,w3);

endmodule