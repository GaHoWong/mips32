`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/17 19:29:55
// Design Name: 
// Module Name: ex
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ex(

	input wire rst,
	
	//送到执行阶段的信息
	input wire[7:0] aluop_i,
	input wire[2:0] alusel_i,
	input wire[31:0] reg1_i,
	input wire[31:0] reg2_i,
	input wire[4:0] wd_i,
	input wire wreg_i,

	
	output reg[4:0] wd_o,
	output reg  wreg_o,
	output reg[31:0] wdata_o
	
);

	reg[31:0] logicout;
	always @ (*) begin
		if(rst == 1'b1) begin
			logicout <= 32'h00000000;
		end else begin
			case (aluop_i)
				8'b00100101:			begin
					logicout <= reg1_i | reg2_i;
				end
				default:begin
					logicout <= 32'h00000000;
				end
			endcase
		end    //if
	end      //always


 always @ (*) begin
	 wd_o <= wd_i;	 	 	
	 wreg_o <= wreg_i;
	 case ( alusel_i ) 
	 	3'b001:		begin
	 		wdata_o <= logicout;
	 	end
	 	default:					begin
	 		wdata_o <= 32'h00000000;
	 	end
	 endcase
 end	

endmodule
