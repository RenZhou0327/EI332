module alu(a, b, aluc, s, z);
   input [31:0] a,b;
   input [3:0] aluc;
   output [31:0] s;
   output z;
   reg [31:0] s;
   reg z;
	reg [31:0] axorb;
	integer i;
   always @(a or b or aluc) 
      begin                                   // event
         casex (aluc)
				 4'b1011: 
				 begin
					axorb = a ^ b;			// 1011 先求a异或b;
					//s = axorb[0] + axorb[1] + axorb[2] + axorb[3] + axorb[4]; // 计算汉明距离
					s = 0;
					for(i = 0; i < 32; i = i + 1)
						if(axorb[i] == 1)
							s = s + 1;
				 end
             4'bx000: s = a + b;              //x000 ADD
             4'bx100: s = a - b;              //x100 SUB
             4'bx001: s = a & b;              //x001 AND
             4'bx101: s = a | b;              //x101 OR
             4'bx010: s = a ^ b;              //x010 XOR
             4'bx110: s = a << 16;            //x110 LUI: imm << 16bit             
             4'b0011: s = $unsigned(b) << a;  //0011 SLL: rd <- (rt << sa)
             4'b0111: s = $unsigned(b) >> a;  //0111 SRL: rd <- (rt >> sa) (logical)
             4'b1111: s = $signed(b) >>> a;   //1111 SRA: rd <- (rt >> sa) (arithmetic)
             default: s = 0;
         endcase
         if (s == 0)
				z = 1;
         else 
				z = 0;         
      end      
endmodule 

