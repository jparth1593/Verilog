//full adder sum generation using UDP 

primitive udp_sum (sum,a,b,c);

input a,b,c;
output sum;

table
//	a b c	:	sum
	0 0 0	:	0;
	0 0 1	:	1;
	0 1 0	:	1;
	0 1 1	:	0;
	1 0 0	:	1;
	1 0 1	:	0;
	1 1 0	:	0;
	1 1 1	:	1;
	
endtable 
endprimitive


// full adder carry generation using UDP
primitive udp_cy (cout,a,b,c);

input a,b,c;
output cout;

table
//	a b c	:	carry
	0 0 ?	:	0;
	0 ? 0	:	0;
	? 0 0	:	0;
	? 1 1	:	1;
	1 ? 1	:	1;
	1 1 ?	:	1;
	
endtable 
endprimitive


// instaniating UDP'sum
// A full adder description

module full_adder (sum,cout,a,b,c);

input a,b,c;
output sum, cout;

udp_sum SUM (sum,a,b,c);
udp_cy  CY  (cout,a,b,c);

endmodule