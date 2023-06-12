`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:19:37 12/22/2021 
// Design Name: 
// Module Name:    MUX2_1_5b 
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
module MUX2_1_5b(
    		input [4:0] data0,//rt
			input [4:0] data1,//rd
			input  select,
			output [4:0] dataout
    );
	assign dataout = (select==0) ? data0 :// RF_B_sel=0 => rt
						  (select==1) ? data1 :// RF_B_sel=1 => rd
							5'bx;

endmodule
