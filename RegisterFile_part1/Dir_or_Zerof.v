`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:53 01/06/2022 
// Design Name: 
// Module Name:    Dir_or_Zerof 
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
module Dir_or_Zerof(
			input wire Clk,
			input wire sel,
			input wire [31:0] Inp,
			output wire [31:0] Out
    );
	 reg [31:0] Data1;
	 assign Data1=Inp;
	 
	 reg [31:0] Data2;
	 assign Data2=Out;
	 
always @(posedge Clk)
	if(sel==1'b1) begin//direct output
		 Data2<=Data1;
	end
	else if (sel==1'b0) begin//ZeroFill(31 downto 8)& MEM[RF[rs] + SignExtend(Imm)](7 downto 0)
		 Data2<={{24'b000000000000000000000000}, {Data1[7:0]}};
	end


endmodule
