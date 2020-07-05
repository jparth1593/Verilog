`timescale 1ns/1ps
`include "cyclic_lamp.v"
module tb;

reg clk;

wire [2:0] light;

cyclic_lamp dut (.clk(clk),.light(light));

always #5 clk = ~clk;

initial begin
	clk = 1'b0;
	#100 $finish;

end

initial begin
$monitor ("%t, YGR= %b",$time,light);

end


endmodule