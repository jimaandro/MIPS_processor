`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:57:36 01/06/2022 
// Design Name: 
// Module Name:    PROCESSOR 
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
module PROCESSOR(
			input wire Clk,
			input wire Resetin,
			output wire [31:0] RF_Ao,
			output wire [31:0] RF_Bo,
			output wire [31:0] MEM_out,
			output wire [31:0] Instrout
    );
	 
	
	wire [31:0] Instr;
	wire [31:0] RF_A;
	wire [31:0] RF_B;
	
	
	//ifstage wires
	wire PC_sel;
	wire PC_LdEn;
	wire Reset;
	
	//decstage wires
	wire RF_B_sel;
	wire  RF_WrEn;
	wire  RF_WrData_sel;
		
	//alustage wires
	wire ALU_Bin_sel;
	wire [3:0] ALU_func;
	
	//memstage wires
	wire MEM_WrEn;
	wire MEM_out_sel;
	wire RF_B2_seldir;
	
	datapath DATA_PATH_STAGE(Clk, Instr, RF_A, RF_B, MEM_out, PC_sel, PC_LdEn, Reset, RF_B_sel, RF_WrEn, RF_WrData_sel, ALU_Bin_sel, ALU_func, MEM_WrEn, MEM_out_sel, RF_B2_seldir);
	CONTROL  control_stage(Clk, Instr, Resetin, RF_A, RF_B,PC_sel, PC_LdEn, Reset, RF_B_sel, RF_WrEn, RF_WrData_sel, ALU_Bin_sel, ALU_func, MEM_WrEn, MEM_out_sel, RF_B2_seldir);
	
	assign RF_Ao=RF_A;
	assign RF_Bo=RF_B;
	assign Instrout=Instr;

endmodule
