module io_output(addr, datain, write_io_enable, io_clk, out_port0, out_port1, out_port2, resetn);

	input [31:0] addr, datain;
	input write_io_enable, io_clk;
	input resetn;
	output [31:0] out_port0, out_port1, out_port2;
	
	reg [31:0] out_port0;
	reg [31:0] out_port1;
	reg [31:0] out_port2;
	
	always@(posedge io_clk or negedge resetn)
	begin
		if(resetn == 0)
		begin
			out_port0 <= 0;
			out_port1 <= 0;
			out_port2 <= 0;
		end
		else
		begin
			if(write_io_enable == 1)
			case(addr[7:2]) // 根据alu的值选择不同输出的端口
				6'b100000: out_port0 <= datain;//80h
				6'b100001: out_port1 <= datain;//84h
				6'b100010: out_port2 <= datain;//88h
			endcase
		end
	end
endmodule
