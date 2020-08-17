`timescale 1ns/1ps
`include "mul_control.v"
`include "mul_datapath.v"


module tb;

wire done;
reg start,clk;
reg [15:0] data;

mul_datapath dut1 (eqz,ldA1,ldA,ldB,ldP,clrP,decB,data,clk);
mul_control dut (done,ldA,ldA1,ldB,ldP,clrP,decB,eqz,start,clk);

initial begin 
	clk = 1'b0; 
	#3 start = 1'b0;
	#8 start = 1'b1;
	#300 $finish;
end

always 	#5 clk = ~clk;

initial begin
	#17 data = 17;
	#12 data = 5;

end

initial begin 
	$monitor ("%t : A = %d, P = %d, Bout = %d, done = %b",$time,dut1.x,dut1.y,dut1.Bout,done);
end
endmodule