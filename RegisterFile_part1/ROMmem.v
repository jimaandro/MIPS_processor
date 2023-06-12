`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:23:24 12/15/2021 
// Design Name: 
// Module Name:    ROMmem 
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
module ROMmem(
		input clk,
		input [9:0] addr,
		output reg [31:0] dout
	);
	reg [31:0] ROM [1023:0];
	
	initial
	begin
	$readmemb("rom.data", ROM);
	end
	
	always @(posedge clk)
	begin
	dout <= ROM[addr];
	end

endmodule
