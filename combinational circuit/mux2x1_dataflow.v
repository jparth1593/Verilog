/*
	2 to 1 multiplexer using dataflow
	using conditional operatopr. conditional operator always create 2 to 1 mux
	output = conditional exp ? true_exp : false_exp ;
	*/
	
module mux_2_1_dataflow (A,B,Sel,Y);

output Y;
input A;
input B;
input Sel;

assign Y = (Sel ? B : A ); //dataflow

// assign Y = (Sel == 0 ? A : B ); //other way for conditional operator

endmodule