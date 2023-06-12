`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:18:18 01/02/2022
// Design Name:   ALUSTAGE
// Module Name:   /home/jim/Project/RegisterFile_part1/ALUtest.v
// Project Name:  RegisterFile_part1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUtest;

	// Inputs
	reg [31:0] RF_A;
	reg [31:0] RF_B;
	reg [31:0] Immed;
	reg ALU_Bin_sel;
	reg [3:0] ALU_func;

	// Outputs
	wire [31:0] ALU_out;

	// Instantiate the Unit Under Test (UUT)
	ALUSTAGE uut (
		.RF_A(RF_A), 
		.RF_B(RF_B), 
		.Immed(Immed), 
		.ALU_Bin_sel(ALU_Bin_sel), 
		.ALU_func(ALU_func), 
		.ALU_out(ALU_out)
	);

initial begin
		// Initialize Inputs
		RF_A = 0;
		RF_B = 0;
		Immed = 0;
		ALU_Bin_sel = 0;
		ALU_func = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//Addition tests
		RF_A = 0;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 0;
		ALU_func = 0;
		#5;
		
		RF_A = 0;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 0;
		#5;
		
		//Subtraction tests
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 0;
		ALU_func = 1;
		#5;
		
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 1;
		#5;
		
		//AND tests
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 0;
		ALU_func = 2;
		#5;
		
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 2;
		#5;
		
		//OR tests
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 0;
		ALU_func = 3;
		#5;
		
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 3;
		#5;
		
		//NOT test
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 4;
		#5;
		
		//Arithmetic shift right test
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 8;
		#5;
		
		//Logical shift right test
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 10;
		#5;
		
		//Logical shift left test
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 9;
		#5;
		
		//Rotational shift left test
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 12;
		#5;
		
		//Rotational shift right test
		RF_A = 1;
		RF_B = 0;
		Immed = 1;
		ALU_Bin_sel = 1;
		ALU_func = 13;
	end
      
endmodule

