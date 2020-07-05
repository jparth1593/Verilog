/* 4 bit ripple carry counter using D FlipFlops and inverters to create togglt flipflop (T_FF) 
   first module define functionality in terms of T_FF
   secound module define T_FF using D_FF and inverters
   third module define negative edge triggered D_FF
   initiate module with inout port names*/
   
   
module ripple_carry_counter (q,clk,reset);

// define input and output port with width size
output [3:0] q;
input clk, reset;

// define the functionality of the ripple_carry_counter
// call T_FF module

T_FF tff0 (q[0],clk,reset);
T_FF tff1 (q[1],q[0],reset);
T_FF tff2 (q[2],q[1],reset);
T_FF tff3 (q[3],q[2],reset); 

endmodule

module T_FF (q,clk,reset);

input clk, reset;
output q;
wire d;

D_FF dff0(q,d,clk,reset);
not n1(d,q);

endmodule

module D_FF(q,d,clk,reset);

input d,clk,reset;
output reg q;

always @ (posedge reset or negedge clk) begin
	if (reset == 1)
		q <= 1'b0;
	else 
		q <= d;
	end
endmodule
