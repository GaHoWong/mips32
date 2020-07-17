`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/17 18:44:29
// Design Name: 
// Module Name: id
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


module id(

	input wire										rst,
	input wire[31:0]			pc_i,
	input wire[31:0]          inst_i,

	input wire[31:0]           reg1_data_i,
	input wire[31:0]           reg2_data_i,

	//送到regfile的信息
	output reg                    reg1_read_o,
	output reg                    reg2_read_o,     
	output reg[4:0]       reg1_addr_o,
	output reg[4:0]       reg2_addr_o, 	      
	
	//送到执行阶段的信息
	output reg[7:0]         aluop_o,
	output reg[2:0]        alusel_o,
	output reg[31:0]           reg1_o,
	output reg[31:0]           reg2_o,
	output reg[4:0]       wd_o,
	output reg                    wreg_o
);

  wire[5:0] op = inst_i[31:26];
  wire[4:0] op2 = inst_i[10:6];
  wire[5:0] op3 = inst_i[5:0];
  wire[4:0] op4 = inst_i[20:16];
  reg[31:0]	imm;
  reg instvalid;
  
 
	always @ (*) begin	
		if (rst == 1'b1) begin
			aluop_o <= 8'b00000000;
			alusel_o <= 3'b000;
			wd_o <= 5'b00000;
			wreg_o <= 1'b0;
			instvalid <= 1'b0;
			reg1_read_o <= 1'b0;
			reg2_read_o <= 1'b0;
			reg1_addr_o <= 5'b00000;
			reg2_addr_o <= 5'b00000;
			imm <= 32'h0;			
	  end else begin
			aluop_o <= 8'b00000000;
			alusel_o <= 3'b000;
			wd_o <= inst_i[15:11];
			wreg_o <= 1'b0;
			instvalid <= 1'b1;	   
			reg1_read_o <= 1'b0;
			reg2_read_o <= 1'b0;
			reg1_addr_o <= inst_i[25:21];
			reg2_addr_o <= inst_i[20:16];		
			imm <= 32'h00000000;			
		  case (op)
		  	6'b001101:begin            //ORI指令
		  		wreg_o <= 1'b1;		aluop_o <= 8'b00100101;
		  		alusel_o <= 3'b001; reg1_read_o <= 1'b1;	reg2_read_o <= 1'b0;	  	
					imm <= {16'h0, inst_i[15:0]};		wd_o <= inst_i[20:16];
					instvalid <= 1'b0;	
		  	end 							 
		    default:			begin
		    end
		  endcase		  //case op			
		end       //if
	end         //always
	

	always @ (*) begin
		if(rst == 1'b1) begin
			reg1_o <= 32'h00000000;
	  end else if(reg1_read_o == 1'b1) begin
	  	reg1_o <= reg1_data_i;
	  end else if(reg1_read_o == 1'b0) begin
	  	reg1_o <= imm;
	  end else begin
	    reg1_o <= 32'h00000000;
	  end
	end
	
	always @ (*) begin
		if(rst == 1'b1) begin
			reg2_o <= 32'h00000000;
	  end else if(reg2_read_o == 1'b1) begin
	  	reg2_o <= reg2_data_i;
	  end else if(reg2_read_o == 1'b0) begin
	  	reg2_o <= imm;
	  end else begin
	    reg2_o <= 32'h00000000;
	  end
	end

endmodule