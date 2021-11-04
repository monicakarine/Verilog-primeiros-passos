module register
#(parameter integer WIDTH = 8)
(input [WIDTH-1:0] data_in, 
 input load, clk, rst,
 output reg[WIDTH-1:0] data_out
);

always @(posedge clk)
	begin
	#10 data_out <= data_in;
		if(rst == 1)
			data_out <= 8'b00000000;
	end
endmodule 
