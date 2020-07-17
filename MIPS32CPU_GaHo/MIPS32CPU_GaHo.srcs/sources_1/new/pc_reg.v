`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/17 18:03:11
// Design Name: 
// Module Name: pc_reg
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


module pc_reg(

	input wire clk,   //输入时钟
	input wire rst,   //复位信号
	output reg[31:0] pc,  
	output reg ce
	
);

	always @(posedge clk) begin
		if (ce == 1'b0) begin
			pc <= 32'h00000000;
		end else begin
	 		pc <= pc + 4'h4;
		end
	end
	
	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			ce <= 1'b0;
		end else begin
			ce <= 1'b1;
		end
	end
endmodule
