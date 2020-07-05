module cyclic_lamp(clk,light);

input clk;
output reg [2:0] light;
reg [0:1] state;

parameter s0 = 0 , s1 = 1, s2 = 2;
parameter red = 3'b001, green = 3'b010, yellow = 3'b100;

/*
always @(posedge clk)
	case (state)
		
		s0 : begin
				light <= green; 
				state <= s1;
			end
		s1 : begin
				light <= yellow; 
				state <= s2;
			end
		s2 : begin
				light <= red; 
				state <= s0;
			end
		default : begin
				light <= red; 
				state <= s0;
			end
		
				
		
	endcase*/
	
//use two always block to reduce required FF

always @(posedge clk)
	case (state)
		s0 : state <= s1;
		s1 : state <= s2;
		s2 : state <= s0;
		default : state <= s0;

endcase

always @(state)
	case (state)
		s0 : light = red;
		s1 : light = green;
		s2 : light = yellow;
		default : light = red;

endcase

endmodule