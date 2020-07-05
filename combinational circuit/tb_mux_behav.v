`timescale 1ns/1ps
`include "mux16x1_behav.v"

module tb;

reg [15:0] data_i;
reg [3:0] sel_i;
wire  out_o;

mux16x1 dut (out_o,sel_i,data_i);

initial begin
	$monitor ("%t : data = %b , sel = %d , out = %b",  $time,data_i,sel_i,out_o);
end

initial begin
	repeat (20) begin
	#3
	data_i = $random;
	sel_i = $random;
	end
	#500;
	$finish;
end

endmodule