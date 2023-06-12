`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:28:00 12/17/2021
// Design Name:   IFSTAGE
// Module Name:   /home/jim/Project/RegisterFile_part1/IFSTAGE_tb.v
// Project Name:  RegisterFile_part1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IFSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IFSTAGE_tb;

	// Inputs
	reg [31:0] PC_Immed;
	reg PC_sel;
	reg PC_LdEn;
	reg Reset;
	reg Clk;

	// Outputs
	wire [31:0] Instr;

	// Instantiate the Unit Under Test (UUT)
	IFSTAGE uut (
		.PC_Immed(PC_Immed), 
		.PC_sel(PC_sel), 
		.PC_LdEn(PC_LdEn), 
		.Reset(Reset), 
		.Clk(Clk), 
		.Instr(Instr)
	);

	initial begin
		// Initialize Inputs
		PC_Immed = 32'b0;
		PC_sel = 0;
		PC_LdEn = 0;
		Reset = 0;
		Clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Reset=1;
		#20;
		
		Reset=0;
		PC_Immed=32'b00000000000000000000000000000010;
		PC_sel = 0;
		PC_LdEn = 1;
		//#20;
		//Reset = 1;
		#20;
		Reset = 0;
		PC_Immed=32'b00000000000000000000000000011101;//29
		//PC_LdEn = 1;
		//PC_sel = 1;
		#100
		PC_sel = 0;
		
		
	end
       always begin

  #10;

  Clk = ~Clk;

 end 
 
endmodule

