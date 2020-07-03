module io_output_reg(addr, datain, write_io_enable, io_clk, resetn,
 out_port0, out_port1, out_port2, out_port3);

	input [31:0] addr, datain;
	input write_io_enable, io_clk;
	input resetn;
	//reset signal. if necessary,can use this signal to reset the output to 0. 
	output [31:0] out_port0, out_port1, out_port2, out_port3;

	reg [31:0] out_port0, out_port1, out_port2, out_port3;

	always @(posedge io_clk or negedge resetn)
	begin
		if(resetn == 0)
		begin
			out_port0 <= 0;
			out_port1 <= 0;
			out_port2 <= 0;
			out_port3 <= 0;
		end
		else
		begin
			if(write_io_enable == 1)
			case(addr[7:2])
				6'b100000: out_port0 <= datain;//80h
				6'b100001: out_port1 <= datain;//84h
				6'b100010: out_port2 <= datain;//88h
				6'b100011: out_port3 <= datain;//92h
			endcase
		end
	end
endmodule
	