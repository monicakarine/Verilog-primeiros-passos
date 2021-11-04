module alu
#(parameter integer WIDTH = 8)
(input [2:0] opcode,
 input wire[WIDTH-1:0] in_a, 
 input wire [WIDTH-1:0] in_b,
 output reg a_is_zero, 
 output reg [WIDTH-1:0] alu_out
); 

always @*
	begin 
		case(opcode)
			3'b000	:	alu_out = in_a;
			3'b001	: 	alu_out = in_a;
			3'b010	:	alu_out = in_a + in_b; 
			3'b011	:	alu_out = in_a & in_b;
			3'b100  :	alu_out = in_a ^ in_b;
			3'b101	:	alu_out = in_b;
			3'b111	:	alu_out = in_a;
			default :	alu_out = in_a;
		endcase
		
		if (in_a === 8'b00000000)
			a_is_zero = 1; 
		else
			a_is_zero = 0;
		
	end

endmodule 
