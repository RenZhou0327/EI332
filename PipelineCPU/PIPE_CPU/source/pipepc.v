module pipepc(npc, wpcir, clock, resetn, pc);
// npc是new_pc或者next_pc, wpcir是lw数据冒险标记
	input [31:0] npc;
   input clock,resetn,wpcir;
   output [31:0] pc;
   reg [31:0] pc;
   always @(posedge clock)
	begin
      if (resetn == 0) // 重置
		begin
          pc <= -4;
      end 
		else 
		if (wpcir != 0) // wpcir若为0则流水线停顿
		begin
          pc <= npc;  // 更新pc值为new pc
      end
	end
endmodule
