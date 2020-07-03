module pipeir (pc4, ins, wpcir, clock, resetn, dpc4, inst, bubble);
//IF/ID 流水线寄存器模块，起承接 IF 阶段和 ID 阶段的流水任务。
//在 clock 上升沿时，将 IF 阶段需传递给 ID 阶段的信息，锁存在 IF/ID 流水线寄存器
//中，并呈现在 ID 阶段。
	input [31:0] pc4, ins;
	input wpcir, clock, resetn, bubble;
	output [31:0] dpc4, inst;
	reg    [31:0]  dpc4, inst;
	 
	always @(posedge clock or negedge resetn)
	begin
		if (resetn == 0)
		begin
			dpc4 <= 0;
			inst <= 0;  
		end
		else if(wpcir & bubble)	//流水线正常运行
		begin
			dpc4 <= pc4;  
			inst <= ins;
		end
		else if(wpcir & ~bubble)	// 出现控制冒险
		begin 
			inst <= 0;
		end		
	end	
endmodule
