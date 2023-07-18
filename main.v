`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:13 07/13/2022 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main(
	 input clk, 
	 input [19:0] data,
	 output reg [7:0] result_Ra,
	 output reg [7:0] result_Rb,
	 output reg [7:0] result_Rc,
	 output reg [7:0] result_Rd,
	 output reg [15:0] result_bFloat,
	 output reg SF,
	 output reg ZF
    );
	 
	 reg [7:0] Ra;
	 reg [7:0] Rb;
	 reg [7:0] Rc;
	 reg [7:0] Rd;

	 reg [15:0]result_mul;
	 
	 parameter Ra_flag = 8'b00000001;
	 parameter Rb_flag = 8'b00000010;
	 parameter Rc_flag = 8'b00000100;
	 parameter Rd_flag = 8'b00001000;
	 
	 parameter save_op = 4'b0001;
	 parameter save_reg = 4'b0010;
	 parameter sum_op = 4'b0011;
	 parameter sum_reg = 4'b0100;
	 parameter sub_op = 4'b0101;
	 parameter sub_reg = 4'b0110;
	 parameter mul_op = 4'b0111;
	 parameter mul_reg = 4'b1000;
	 parameter shift_r = 4'b1011;
	 parameter shift_l = 4'b1100;
	 parameter bFloat = 4'b1101;
	 
	 integer i;
	 
	 reg [12:0]floating_point_3digit;
	 reg [15:0] binary_floating_point;
	 reg [7:0] exp_value; 
	 reg [7:0] decimal_point;
	 reg condition;
	 
	 always @ (posedge clk) begin
	    case(data[19:16])
			  save_op: begin
				   case(data[15:8])
					    Ra_flag: begin
						     Ra = data[7:0];
							  if (Ra[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Ra == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rb_flag: begin
						     Rb = data[7:0];
							  if (Rb[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rb == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rc_flag: begin
						     Rc = data[7:0];
							  if (Rc[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rc == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rd_flag: begin
						     Rd = data[7:0];
							  if (Rd[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rd == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
					endcase
			  end
			  
			  save_reg: begin
				   case(data[15:8])
						 Ra_flag: begin
						     case(data[7:0])
							      Rb_flag: begin
									    Ra = Rb;
									end
									Rc_flag: begin
									    Ra = Rc;
									end
									Rd_flag: begin
									    Ra = Rd;
									end
							  endcase
							  if (Ra[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Ra == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rb_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rb = Ra;
									end
									Rc_flag: begin
									    Rb = Rc;
									end
									Rd_flag: begin
									    Rb = Rd;
									end
							  endcase
							  if (Rb[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rb == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rc_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rc = Ra;
									end
									Rb_flag: begin
									    Rc = Rb;
									end
									Rd_flag: begin
									    Rc = Rd;
									end
							  endcase
							  if (Rc[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rc == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rd_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rd = Ra;
									end
									Rb_flag: begin
									    Rd = Rb;
									end
									Rc_flag: begin
									    Rd = Rc;
									end
							  endcase
							  if (Rd[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rd == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
					endcase
			  end
			  
			  sum_op: begin
			      case(data[15:8])
						 Ra_flag: begin
						     Ra = Ra + data[7:0];
							  if (Ra[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Ra == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rb_flag: begin
						     Rb = Rb + data[7:0];
							  if (Rb[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rb == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rc_flag: begin
						     Rc = Rc + data[7:0];
							  if (Rc[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rc == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rd_flag: begin
						     Rd = Rd + data[7:0];
							  if (Rd[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rd == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
					endcase
			  end
			  
			  sum_reg: begin
			      case(data[15:8])
						 Ra_flag: begin
						     case(data[7:0])
									Ra_flag: begin
										 Ra = Ra + Ra;
									end
							      Rb_flag: begin
									    Ra = Ra + Rb;
									end
									Rc_flag: begin
									    Ra = Ra + Rc;
									end
									Rd_flag: begin
									    Ra = Ra + Rd;
									end
							  endcase
							  if (Ra[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Ra == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rb_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rb = Rb + Ra;
									end
									Rc_flag: begin
									    Rb = Rb + Rc;
									end
									Rd_flag: begin
									    Rb = Rb + Rd;
									end
							  endcase
							  if (Rb[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rb == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rc_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rc = Rc + Ra;
									end
									Rb_flag: begin
									    Rc = Rc + Rb;
									end
									Rd_flag: begin
									    Rc = Rc + Rd;
									end
							  endcase
							  if (Rc[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rc == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rd_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rd = Rd + Ra;
									end
									Rb_flag: begin
									    Rd = Rd + Rb;
									end
									Rc_flag: begin
									    Rd = Rd + Rc;
									end
							  endcase
							  if (Rd[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rd == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
					endcase
			  end
			  
			  sub_op: begin
			      case(data[15:8])
						 Ra_flag: begin
						     Ra = Ra - data[7:0];
							  if (Ra[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Ra == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rb_flag: begin
						     Rb = Rb - data[7:0];
							  if (Rb[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rb == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rc_flag: begin
						     Rc = Rc - data[7:0];
							  if (Rc[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rc == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rd_flag: begin
						     Rd = Rd - data[7:0];
							  if (Rd[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rd == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
					endcase
			  end
			  
			  sub_reg: begin
			      case(data[15:8])
						 Ra_flag: begin
						     case(data[7:0])
							      Rb_flag: begin
									    Ra = Ra - Rb;
									end
									Rc_flag: begin
									    Ra = Ra - Rc;
									end
									Rd_flag: begin
									    Ra = Ra - Rd;
									end
							  endcase
							  if (Ra[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Ra == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rb_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rb = Rb - Ra;
									end
									Rc_flag: begin
									    Rb = Rb - Rc;
									end
									Rd_flag: begin
									    Rb = Rb - Rd;
									end
							  endcase
							  if (Rb[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rb == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rc_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rc = Rc - Ra;
									end
									Rb_flag: begin
									    Rc = Rc - Rb;
									end
									Rd_flag: begin
									    Rc = Rc - Rd;
									end
							  endcase
							  if (Rc[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rc == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rd_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    Rd = Rd - Ra;
									end
									Rb_flag: begin
									    Rd = Rd - Rb;
									end
									Rc_flag: begin
									    Rd = Rd - Rc;
									end
							  endcase
							  if (Rd[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rd == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
					endcase
			  end
			  
			  mul_op: begin
			      case(data[15:8])
						 Ra_flag: begin
						     result_mul = Ra * data[7:0];
						 end
						 Rb_flag: begin
						     result_mul = Rb * data[7:0];
						 end
						 Rc_flag: begin
						     result_mul = Rc * data[7:0];
						 end
						 Rd_flag: begin
						     result_mul = Rd * data[7:0];
						 end
					endcase
					Ra = result_mul[7:0];
					Rd = result_mul[15:8];
					if (Rd[7] == 1)
						 SF = 1;
					else
						 SF = 0;
					if (Rd == 0 && Ra == 0)
						 ZF = 1;
					else
						 ZF = 0;
			  end
			  
			  mul_reg: begin
			      case(data[15:8])
						 Ra_flag: begin
						     case(data[7:0])
							      Rb_flag: begin
									    result_mul = Ra * Rb;
									end
									Rc_flag: begin
									    result_mul = Ra * Rc;
									end
									Rd_flag: begin
									    result_mul = Ra * Rd;
									end
							  endcase
						 end
						 Rb_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    result_mul = Rb * Ra;
									end
									Rc_flag: begin
									    result_mul = Rb * Rc;
									end
									Rd_flag: begin
									    result_mul = Rb * Rd;
									end
							  endcase
						 end
						 Rc_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    result_mul = Rc * Ra;
									end
									Rb_flag: begin
									    result_mul = Rc * Rb;
									end
									Rd_flag: begin
									    result_mul = Rc * Rd;
									end
							  endcase
						 end
						 Rd_flag: begin
						     case(data[7:0])
							      Ra_flag: begin
									    result_mul = Rd * Ra;
									end
									Rb_flag: begin
									    result_mul = Rd * Rb;
									end
									Rc_flag: begin
									    result_mul = Rd * Rc;
									end
							  endcase
						 end
					endcase
					Ra = result_mul[7:0];
					Rd = result_mul[15:8];
					if (Rd[7] == 1)
						 SF = 1;
					else
						 SF = 0;
					if (Rd == 0 && Ra == 0)
						 ZF = 1;
					else
						 ZF = 0;
			  end
			  
			  shift_r: begin
			      case(data[15:8])
						 Ra_flag: begin
						     for (i=0;i<data[7:0];i = i+1)
							      Ra = Ra/2;
							  if (Ra[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Ra == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rb_flag: begin
						     for (i=0;i<data[7:0];i = i+1)
							      Rb = Rb/2;
							  if (Rb[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rb == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rc_flag: begin
						     for (i=0;i<data[7:0];i = i+1)
							      Rc = Rc/2;
							  if (Rc[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rc == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rd_flag: begin
						     for (i=0;i<data[7:0];i = i+1)
							      Rd = Rd/2;
							  if (Rd[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rd == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
					endcase
			  end
			  
			  shift_l: begin
			      case(data[15:8])
						 Ra_flag: begin
						     for (i=0;i<data[7:0];i = i+1)
							      Ra = Ra*2;
							  if (Ra[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Ra == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rb_flag: begin
						     for (i=0;i<data[7:0];i = i+1)
							      Rb = Rb*2;
							  if (Rb[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rb == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rc_flag: begin
						     for (i=0;i<data[7:0];i = i+1)
							      Rc = Rc*2;
							  if (Rc[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rc == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
						 Rd_flag: begin
						     for (i=0;i<data[7:0];i = i+1)
							      Rd = Rd*2;
							  if (Rd[7] == 1)
									SF = 1;
							  else
									SF = 0;
							  if (Rd == 0)
									ZF = 1;
							  else
									ZF = 0;
						 end
					endcase
			  end
			  
			  bFloat: begin
			      Rb[6:0] = 0;
					binary_floating_point = 0;
					exp_value = 0;
					Rc = 0;
					decimal_point = data[15:8];
					if(data[7:0] < 10)//beshe 3 ragham
						floating_point_3digit = data[7:0] * 100;
					else if(data[7:0] < 100)
						floating_point_3digit = data[7:0] * 10;
					else
						floating_point_3digit = data[7:0];

					for(i = 0; i < 16; i = i + 1) begin//floating point to binary   *=2
						floating_point_3digit = floating_point_3digit * 2;				
						if (floating_point_3digit >= 1000) begin
							binary_floating_point[15 - i] = 1;
							floating_point_3digit = floating_point_3digit - 1000;
						end
						else
							binary_floating_point[15 - i] = 0;
					end
						
						
					SF = 0;
					if(decimal_point[7]) begin
						SF = 1;
						decimal_point = ~decimal_point + 1;
					end
					
					exp_value = -1;// tashkhise tavan
					for(i = 0; i < 8; i = i + 1) //ghesmate sahih
						if(decimal_point[i]) 
							exp_value = i;
						
					condition = 1;
					if(exp_value[7])
						for(i = 0; i < 8; i = i + 1)
							if(binary_floating_point[15 - i] == 0 & condition) //akharin 1 ashari
								exp_value = -1 * i - 2;
							else
								condition = 0;
								
						
					Rc = 127 + exp_value;//exp
					
					case(exp_value)// exp manfi o mosbat
						8'b11111001: Rb[6 : 0] = binary_floating_point[8:2];
							
						8'b11111010: Rb[6 : 0] = binary_floating_point[9:3];
						
						8'b11111011: Rb[6 : 0] = binary_floating_point[10:4];
							
						8'b11111100: Rb[6 : 0] = binary_floating_point[11:5];
							
						8'b11111101: Rb[6 : 0] = binary_floating_point[12:6];
							
						8'b11111110: Rb[6 : 0] = binary_floating_point[13:7];
							
						8'b11111111: Rb[6 : 0] = binary_floating_point[14:8];
							
						0: begin 
							Rb[6 : 0] = binary_floating_point[15 : 9];
						end
						1: begin 
							Rb[6 : 6] = decimal_point[0:0]; 
							Rb[5 : 0] = binary_floating_point[15 : 10];
						end
						2: begin 
							Rb[6 : 5] = decimal_point[1:0]; 
							Rb[4 : 0] = binary_floating_point[15 : 11];
						end
						3: begin 
							Rb[6 : 4] = decimal_point[2:0]; 
							Rb[3 : 0] = binary_floating_point[15 : 12];
						end
						4: begin 
							Rb[6 : 3] = decimal_point[3:0]; 
							Rb[2 : 0] = binary_floating_point[15 : 13];
						end
						5: begin 
							Rb[6 : 2] = decimal_point[4:0]; 
							Rb[1 : 0] = binary_floating_point[15 : 14];
						end
						6: begin 
							Rb[6 : 1] = decimal_point[5:0]; 
							Rb[0 : 0] = binary_floating_point[15 : 15];
						end
					endcase
						
					if(decimal_point == 0 && data[7:0] == 0)begin //zero flag
						Rb[6:0] = 0;
						Rc = 0;
						ZF = 1;
					end
					else
						ZF = 0;
					Rb[7] = SF;
					result_bFloat[15] = SF;
					result_bFloat[14:7] = Rc;
					result_bFloat[6:0] = Rb[6:0];
			  end
			  default: begin
					result_Ra = 8'bX;
					result_Rb = 8'bX;
					result_Rc = 8'bX;
					result_Rd = 8'bX;
					result_bFloat = 16'bX;
					SF = 1'bX;
					ZF = 1'bX;
			  end
		 endcase
		 result_Ra = Ra;
		 result_Rb = Rb;
		 result_Rc = Rc;
		 result_Rd = Rd;
	 end
	 


endmodule
