`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:47:21 12/13/2021 
// Design Name: 
// Module Name:    register 
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

module register(
    input CLK,
    input WE,
    input wire [31:0] Data,
    output reg [31:0] Dout
    );
	 always @(posedge CLK)//Register will updated on each positive clock
		if (WE)//register is updated only if write is enabled
			Dout<=Data;
endmodule
