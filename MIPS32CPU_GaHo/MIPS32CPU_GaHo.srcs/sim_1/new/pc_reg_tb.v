`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/17 18:09:40
// Design Name: 
// Module Name: pc_reg_tb
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

module pc_reg_tb;
   reg clk;
   reg rst;
   wire[31:0] pc;
   wire ce; 
pc_reg uut(
   .clk(clk),//时钟信号
   .rst(rst),
   .ce(ce),
   .pc(pc)
);

initial 
   begin
      clk = 1'b0;
      rst = 1;
      # 10;
      clk = ~clk;
      # 10;
      clk = ~clk;
      rst = 0;
      # 10;
      forever #10 clk = ~clk;
   end  
endmodule
