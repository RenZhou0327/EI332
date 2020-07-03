module sc_datamem(addr, datain, dataout, we, clock, mem_clk, dmem_clk, resetn,
						out_port0, out_port1, out_port2, in_port0, in_port1, mem_dataout, io_read_data);

						// 这里的addr是上一层的aluout, 因为要从datamem中取数了，上一层的aluout必然是+-之后的数据地址
   input [31:0] addr;
   input [31:0] datain; // register中取出的数，要放到datamem中的
   input [31:0] in_port0, in_port1;
   input we, clock, mem_clk, resetn;
	
   output [31:0] dataout;
   output dmem_clk;
   output [31:0] out_port0, out_port1, out_port2;
	output [31:0] mem_dataout, io_read_data;
	
   wire dmem_clk;    
   wire write_enable;
	wire [31:0] dataout;
	wire [31:0] mem_dataout;
	wire write_data_enable;
	wire write_io_enable;
	
   assign write_enable = we & (~clock);
	assign dmem_clk = mem_clk & (~clock); 
	assign write_data_enable = write_enable & (~addr[7]); 
   assign write_io_enable = write_enable & addr[7];
	mux2x32 io_data_mux(mem_dataout, io_read_data, addr[7], dataout);
   lpm_ram_dq_dram dram(addr[6:2], dmem_clk, datain, write_data_enable, mem_dataout);
	io_output io_output_reg(addr, datain, write_io_enable, dmem_clk, out_port0, out_port1, out_port2, resetn); // register中的数据送到IO端口
	io_input io_input_reg(addr, dmem_clk, io_read_data, in_port0, in_port1); // IO端口的数据输入到register
endmodule 