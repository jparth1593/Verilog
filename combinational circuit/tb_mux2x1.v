`timescale 1ns/1ps
`include "mux2x1_dataflow.v"

module tb;

wire Y_o;
reg A_i;
reg B_i;
reg Sel_i;

mux_2_1_dataflow dut (.A(A_i),.B(B_i),.Sel(Sel_i),.Y(Y_o));

initial begin 
	$monitor("%t : A = %b, B = %b, Sel = %b, Y = %b",$time,A_i,B_i,Sel_i,Y_o);
end

initial begin
	repeat (10) begin
	#2
	A_i = $random;
	B_i = $random;
	Sel_i = $random;
	end
end

endmodule
