`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:20:31 01/02/2022 
// Design Name: 
// Module Name:    MEMSTAGE 
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
module MEMSTAGE(
    input clk,
    input MEM_WrEn,
    input [9:0] ALU_MEM_Addr,
    input [31:0] MEM_DataIn,
    output reg [31:0] MEM_DataOut
    );
reg [31:0] RAM [1023:0];
always @(posedge clk)
	begin
		if(MEM_WrEn)
	RAM[ALU_MEM_Addr] = MEM_DataIn;
		else
	MEM_DataOut = RAM[ALU_MEM_Addr];
end

endmodule
