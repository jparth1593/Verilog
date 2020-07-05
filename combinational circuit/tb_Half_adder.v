`timescale 1ns/1ps
`include "Half_adder.v"
module tb;

// initiate inout ports for the test bench
reg [0:1] A_x;
wire s_p;
wire c_q;

//port connections can be done in 3 ways
//1. named connection
// Half_adder dut (.A(A_x),.S(s_p),.C(c_q));
//2. connection by position => prone to mistakes
//Half_adder dut(A_x,s_p,c_q);  //port connections
//3. Default connection
//Half_adder dut(.*);

//Half_adder dut (.A(A_x),.S(s_p),.C(c_q));
Half_adder dut(A_x,s_p,c_q);

// give multiple inputs values to test design

initial begin
	repeat(10) begin
		#2;
		A_x = $random;
	end
end

//add monitoring values
//$monitor prints only once in a timestep

initial begin
	$monitor ("%t : A = %b, sum =%b ,carry =%b", $time, A_x,s_p,c_q);
end

endmodule