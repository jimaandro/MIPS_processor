`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:32:10 01/12/2022
// Design Name:   PROCESSOR
// Module Name:   /home/jim/Project/RegisterFile_part1/PROCESSOR_tb.v
// Project Name:  RegisterFile_part1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PROCESSOR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PROCESSOR_tb;

	// Inputs
	reg Clk;
	reg Resetin;

	// Outputs
	wire [31:0] RF_Ao;
	wire [31:0] RF_Bo;
	wire [31:0] MEM_out;
	wire [31:0] Instrout;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.Clk(Clk), 
		.Resetin(Resetin), 
		.RF_Ao(RF_Ao), 
		.RF_Bo(RF_Bo), 
		.MEM_out(MEM_out),
		.Instrout(Instrout)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Resetin = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Resetin = 1'b1;
		#20;
		Resetin = 1'b0;
		//#20;
		//Resetin = 1'b0;
		
	end
      always begin

  #10;

  Clk = ~Clk;
  end
  
endmodule

