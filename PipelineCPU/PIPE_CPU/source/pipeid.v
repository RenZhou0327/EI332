module pipeid (mwreg,mrn,ern,ewreg,em2reg,mm2reg,dpc4,inst,wrn,wdi,ealu,malu,mmo,wwreg,clock,resetn,
bpc,jpc,pcsource,wpcir,dwreg,dm2reg,dwmem,daluc, daluimm,da,db,dimm,dsa,drn,dshift,djal,bubble);
//,npc,ebubble,dbubble);	// ID stage

//ID 指令译码模块。注意其中包含控制器 CU、寄存器堆、及多个多路器等。
//其中的寄存器堆，会在系统 clock 的下沿进行寄存器写入，也就是给信号从 WB 阶段
//传输过来留有半个 clock 的延迟时间，亦即确保信号稳定。
//该阶段 CU 产生的、要传播到流水线后级的信号较多。

	input [4:0] mrn, ern, wrn;
	input	mm2reg, em2reg, mwreg, ewreg, wwreg, clock, resetn;
	input [31:0] inst, wdi, ealu, malu, mmo, dpc4;
	output [31:0] bpc, dimm, jpc, da, db, dsa;
	output [1:0] pcsource;
	output wpcir, dwreg, dm2reg, dwmem, daluimm, dshift, djal, bubble;
	output [3:0] daluc;
	output [4:0] drn;
	
	wire [31:0] q1, q2, da, db;
	wire [1:0] fwda, fwdb;
	wire rsrtequ = (da == db);
	wire regrt, sext;
	wire e = sext & inst[15];
	wire [31:0] dimm = {{16{e}}, inst[15:0]};
	wire [31:0] jpc = {dpc4[31:28],inst[25:0],1'b0,1'b0};
	wire [31:0] dsa = {27'b0, inst[10:6]};
	wire [31:0] offset = {{14{e}},inst[15:0],1'b0,1'b0};
	wire [31:0] bpc = dpc4 + offset;
	
	pipe_cu cu(inst[31:26], inst[5:0], rsrtequ, dwmem, dwreg, regrt, dm2reg, daluc, dshift,
	//				opcode,		funct,	rs==rt启动直通
	daluimm, pcsource, djal, sext, wpcir, bubble, inst[25:21], inst[20:16], mrn, mm2reg, mwreg, ern, em2reg, ewreg, fwda, fwdb);//控制单元
	//																  rs,				rt	
	regfile rf(inst[25:21], inst[20:16], wdi, wrn, wwreg, clock, resetn, q1, q2);  //寄存器堆
	//					n1:rs,		n2:rt,	  d,   n,   we,   clock,  clrn,  两输出
	mux4x32 reg_da(q1, ealu, malu, mmo, fwda, da); // 四选一
	//						四个选项，			依据，结果
	mux4x32 reg_db(q2, ealu, malu, mmo, fwdb, db);
	mux2x5 reg_wn(inst[15:11], inst[20:16], regrt, drn);
	//						rd,			rt,		 依据,  结果
	
endmodule