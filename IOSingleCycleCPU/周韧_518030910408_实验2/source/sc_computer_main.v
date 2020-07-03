/////////////////////////////////////////////////////////////
//                                                         //
// School of Software of SJTU                              //
//                                                         //
/////////////////////////////////////////////////////////////

module sc_computer_main(resetn, clock, mem_clk, pc, inst, aluout, memout, imem_clk, dmem_clk, 
						  out_port0, out_port1, out_port2, in_port0, in_port1, mem_dataout, io_read_data);
   
   input resetn, clock, mem_clk;
	input [31:0] in_port0, in_port1;
   output [31:0] pc, inst, aluout, memout;
   output imem_clk, dmem_clk;
	output [31:0] out_port0, out_port1, out_port2;
	output [31:0] mem_dataout, io_read_data;
   wire [31:0] data;
   wire wmem; // all these "wire"s are used to connect or interface the cpu,dmem,imem and so on.
   sc_cpu cpu (clock, resetn, inst, memout, pc, wmem, aluout, data); // CPU module. aluout是两个输入数的计算结果，data是register中取出的数
   sc_instmem imem (pc, inst, clock, mem_clk, imem_clk);                  // instruction memory. pc对应instmen里面的addr, inst对应取出的指令
   sc_datamem dmem (aluout, data, memout, wmem, clock, mem_clk, dmem_clk, resetn,
	out_port0, out_port1, out_port2, in_port0, in_port1, mem_dataout, io_read_data); // data memory.

endmodule



