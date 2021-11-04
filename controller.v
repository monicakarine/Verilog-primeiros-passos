module controller(
  input [2:0] phase, 
  input [2:0] opcode,
  input wire zero, 
  output reg sel, rd, ld_ir, inc_pc, halt, ld_pc, data_e, ld_ac, wr // write data bus to memory
); 

always @(phase, zero, opcode)
begin
sel = 0;
rd = 0;
ld_ir = 0;
inc_pc = 0;
halt = 0;
ld_pc = 0;
data_e = 0;
ld_ac = 0;
wr = 0;
		
		case (phase)
		0	: 	sel = 1;
		1       : begin
				rd = 1;
				sel = 1; 
			  end
		2, 3	: begin 
				sel = 1;
				rd = 1;
				ld_ir = 1;
			  end

		4	: begin 
				inc_pc = 1;
				if (opcode == 0)
					halt = 1;
				else 
					halt = 0; 
	
			  end

		5	: begin
				if (opcode >= 2)
					if (opcode <= 5)
						rd = 1; 
					else
						rd = 0; 
			  end

		6	:begin
				if (opcode == 1)
					if (zero == 1)
						inc_pc = 1; 
				else 
						inc_pc = 0;

				if (opcode >= 2)
					if (opcode <= 5)
						rd = 1;
					else
						rd = 0;
				else
					rd = 0;

				

				if (opcode == 7)
					ld_pc = 1; 
				else
					ld_pc = 0;
				
				if (opcode == 6) 
					data_e = 1; 
				else
					data_e = 0;
				
			  end

		7	: begin
				if (opcode >= 2)
					if (opcode <= 5)
						begin 
						rd = 1; 
						ld_ac = 1; 
						end
					else 
						begin
						rd = 0; 
						ld_ac = 0;
						end
				else 
					begin
					rd = 0; 
					ld_ac = 0;
					end

				if (opcode == 7)
					ld_pc = 1; 
				else 
					ld_pc = 0;

				if (opcode == 6) 
					begin
					data_e = 1; 
					wr = 1; 
					end
				else
					begin
					data_e = 0; 
					wr = 0; 
					end
			  end

	       default   : begin 
				sel = 0;
				rd = 0;
				ld_ir = 0;
				inc_pc = 0;
				halt = 0;
				ld_pc = 0;
				data_e = 0;
				ld_ac = 0;
				wr = 0;
			  end
	      endcase
	
end 	
endmodule
