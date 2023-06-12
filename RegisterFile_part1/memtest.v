`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:22:09 01/02/2022
// Design Name:   MEMSTAGE
// Module Name:   /home/jim/Project/RegisterFile_part1/memtest.v
// Project Name:  RegisterFile_part1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MEMSTAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memtest;

// Inputs
	reg clk;
	reg we;
	reg [9:0] addr;
	reg [31:0] din;

	// Outputs
	wire [31:0] dout;

	// Instantiate the Unit Under Test (UUT)
	MEMSTAGE uut (
		.clk(clk), 
		.MEM_WrEn(we), 
		.ALU_MEM_Addr(addr), 
		.MEM_DataIn(din), 
		.MEM_DataOut(dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		we = 0;
		addr = 0;
		din = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		clk = 1;
		we = 1;
		addr = 0;
		din = 5;
		#5;
		clk = 0;
		#5;
		
		
		clk = 1;
		we = 1;
		addr = 1;
		din = 666;
		#5;
		clk = 0;
		#5;
		
		
		clk = 1;
		we = 0;
		addr = 0;
		din = 0;
		#5;
		clk = 0;
		#5;
	end
      
endmodule
