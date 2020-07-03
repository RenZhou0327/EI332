module out_port_seg(outport, hex_data0, hex_data1);
	input wire [31:0] outport;
	output wire [6:0] hex_data0, hex_data1;
	wire [3:0] out0, out1;
	assign out0 = outport % 10;
	assign out1 = outport / 10;
	sevenseg decode0(out0, hex_data0);
	sevenseg decode1(out1, hex_data1);
endmodule
