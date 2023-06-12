`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:59 01/02/2022 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] Op,
    output reg [31:0] Out,
    output reg Zero
    );

reg [31:0] TEMP; 
always @(A or B or Op) begin
	case(Op)
	4'b0000: TEMP = (A + B);
	4'b0001: TEMP = (A - B);
	4'b0010: TEMP = (A & B);
	4'b0011: TEMP = (A | B);
	4'b0100: TEMP = ~A;
	4'b1000: TEMP = {A[31], A[31:1]};
	4'b1010: TEMP = (A >> 1);
	4'b1001: TEMP = (A << 1);
	4'b1100: TEMP = {A[30:0], A[31]};
	4'b1101: TEMP = {A[0], A[31:1]};
	endcase
	Out <= TEMP;
	Zero <= ~( |TEMP);
end
endmodule
