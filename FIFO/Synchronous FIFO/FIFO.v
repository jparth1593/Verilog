/* simple FIFO design with pointer design 
	golden rules for FIFO 
	1) never write on full FIFO
	2) never read from Empty FIFO
*/


module fifo(
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

parameter width = 8;
parameter depth = 16;

input clk_i,rst_i,wr_en_i,rd_en_i;
input [width-1 : 0] wdata_i;

output reg full_o,empty_o,error_o;  //full and empty to indicate FIFO state
output reg [width-1 : 0] rdata_o;

//memory assigned for FIFO to hold data

reg [width -1 : 0] mem [depth - 1 : 0];

// internal variables

integer i;
reg [3 : 0] wr_ptr, rd_ptr;
reg wr_toggle_f, rd_toggle_f;

//FIFO will operate @ every posedge of clock
always @(posedge clk_i or posedge rst_i) begin
	if (rst_i) begin			//set all reg values to rst values
		empty_o = 1'b1;		//all flags are Active low so Empty = 1 
		full_o = 1'b0;
		error_o = 1'b0;
		rdata_o = 0;
		wr_ptr = 4'b0000;
		rd_ptr = 4'b0000;
		wr_toggle_f = 1'b0;
		rd_toggle_f = 1'b0;
		for (i = 0; i < depth; i=i+1) begin
			mem[i] = 0;
		end
	end
	else begin				
		if (wr_en_i) begin				//write logic
			if (full_o) begin
				$display("Error: Writing on full FIFO");
				error_o = 1'b1;
			end
			else begin
				mem[wr_ptr] = wdata_i;
				if (wr_ptr == depth-1) begin		
					//full_o = 1'b1;
					wr_toggle_f = ~wr_toggle_f;
					wr_ptr = 4'b0000;
				end
				else if (wr_ptr < depth-1) begin
					wr_ptr = wr_ptr + 1;
				end
			end
		end
		if (rd_en_i) begin			//read logic
			if (empty_o) begin
				$display("Error: Reading from Empty FIFO");
				error_o = 1'b1;
			end
			else begin
				rdata_o = mem[rd_ptr];
				if (rd_ptr == depth-1) begin		
					//empty_o = 1'b1;
					rd_toggle_f = ~rd_toggle_f;
					rd_ptr = 4'b0000;
				end
				else if (rd_ptr < depth-1) begin
					rd_ptr = rd_ptr + 1;
				end
			end
		end
	end
end

//generating full and empty conditions
always @(wr_ptr or rd_ptr) begin		
//empty conditions
	if ((wr_ptr == rd_ptr) && (wr_toggle_f == rd_toggle_f)) begin
		empty_o = 1'b1;
		full_o = 1'b0;
	end
//full conditions
	else if ((wr_ptr == rd_ptr) && (wr_toggle_f != rd_toggle_f)) begin
		empty_o = 1'b0;
		full_o = 1'b1;
	end
	else begin
		empty_o = 1'b0;
		full_o = 1'b0;
	end
end



endmodule