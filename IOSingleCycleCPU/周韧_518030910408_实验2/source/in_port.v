module in_port(sw0, sw1, sw2, sw3, sw4, res);
	input sw0, sw1, sw2, sw3, sw4;
	output wire [31:0] res;
	assign res = {{27{1'b0}}, sw4, sw3, sw2, sw1, sw0};
endmodule
