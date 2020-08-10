//detect pattern in serial bit stream "0110"

module pattern_detect(z,x,clk,rst);
output reg z;
input x;
input clk,rst;

//define states S0,S1,S2,S3, PS=Present State, NS = Next State
//reg [0:2] state;

parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3 ;

//use NS and PS to store state values

reg [0:1] PS, NS;

always @(posedge clk or posedge rst) begin
	
	if (rst) PS <= S0;
	else 	 PS <= NS;
	
	//ternary can also be used but it will give output in x,z for input x,z
	//PS = rst ? S0 : NS;
	
end

always @ (PS,x)
	case (PS)
		S0: begin
				z = x ? 0 : 0;
				NS = x ? S0 : S1 ;
			end
		
		S1: begin
				z = x ? 0 : 0;
				NS = x ? S2 : S1 ;
			end
		
		S2: begin
				z = x ? 0 : 0;
				NS = x ? S3 : S1 ;
			end
		
		S3: begin
				z = x ? 0 : 1;
				NS = x ? S0 : S1 ;
			end
		default: NS = S0;
	endcase

endmodule 