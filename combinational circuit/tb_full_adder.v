`timescale 1ns/1ps
//`include "full_adder.v"
`include "UDP_full_adder.v"
module tb;

reg a_i ;
reg b_i ;
reg c_i ;
wire S_o;
wire C_o;

full_adder dut (.a(a_i),.b(b_i),.c(c_i),.sum(S_o),.cout(C_o));

initial begin 
	$monitor ("%t: A = %b, B = %b, Cin = %b, Sum = %b , Cout = %b",$time,a_i,b_i,c_i,S_o,C_o);
end

initial begin
	repeat (20) begin
		#2;
		a_i = $urandom;
		b_i = $urandom;
		c_i = $urandom;
	end
end

endmodule
