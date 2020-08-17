module mul_control(done,ldA,ldA1,ldB,ldP,clrP,decB,eqz,start,clk);

output reg done,ldA,ldB,ldP,clrP,decB;
input start,clk,ldA1,eqz;

reg [2:0] state;
parameter S0 = 0 , S1 = 1, S2 = 2, S3 = 3, S4 =4;

always @(posedge clk) begin	//define the state value only in current always block

	case (state)
		S0 :  if (start) state <= S1;
		S1 :  if (ldA1) state <= S2;
		S2 :  state <= S3;
		S3 : #2 if (eqz) state <= S4;
		S4 :  state <= S4;
		default : state <= S0; 
	endcase
	
end




always @(state) begin

	case (state)
		S0 : begin #1 done = 0;ldA = 0;ldB = 0;ldP = 0;clrP = 0;decB = 0; end
		S1 : begin #1 ldA = 1; end
		S2 : begin #1 ldA = 0; ldB = 1; clrP = 1; end
		S3 : begin #1 ldB = 0; clrP = 0; ldP = 1; decB = 1; end
		S4 : begin #1 done = 1; ldP = 0; decB = 0; end
		default : begin done = 0;ldA = 0;ldB = 0;ldP = 0;clrP = 0;decB = 0; end
		
	endcase
end
endmodule