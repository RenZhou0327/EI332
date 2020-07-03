module pipemem(mwmem, malu, mb, clock, mem_clock, mmo, resetn,
in_port0, in_port1, out_port0, out_port1, out_port2, out_port3, write_datamem_enable);
	input mwmem, clock, resetn;
	input [31:0] malu, mb;
	input mem_clock;
	input [31:0] in_port0, in_port1;

	output [31:0] mmo, out_port0, out_port1, out_port2, out_port3;
	//wire write_datamem_enable = mwmem;
	wire [31:0] mem_dataout, io_read_data;
	wire write_enable, write_io_enable;
	output write_datamem_enable;
	
	assign write_enable = mwmem;
	assign write_io_enable = malu[7] & write_enable;
	assign write_datamem_enable = ~malu[7] & write_enable;
	
	//sc_datamem dmem(resetn, malu, mb, mmo, mwmem, mem_clock,
	//in_port0, in_port1, out_port0, out_port1, out_port2, out_port3);
	//resetn,addr,datain,dataout,we,clock,
	//in_port0,in_port1,out_port0,out_port1,out_port2,out_port3;
	mux2x32 mem_io_dataout_mux(mem_dataout, io_read_data, malu[7], mmo);
	lpm_ram_dq_dram dram(malu[6:2], mem_clock, mb, write_datamem_enable, mem_dataout);
	io_output_reg io_output_seg(malu, mb, write_io_enable, mem_clock, resetn,
	out_port0, out_port1, out_port2, out_port3);
	io_input_reg io_input_seg(malu, mem_clock, io_read_data, in_port0, in_port1);
	
endmodule
