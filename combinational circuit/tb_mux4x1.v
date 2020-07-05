`timescale 1ns/1ps
`include "mux4x1_dataflow.v"

module tb;

parameter width = 4;


reg [width-1:0] A0_i;
reg [width-1:0] A1_i;
reg [width-1:0] A2_i;
reg [width-1:0] A3_i;
reg 			S0_i;
reg 			S1_i;
wire [width-1:0] Y_o;


mux4x1_dataflow dut (A0_i,A1_i,A2_i,A3_i,S0_i,S1_i,Y_o);

initial begin 
	 $monitor("%t : A0 = %d,A1 = %d,A2 = %d,A3 = %d, S0 = %b,S1 = %b, Y = %d",$time,A0_i,A1_i,A2_i,A3_i,S0_i,S1_i,Y_o);
end

initial begin
	repeat (20) begin
	#2
	{A0_i,A1_i,A2_i,A3_i} = $random;
	{S0_i,S1_i} = $random;
	end
	#500;
	$finish;
end

endmodule
