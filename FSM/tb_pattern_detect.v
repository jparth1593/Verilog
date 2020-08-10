`timescale 1ns/1ps
`include "pattern_detect_0110.v"

module tb;

reg x , clk, rst;
wire z;

pattern_detect dut (z,x,clk,rst);

initial begin
	clk = 1'b1;
	rst = 1'b1;
	#13 rst = 1'b0;
	//#200 $finish;
end

always #5 clk = ~clk;


//
initial begin

 #12 x = 0; #10 x = 0; #10 x = 1; #10 x = 1;
 #10 x = 0; #10 x = 1; #10 x = 0; #10 x = 0;
 #10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
 #10 x = 1; #10 x = 1; #10 x = 0; #10 x = 0;
 #10 x = 1; #10 x = 1; #10 x = 1; #10 x = 1;
 #20 $finish;
end

endmodule