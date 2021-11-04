module multiplexor #(parameter WIDTH=5) (sel, in0, in1, mux_out);
input sel;
input [WIDTH-1:0] in0, in1;
output [WIDTH-1:0] mux_out;
reg [WIDTH-1:0] mux_out;

always @(in0,in1, sel)
	if (sel == 0)
		mux_out=in0;
	else 
		mux_out=in1;
endmodule
/*module multiplexor #(parameter WIDTH=5) (
input wire sel,
input wire [WIDTH-1:0] in0, in1,
output reg [WIDTH-1:0] mux_out
);

As a module item after the port list as in this example:
module multiplexor (sel, in0, in1, mux_out);
parameter WIDTH=5;
input sel;
input [WIDTH-1:0] in0, in1;
output [WIDTH-1:0] mux_out;
reg [WIDTH-1:0] mux_out;*/
