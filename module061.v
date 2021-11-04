module exercise1( 
input a, b, c, ctrl, f,
output reg d
);
reg temp a_b, temp c_ctrl;
always @*
begin 
	temp a_b = a & b; 
	tempc_ctrl = ctrl ? 1'b0 : c;
	if (f < 4'b0110)
		d = temp_a
	else
		d = tempc_ctrl
end
endmodule
