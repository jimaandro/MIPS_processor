`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:42 01/02/2022 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
			input wire Clk,
						
			output wire [31:0] Instrsave,//output
			output wire [31:0] RF_Asave,
			output wire [31:0] RF_Bsave,
			output wire [31:0] MEM_out,
			
			//ifstage wires
			input wire PC_sel,//+
			input wire PC_LdEn,//+
			input wire Reset,//+
			
			//decstage wires
			input wire RF_B_sel,//+
			input wire RF_WrEn,//+
		   input wire RF_WrData_sel,//+
			
			
			//alustage wires
			input wire ALU_Bin_sel,//+
			input wire [3:0] ALU_func,//+
			
			//memstage wires
			input wire MEM_WrEn,//+
			input wire MEM_out_sel,//+
			input wire RF_B2_seldir//+			
    );
	 //ifstage wires
	 //inputs
	 wire [31:0] Immed; //
    //wire PC_sel;			//outside control//////////////////////////
    //wire PC_LdEn;			//outside control//////////////////////
    //wire Reset;			//outside control///////////////////////
    //wire Clk;//universal clock  //outside control/////////////////////////
	 wire [31:0] Instr;
    
	 /////////////////
	 
IFSTAGE ifstg(Immed,PC_sel,PC_LdEn,Reset,Clk,Instr);

//register for saving Instr
wire WE;
assign WE=1'b1;
register InstrReg(Clk,WE, Instr, Instrsave);
//decstage wires
	 //inputs
    //Instr exists before
	  //wire RF_WrEn;		 //outside control/////////////////////
     wire [31:0] ALU_outsave;
     wire [31:0] MEM_out2save;
     //wire RF_WrData_sel; //outside control////////////////////
     //wire RF_B_sel;		 //outside control/////////////////
    // Clk exists 
	 
	 //outputs
     // Immed exists;
     wire [31:0] RF_A;
     wire [31:0] RF_B;
	 
DECSTAGE decstg(Instrsave ,RF_WrEn , ALU_outsave, MEM_out2save, RF_WrData_sel, RF_B_sel, Clk, Immed, RF_A, RF_B );
//Registers for RF_A RF_B
register RF_AReg(Clk,WE, RF_A, RF_Asave);
register RF_BReg(Clk,WE, RF_B, RF_Bsave);

//Registers for ALU_out MEM_out2
wire [31:0] ALU_out;
wire [31:0] MEM_out2;
register ALU_outReg(Clk,WE, ALU_out, ALU_outsave);
register MEM_out2Reg(Clk,WE, MEM_out2, MEM_out2save);
///////////////////////
//alustage wires
//inputs
	 //RF_A exists
    //RF_B exists
    //Immed exists
    //wire ALU_Bin_sel;    //outside control////////////
    //wire [3:0] ALU_func; //outside control////////////
	 
    //ALU_out exists//output

ALUSTAGE alustg(RF_Asave, RF_Bsave, Immed, ALU_Bin_sel, ALU_func, ALU_out);

//memstage wires
    //Clk exists
    //wire MEM_WrEn;	//outside control////////////////////////
	 
    wire [9:0] ALU_MEM_Addr;
	 assign ALU_MEM_Addr = {ALU_out[11:2]};//exists
	 wire [31:0] RF_B2;
    //wire [31:0] MEM_out;
	 
	MEMSTAGE memstg(Clk , MEM_WrEn, ALU_MEM_Addr, RF_B2 ,MEM_out);
	//
	//Choose betwin direct or not direct in/out
	//OUT
	Dir_or_ZeroF MemOutSelection(MEM_out_sel, MEM_out,MEM_out2);
	//IN
	Dir_or_ZeroF RFB2Selection(RF_B2_seldir, RF_B,RF_B2);
endmodule
