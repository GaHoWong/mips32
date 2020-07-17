`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/17 18:29:39
// Design Name: 
// Module Name: if_to_id
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

//��ʱ����ȡ�õ�ָ��
module if_to_id(
	input wire clk,  //ʱ���ź�
	input wire rst,  //��λ�ź�

	input wire[31:0] if_pc,
	input wire[31:0] if_inst,
	output reg[31:0] id_pc,
	output reg[31:0] id_inst  
	
);

	always @ (posedge clk) begin
		if (rst == 1'b1) begin
			id_pc <= 32'h00000000;    //��λʱ��pc=0
			id_inst <= 32'h00000000;  //��ָ��
	  end else begin
		  id_pc <= if_pc;
		  id_inst <= if_inst;
		end
	end
endmodule
