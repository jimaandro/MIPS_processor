`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:53:07 12/16/2021 
// Design Name: 
// Module Name:    MUX2_1 
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
module MUX2_1(
			input [31:0] data0,//ALU_out
			input [31:0] data1,//MEM_out
			input  select,
			output [31:0] dataout
    );
	assign dataout = (select==0) ? data0 ://ALU_out
						  (select==1) ? data1 ://MEM_out
							32'bx;
endmodule
