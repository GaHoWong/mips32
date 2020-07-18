`include "defines.v"

module pc_reg(
	input wire clk,   // ±÷”–≈∫≈
	input wire rst,   //∏¥Œª
	output reg[`w32] pc,
	output reg ce	
);
always @(posedge clk)
begin
	if (ce == `false) 
	  begin
	  pc <= 32'h00000000;
      end else 
      begin
 	  pc <= pc + 4'h4;
      end
end
always @(posedge clk)
begin
    if (rst == `true) 
    begin
        ce <= `false;
	end else 
	begin
        ce <= `true;
    end
end

endmodule