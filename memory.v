module memory
#(parameter integer AWIDTH=5,
  parameter integer DWIDTH=8)
( input clk, wr,rd,
  input [AWIDTH-1:0] addr,
  inout [DWIDTH-1:0] data
);
reg [DWIDTH-1:0] data_out;
reg [DWIDTH-1:0] mem [31:0]; //the memory array: 32 8-bit bytes

assign data = rd ? data_out : 8'bz;
always @(posedge clk) //write 
	begin
		if (!rd & wr)  //if write is enable, put the data into buffer
			mem[addr] <= data;
		else //if read is enable, get data from
			data_out <= mem[addr];
		
	end
endmodule
