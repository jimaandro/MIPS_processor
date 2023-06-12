`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:35:17 12/22/2021 
// Design Name: 
// Module Name:    Imm_conv_16_32 
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
module Imm_conv_16_32(
    input wire [5:0] Opcode,
    input wire [15:0] Immed_in,
    output wire [31:0] Immed_out
    );
	 wire [31:0] pre_Immed_out;
	 
assign pre_Immed_out = ((Opcode==6'b111000)||(Opcode==6'b110000)||(Opcode==6'b000011)||(Opcode==6'b000111)||(Opcode==6'b001111)||(Opcode==6'b011111)||(Opcode==6'b111111)||(Opcode==6'b000000)||(Opcode==6'b000001)) ? {{16{Immed_in[15]}}, Immed_in} : //signed extend SignExtend(Imm)
						     ((Opcode==6'b110010)||(Opcode==6'b110011)) ? {16'b0000000000000000, Immed_in} :  //zero fill  
							  ((Opcode==6'b111001)) ? {Immed_in<<16} :  //Imm << 16 (zero-fill)
							  32'bx;
							  
assign Immed_out =     ((Opcode==6'b111000)||(Opcode==6'b110000)||(Opcode==6'b000011)||(Opcode==6'b000111)||(Opcode==6'b001111)||(Opcode==6'b011111)) ? pre_Immed_out : //copy 
						     ((Opcode==6'b110010)||(Opcode==6'b110011)) ? pre_Immed_out :  //copy  
							  ((Opcode==6'b111001)) ? pre_Immed_out :  //copy
							  ((Opcode==6'b111111)||(Opcode==6'b000000)||(Opcode==6'b000001))? {pre_Immed_out<<2}://create SignExtend(Imm) << 2
							  32'bx;
endmodule
