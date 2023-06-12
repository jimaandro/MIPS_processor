`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:06:54 01/03/2022 
// Design Name: 
// Module Name:    Immed_sel 
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
module Immed_sel(
     input wire [5:0] Opcode,
	  input wire [31:0] Immed_in,
	  output reg [31:0] Immed_out,
	  output reg [31:0] Immed_outPC
    );
	assign Immed_outPC = ((Opcode==6'b111111)||(Opcode==6'b000000)||(Opcode==6'b000001))? Immed_in:
							    32'b0;
   assign Immed_out  = ((Opcode==6'b111111)||(Opcode==6'b000000)||(Opcode==6'b000001))? 32'b0:
							    Immed_in;
	
endmodule

