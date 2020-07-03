module pipeif(pcsource, pc, bpc, da, jpc, npc, pc4, ins, mem_clock);
// pcsource选择pc的来源,da是从寄存器中取出的pc值
	input [1:0] pcsource;
	input mem_clock;
	input [31:0] pc, bpc, jpc, da;
	output [31:0] npc, pc4, ins;
	
	wire [31:0] npc, pc4, ins;
	assign pc4 = pc + 4;
	
	mux4x32 nextpc( pc4, bpc, da, jpc, pcsource, npc); // 下一个pc值
	lpm_rom_irom irom(pc[7:2], mem_clock, ins);
	
endmodule
