
module mul_datapath(eqz,ldA1,ldA,ldB,ldP,clrP,decB,data_in,clk);

input [15:0] data_in;
input ldA,ldB,ldP,decB,clrP,clk;
output ldA1,eqz;

reg [15:0] bus;
wire [15:0] x,y,z,Bout;

// assign data_in to bus
always @ (data_in) begin

assign bus = data_in;
end

// define modules
PIPO1 A  (x,ldA1,bus,ldA,clk);  //register A
PIPO2 P  (y,z,ldP,clrP,clk);  //PIPO with clear flag
ADDR add (z,x,y,clk);
CNTR  B  (Bout,bus,ldB,decB,clk); //counter for B
COMP com (eqz,Bout);  //compare Bout value to zero

endmodule

module PIPO1(x,ldA1,data,ld,clk);
output reg [15:0] x;
output reg ldA1;
input [15:0] data;
input ld,clk;

always @(data) begin
	if (ld) begin 
		x <= data;
		ldA1 = 1;
	end
end
endmodule


module PIPO2(y,data,ld,clr,clk);
output reg [15:0] y;
input [15:0] data;
input ld,clr,clk;

always @(posedge clk) begin
	if (clr) y <= 16'b0;
	else if (ld) y <= data;
end
endmodule


module ADDR(z,x,y,clk);
output reg [15:0] z;
input [15:0] x,y;
input clk;

always @(*) begin
	assign z = x + y;
end
endmodule


module CNTR(Bout,data,ld,dec,clk);
output reg [15:0] Bout;
input [15:0] data;
input ld,dec,clk;

always @(posedge clk) begin
	if (ld) Bout = data;
	else if (dec) Bout = Bout - 1;
end
endmodule

module COMP(eqz,Bout);
input [15:0] Bout;
output eqz;

assign eqz = (Bout == 0);  //can also use reduction operator Nor eqz = ~|Bout

endmodule










