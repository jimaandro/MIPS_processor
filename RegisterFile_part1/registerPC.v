`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:12 12/16/2021 
// Design Name: 
// Module Name:    registerPC 
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
module registerPC(
    input CLK,
    input WE,
	 input reset,
    input wire [31:0] Data,
    output reg [31:0] Dout
    );
	 wire resetin;
	 assign resetin=reset;
	 always @(posedge CLK)//Register will updated on each positive clock
		if (WE& ~resetin)//register is updated only if write is enabled
			Dout<=Data;
		else if (resetin) begin
			Dout<=32'b0;//register reset
		end
		
endmodule
