`include "FIFO.v"
module tb;

parameter width = 8;
parameter depth = 16;

reg clk_i,rst_i,wr_en_i,rd_en_i;
reg [width-1 : 0] wdata_i;

wire full_o,empty_o,error_o;  //full and empty to indicate FIFO state
wire [width-1 : 0] rdata_o;

reg [width-1 : 0] mem_read [depth-1:0];
integer i;


	fifo dut(
				clk_i,			//clock input for write and read
				rst_i,			//reset 
				wr_en_i,		//write enable flag
				wdata_i,		//write data here 8bit width 
				rd_en_i,		//read enable flag
				rdata_o,		//read data here 8 bit width
				empty_o,		//FIFO empty indicator flag
				full_o,			// FIFO full indicator flag
				error_o			// Error Flag
			);

initial begin
	clk_i = 1'b0;
	rst_i = 1'b1;
	#10 rst_i = 1'b0;
end

always  #5 clk_i = ~clk_i;

initial begin
// apply the stimulus
// make fifo full
// to write data wr_en_i = 1
	for (i =0; i< depth; i = i+1) begin
		@(posedge clk_i);
		wr_en_i = 1'b1;
		wdata_i = $random;
	end
	@(posedge clk_i);
	wr_en_i = 1'b0;
	wdata_i = 0;

// read from FIFO
	for (i =0; i< depth; i = i+1) begin
			@(posedge clk_i);
			rd_en_i = 1'b1;
			mem_read[i] = rdata_o;

	end
	@(posedge clk_i);
	rd_en_i = 1'b0;

#200 $finish;
end

initial begin
	$monitor("FIFO mem bank = %p,read mem bank = %p",wdata_i,mem_read[dut.rd_ptr]);
end
endmodule