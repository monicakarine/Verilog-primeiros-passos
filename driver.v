module driver
#(parameter integer WIDTH = 8)
(input wire [WIDTH-1:0] data_in, 
 input wire data_en, 
 output reg [WIDTH-1:0] data_out); 

always @(data_in, data_en)
	if (data_en == 0)
		data_out = 8'hz;
	else
		data_out = data_in;

endmodule 
