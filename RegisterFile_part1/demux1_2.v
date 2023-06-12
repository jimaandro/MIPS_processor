`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:29 01/03/2022 
// Design Name: 
// Module Name:    demux 
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
module demux(
     input wire [5:0] Opcode,
	  input wire [31:0] Immed_in,
	  output wire [31:0] Immed_out,
	  output wire [31:0] Immed_outPC
    );
	assign Immed_out=32'b0;
	assign Immed_outPC=32'b0;
	
	wire sel;
	assign sel = ((Opcode==6'b111111)||(Opcode==6'b000000)||(Opcode==6'b000001))? 1'b1:
					1'b0;
					
	always @(Immed_out, Immed_outPC, sel) begin
    case (sel)
        1'b1 : begin Immed_outPC = Immed_in; Immed_out=32'b0; end
        1'b0 : begin Immed_out = Immed_in; Immed_outPC = 32'b0;   end
    endcase   
end
endmodule
