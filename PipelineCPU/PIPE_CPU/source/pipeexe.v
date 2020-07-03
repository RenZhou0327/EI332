module pipeexe(ealuc, ealuimm, ea, eb,
eimm, esa, eshift, ern0,epc4, ejal, ern, ealu);
					
	input [3:0] ealuc;
	input [31:0] ea, eb, eimm, epc4, esa;
	input [4:0] ern0;
	input ealuimm, eshift, ejal;
	output [31:0] ealu;
	output [4:0] ern;
	wire [31:0] a, b, r;
	alu alu_unit(a, b, ealuc, r);
	wire [4:0] ern = ern0 | {5{ejal}};
	mux2x32 alu_a(ea, esa, eshift, a);
	mux2x32 alu_b(eb, eimm, ealuimm, b);
	mux2x32 link(r, epc4, ejal, ealu);
	
endmodule
