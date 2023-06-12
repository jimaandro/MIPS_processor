`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:31:50 12/14/2021 
// Design Name: 
// Module Name:    MUX 
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
module MUX(
    output [31:0] datout,
    input [31:0] datin0,
    input [31:0] datin1,
    input [31:0] datin2,
    input [31:0] datin3,
    input [31:0] datin4,
    input [31:0] datin5,
    input [31:0] datin6,
    input [31:0] datin7,
    input [31:0] datin8,
    input [31:0] datin9,
    input [31:0] datin10,
    input [31:0] datin11,
    input [31:0] datin12,
    input [31:0] datin13,
    input [31:0] datin14,
    input [31:0] datin15,
    input [31:0] datin16,
    input [31:0] datin17,
    input [31:0] datin18,
    input [31:0] datin19,
    input [31:0] datin20,
    input [31:0] datin21,
    input [31:0] datin22,
    input [31:0] datin23,
    input [31:0] datin24,
    input [31:0] datin25,
    input [31:0] datin26,
    input [31:0] datin27,
    input [31:0] datin28,
    input [31:0] datin29,
    input [31:0] datin30,
    input [31:0] datin31,
    input [4:0] sel
    );

	assign datout = (sel==5'b00000) ? datin0 :
							(sel==5'b00001) ? datin1 :
							(sel==5'b00010) ? datin2 :
							(sel==5'b00011) ? datin3 :
							(sel==5'b00100) ? datin4 :
							(sel==5'b00101) ? datin5 :
							(sel==5'b00110) ? datin6 :
							(sel==5'b00111) ? datin7 :
							(sel==5'b01000) ? datin8 :
							(sel==5'b01001) ? datin9 :
							(sel==5'b01010) ? datin10 :
							(sel==5'b01011) ? datin11 :
							(sel==5'b01100) ? datin12 :
							(sel==5'b01101) ? datin13 :
							(sel==5'b01110) ? datin14 :
							(sel==5'b01111) ? datin15 :
							(sel==5'b10000) ? datin16 :
							(sel==5'b10001) ? datin17 :
							(sel==5'b10010) ? datin18 :
							(sel==5'b10011) ? datin19 :
							(sel==5'b10100) ? datin20 :
							(sel==5'b10101) ? datin21 :
							(sel==5'b10110) ? datin22 :
							(sel==5'b10111) ? datin23 :
							(sel==5'b11000) ? datin24 :
							(sel==5'b11001) ? datin25 :
							(sel==5'b11010) ? datin26 :
							(sel==5'b11011) ? datin27 :
							(sel==5'b11100) ? datin28 :
							(sel==5'b11101) ? datin29 :
							(sel==5'b11110) ? datin30 :
							(sel==5'b11111) ? datin31 :
							32'bX;
							
							
endmodule
