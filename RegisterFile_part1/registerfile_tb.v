`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:08:02 12/15/2021
// Design Name:   registerfile
// Module Name:   /home/jim/Project/RegisterFile_part1/registerfile_tb.v
// Project Name:  RegisterFile_part1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registerfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module registerfile_tb;

	// Inputs
	reg [4:0] Adr1;
	reg [4:0] Adr2;
	reg [4:0] Awr;
	reg [31:0] Din;
	reg WrEn;
	reg Clk;

	// Outputs
	wire [31:0] Dout1;
	wire [31:0] Dout2;

	// Instantiate the Unit Under Test (UUT)
	registerfile uut (
		.Adr1(Adr1), 
		.Adr2(Adr2), 
		.Awr(Awr), 
		.Din(Din), 
		.WrEn(WrEn), 
		.Clk(Clk), 
		.Dout1(Dout1), 
		.Dout2(Dout2)
	);

	initial begin
		// Initialize Inputs
		Adr1 = 5'b0;
		Adr2 = 5'b0;
		Awr = 5'b0;
		Din = 32'b0;
		WrEn = 1'b0;
		Clk = 1'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		Awr = 5'b00001;
		WrEn = 1'b1;
		Din = 32'b00000000000000000000000000000001;
		
		 #20;
		 
		Awr = 5'b00010;
		WrEn = 1'b1;
		Din = 32'b00000000000000000000000000000010;
		
		#20;
		
		Awr = 5'b00011;
		WrEn = 1'b0;
		Din = 32'b00000000000000000000000000000011;
		
		#20;
		Adr1 = 5'b00001;
		#20;
		Adr2 = 5'b00010;
		
		#100;
		
		//Adr2 = 5'b00011;
		
		
	end
	
	   always begin

  #10;

  Clk = ~Clk;

 end 
      
endmodule

