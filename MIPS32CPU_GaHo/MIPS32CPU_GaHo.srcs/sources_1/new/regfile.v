`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/17 18:35:56
// Design Name: 
// Module Name: regfile
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


module regfile(
	input wire clk,
	input wire rst,
	
	//Ð´¶Ë¿Ú
	input wire we,
	input wire[4:0] waddr,
	input wire[31:0] wdata,
	
	//¶Á¶Ë¿Ú1
	input wire re1,
	input wire[4:0] raddr1,
	output reg[31:0] rdata1,
	
	//¶Á¶Ë¿Ú2
	input wire re2,
	input wire[4:0] raddr2,
	output reg[31:0] rdata2
	
);

	reg[31:0]  regs[0:32-1];

	always @ (posedge clk) begin
		if (rst == 1'b0) begin
			if((we == 1'b1) && (waddr != 5'h0)) begin
				regs[waddr] <= wdata;
			end
		end
	end
	
	always @ (*) begin
		if(rst == 1'b1) begin
			  rdata1 <= 32'h00000000;
	  end else if(raddr1 == 5'h0) begin
	  		rdata1 <= 32'h00000000;
	  end else if((raddr1 == waddr) && (we == 1'b1) 
	  	            && (re1 == 1'b1)) begin
	  	  rdata1 <= wdata;
	  end else if(re1 == 1'b1) begin
	      rdata1 <= regs[raddr1];
	  end else begin
	      rdata1 <= 32'h00000000;
	  end
	end

	always @ (*) begin
		if(rst == 1'b1) begin
			  rdata2 <= 32'h00000000;
	  end else if(raddr2 == 5'h0) begin
	  		rdata2 <= 32'h00000000;
	  end else if((raddr2 == waddr) && (we == 1'b1) 
	  	            && (re2 == 1'b1)) begin
	  	  rdata2 <= wdata;
	  end else if(re2 == 1'b1) begin
	      rdata2 <= regs[raddr2];
	  end else begin
	      rdata2 <= 32'h00000000;
	  end
	end

endmodule
