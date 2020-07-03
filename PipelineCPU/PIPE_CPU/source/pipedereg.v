module pipedereg (dwreg, dm2reg, dwmem, daluc, daluimm, da, db,
dimm, dsa, drn, dshift, djal, dpc4, clock, resetn, ewreg, em2reg,
ewmem, ealuc, ealuimm, ea, eb, eimm, esa, ern0, eshift, ejal, epc4);
// ID/EXE 流水线寄存器
//ID/EXE 流水线寄存器模块，起承接 ID 阶段和 EXE 阶段的流水任务。
//在 clock 上升沿时，将 ID 阶段需传递给 EXE 阶段的信息，锁存在 ID/EXE 流水线
//寄存器中，并呈现在 EXE 阶段。

	input dwreg, dm2reg, dwmem, daluimm, dshift, djal, clock, resetn;
	input [3:0] daluc;
	input [31:0] dimm, da, db, dpc4, dsa;
	input [4:0] drn;

	output ewreg, em2reg, ewmem, ealuimm, eshift, ejal; 
	output [3:0]  ealuc;
	output [31:0] eimm, ea, eb, epc4, esa;
	output [4:0]  ern0;
	reg ewreg, em2reg, ewmem, ealuimm, eshift, ejal; 
	reg [3:0] ealuc;
	reg [31:0] eimm, ea, eb, epc4, esa;
	reg [4:0] ern0;

	always @( posedge clock or negedge resetn)
	begin
		if (resetn == 0)  //清零
		begin
			ewreg <= 0;
			em2reg <= 0;
			ewmem <= 0;
			ealuimm <= 0;
			eshift <= 0;
			ejal <= 0;
			ealuc <= 0;
			eimm <= 0;
			ea <= 0;
			eb <= 0;
			epc4 <= 0;
			ern0 <= 0;
			esa <= 0;
		end
		else
		begin  
			ewreg <= dwreg;
			em2reg <= dm2reg;
			ewmem <= dwmem;
			ealuimm <= daluimm;
			eshift <= dshift;
			ejal <= djal;
			ealuc <= daluc;
			eimm <= dimm;
			ea <= da;
			eb <= db;
			epc4 <= dpc4;
			ern0 <= drn;
			esa <= dsa;
		end
	end
endmodule
