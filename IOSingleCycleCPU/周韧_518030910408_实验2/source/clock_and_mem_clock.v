module clock_and_mem_clock(reset, clk, clock_out);
	input reset, clk;
	output clock_out;
	reg clock_out;
	
	initial
	begin
		clock_out = 0; //起始置为低电平
	end
	
	always@(posedge clk)
	begin
		if(~reset)
			clock_out <= 0;  // reset低电平，clock_out置0
			clock_out <= ~clock_out; // clock_out 在 clk上升沿取反
	end
endmodule
