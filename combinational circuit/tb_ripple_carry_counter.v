`timescale 1ns/1ps
`include "Ripple_carry_counter.v"

module tb;

reg clk;
reg reset;
wire [3:0] q;

ripple_carry_counter dut(q,clk,reset);
//initial clock
initial 
begin
	clk = 1'b0; //set clock to 0
forever
	#5 clk = ~clk; // toggle clock at every 5 unit timescale
end

initial begin
	$monitor($time,"Output q = %d",q);
end

// control the rese tsignal to test functionality of ripple counter
initial
begin
	/*reset = 0;
	#30 reset = 1; 	//set initial resetvalue to 1
	#20;
	reset = 0;
	#1000;
	$finish;*/
	reset = 1'b1;
	#15 reset = 1'b0;
	#180 reset = 1'b1;
	#10 reset = 1'b0;
	#20 $finish;
end

endmodule