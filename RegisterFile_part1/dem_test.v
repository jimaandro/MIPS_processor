`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:16:22 01/03/2022
// Design Name:   Immed_sel
// Module Name:   /home/jim/Project/RegisterFile_part1/dem_test.v
// Project Name:  RegisterFile_part1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Immed_sel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dem_test;

	// Inputs
	reg [5:0] Opcode;
	reg [31:0] Immed_in;

	// Outputs
	wire [31:0] Immed_out;
	wire [31:0] Immed_outPC;

	// Instantiate the Unit Under Test (UUT)
	Immed_sel uut (
		.Opcode(Opcode), 
		.Immed_in(Immed_in), 
		.Immed_out(Immed_out), 
		.Immed_outPC(Immed_outPC)
	);

	initial begin
		// Initialize Inputs
		Opcode = 6'b111111;
		Immed_in = 32'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		Opcode = 6'b000000;
		Immed_in = 32'b00000000000000000000000000011101;
		/*
		#20
		
		Opcode = 6'b111111;
		Immed_in = 32'b00000000000000000000000111111111;
		
		#20
		
		Opcode = 6'b000001;
		Immed_in = 32'b11111000000000000000000111111111;
		
		#20
		
		Opcode = 6'b110001;
		Immed_in = 32'b11111111111111111111111111111111;
		
		#20
		
		Opcode = 6'b111110;
		Immed_in = 32'b11111111111111111111111111111111;
		*/
	end
      
endmodule

