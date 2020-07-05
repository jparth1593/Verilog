module encoder(binary_out,octal_in,sel);

output reg [2:0] binary_out;

input [7:0] octal_in;
input sel;

always @(sel or octal_in)
	begin
	binary_out = 3'b000;
	
		if (sel == 1) begin
			case (octal_in)
			//8'h01 : binary_out = 3'b000;
			8'h02 : binary_out = 3'b001;
			8'h04 : binary_out = 3'b010;
			8'h08 : binary_out = 3'b011;
			8'h10 : binary_out = 3'b100;
			8'h20 : binary_out = 3'b101;
			8'h40 : binary_out = 3'b110;
			8'h80 : binary_out = 3'b111;
			default : binary_out = 3'b000;
			
			endcase
		end
	
	end
endmodule