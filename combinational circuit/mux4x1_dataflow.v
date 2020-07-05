/*
	4 to 1 multiplexer using dataflow
	using conditional operatopr. conditional operator always create 2 to 1 mux
	output = conditional exp ? true_exp : false_exp ;
	
	S0  S1  Y
	0   0	A0
	0	1	A1
	1	0	A2
	1	0	A3
	
	*/
	
module mux4x1_dataflow (A0,A1,A2,A3,S0,S1,Y);

parameter width = 4;

output [width-1:0] Y;
input [width-1:0] A0;	//Inputline with 2'b00
input [width-1:0] A1;	//Inputline with 2'b01
input [width-1:0] A2;	//Inputline with 2'b10
input [width-1:0] A3;	//Inputline with 2'b11
input 			  S0;	//select line MSB
input 			  S1;	//select line LSB

 assign Y = (S0 == 0 ? (S1 == 0 ? A0 : A1 ) : (S1 == 0 ? A2 : A3)); //dataflow

/*
always @(*) begin
	assign Y = (S0 == 0 ? (S1 == 0 ? A0 : A1 ) : (S1 == 0 ? A2 : A3)); //dataflow
end
*/
endmodule