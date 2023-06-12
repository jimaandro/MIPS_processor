`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:39:30 01/12/2022
// Design Name:   CONTROL
// Module Name:   /home/jim/Project/RegisterFile_part1/CONTROL_tb.v
// Project Name:  RegisterFile_part1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CONTROL
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CONTROL_tb;

	// Inputs
	reg Clk;
	reg [31:0] Instr;
	reg Resetin;
	reg [31:0] RF_A;
	reg [31:0] RF_B;

	// Outputs
	wire PC_sel;
	wire PC_LdEn;
	wire Reset;
	wire RF_B_sel;
	wire RF_WrEn;
	wire RF_WrData_sel;
	wire ALU_Bin_sel;
	wire [3:0] ALU_func;
	wire MEM_WrEn;
	wire MEM_out_sel;
	wire RF_B2_seldir;

	// Instantiate the Unit Under Test (UUT)
	CONTROL uut (
		.Clk(Clk), 
		.Instr(Instr), 
		.Resetin(Resetin), 
		.RF_A(RF_A), 
		.RF_B(RF_B), 
		.PC_sel(PC_sel), 
		.PC_LdEn(PC_LdEn), 
		.Reset(Reset), 
		.RF_B_sel(RF_B_sel), 
		.RF_WrEn(RF_WrEn), 
		.RF_WrData_sel(RF_WrData_sel), 
		.ALU_Bin_sel(ALU_Bin_sel), 
		.ALU_func(ALU_func), 
		.MEM_WrEn(MEM_WrEn), 
		.MEM_out_sel(MEM_out_sel), 
		.RF_B2_seldir(RF_B2_seldir)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Instr = 32'b00000000000000000000000000000000;
		Resetin = 1'b1;
		RF_A = 32'b00000000000000000000000000000000;
		RF_B = 32'b00000000000000000000000000000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Resetin = 1'b1;
		#20;
		Resetin = 1'b0;
		#20;
		//////
		//sub
		Instr = 32'b10000000110001110010100000110001;
		#100;
		//add
		Instr = 32'b10000000010001100001000000110000;
		//#50;
	end
	always begin

  #10;

  Clk = ~Clk;
  end
      
endmodule

