`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:14 12/23/2021 
// Design Name: 
// Module Name:    DECSTAGE 
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
module DECSTAGE(
        input wire [31:0] Instr,
    input wire RF_WrEn,
    input wire [31:0] ALU_out,
    input wire [31:0] MEM_out,
    input wire RF_WrData_sel,
    input wire RF_B_sel,
    input wire Clk,
    output wire [31:0] Immed,
    output wire [31:0] RF_A,
    output wire [31:0] RF_B
    );
//wires for the registerfile
wire [4:0] readre2;

wire [31:0] Writedat;

//Instr parts
wire [4:0] Instr_part1;//rt bits 11-15
assign Instr_part1 = {Instr[15:11]};
wire [4:0] Instr_part2;//rd bits 16-20
assign Instr_part2 = {Instr[20:16]};
wire [4:0] Instr_part3;//rs bits 21-25
assign Instr_part3 = {Instr[25:21]}; //it is readre1

/////////////////////////////////////
//for Immed
wire [15:0] Instr_part4;//16 bits of Immediate
assign Instr_part4 = {Instr[15:0]};
//opcode
wire [5:0] Opcode;//Opcode bits 26-31
assign Opcode = {Instr[31:26]};
//16 to 32 bit converter
Imm_conv_16_32 converter(Opcode,Instr_part4,Immed);

//////////////////////////////////////
//creating the mux 2 to 1
//select data in
MUX2_1 mult_input(ALU_out,MEM_out,RF_WrData_sel,Writedat);//32 bit mulpiplexer for input data
///
MUX2_1_5b multi_addr(Instr_part1,Instr_part2,RF_B_sel, readre2);//5 bit multiplexer for address input
							//rt bits //rd bits
//creating registers file
registerfile registers(Instr_part3,readre2,Instr_part2,Writedat,RF_WrEn,Clk,RF_A,RF_B);
endmodule
