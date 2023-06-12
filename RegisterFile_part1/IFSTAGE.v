`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:22:48 12/16/2021 
// Design Name: 
// Module Name:    IFSTAGE 
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
module IFSTAGE(
    input wire [31:0] PC_Immed,
    input wire PC_sel,
    input wire PC_LdEn,
    input wire Reset,
    input wire Clk,
    output wire [31:0] Instr
    );
	//wires connected to PC
	wire [31:0] PCin;
	wire [31:0] PCout;
	//wires connected to MUX 2 to 1
	wire [31:0] datain0;
	wire [31:0] datain1;
		 
	wire resetin;
	assign resetin=Reset;
	 //initializing the PC
	registerPC PC(Clk,PC_LdEn,resetin,PCin,PCout);
	/////////////////
	
	/// +4 adder to PC output
	wire [31:0]adder4;
	wire [31:0]plus4;
	assign plus4 = 32'b00000000000000000000000000000100;
	assign adder4 = PCout + plus4;
	assign datain0 = adder4;//giving datain0 the right value
	
	/// PC_Immed adder to (PC output + 4)
	assign datain1 = adder4 + PC_Immed;//giving datain1 the right value
	
	
	///MUX 2 to 1	//+4 		PC_Immed
	MUX2_1 multip( datain0, datain1,PC_sel,PCin);
	
	//The ROM memory////
	//reading  only [11:2] bits from PCout 
	wire [9:0]addr10bits;
	assign addr10bits = {PCout[11:2]};
	
	//ROM
	ROMmem rom(Clk, addr10bits, Instr);
	
endmodule
