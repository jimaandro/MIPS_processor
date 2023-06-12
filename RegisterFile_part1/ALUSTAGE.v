`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:44 01/02/2022 
// Design Name: 
// Module Name:    ALUSTAGE 
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
module ALUSTAGE(
    input [31:0] RF_A,
    input [31:0] RF_B,
    input [31:0] Immed,
    input ALU_Bin_sel,
    input [3:0] ALU_func,
    output [31:0] ALU_out
    );
reg [31:0]TEMP;
reg [31:0]TEMP2;
wire Zero;
always @(RF_B or Immed or ALU_Bin_sel) begin
	case(ALU_Bin_sel)
	1'b0: TEMP = RF_B;
	1'b1: TEMP = Immed;
	endcase
end

ALU alu_Ins(
			.A (RF_A),
			.B (TEMP),
			.Op (ALU_func),
			.Out (ALU_out),
			.Zero (Zero)
			);


endmodule
