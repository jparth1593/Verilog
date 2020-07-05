`timescale 1ns/1ps
`include "encoder.v"

module tb;

reg [7:0] octal_in;
reg sel;
wire [2:0] binary_out;

encoder dut (.binary_out(binary_out),.octal_in(octal_in),.sel(sel));

initial begin
	$monitor("%t = input = %b,  output = %b,  sel = %b",$time,octal_in,binary_out,sel);
end

initial begin
	#2;
	sel = 0;
	#1; octal_in = 8'h01;
	#1; octal_in = 8'h02;
	#1; octal_in = 8'h04;
	#1; octal_in = 8'h08;
	#1; octal_in = 8'h10;
	#1; octal_in = 8'h20;
	#1; octal_in = 8'h40;
	#1; octal_in = 8'h80;
	
	$display("sel = 1");
	
	#5;
	sel = 1;
	octal_in = 8'h01;
	#1; octal_in = 8'h02;
	#1; octal_in = 8'h04;
	#1; octal_in = 8'h08;
	#1; octal_in = 8'h10;
	#1; octal_in = 8'h20;
	#1; octal_in = 8'h40;
	#1; octal_in = 8'h80;
	#10
	$finish;
end

endmodule