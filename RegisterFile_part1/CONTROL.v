`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:07 01/03/2022 
// Design Name: 
// Module Name:    CONTROL 
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
module CONTROL(
		input wire Clk,
		input wire [31:0] Instr,
		input wire Resetin,
		input wire [31:0] RF_A,
		input wire [31:0] RF_B,
		
		//ifstage wires
		output reg PC_sel,
		output reg PC_LdEn,
		output wire Reset,
		
		//decstage wires
		output reg RF_B_sel,
		output reg  RF_WrEn,
		output reg  RF_WrData_sel,
		
		//alustage wires
		output reg ALU_Bin_sel,
		output reg [3:0] ALU_func,
		
		//memstage wires
		output reg MEM_WrEn,
		output reg MEM_out_sel,
		output reg RF_B2_seldir
    );
assign Reset=Resetin;

wire [5:0] Opcode;//Opcode bits 26-31
assign Opcode = {Instr[31:26]};

//ALU MEM and DECSTAGE control wires
  always @(posedge Clk)
    if(Reset==1'b1)begin
			RF_B_sel<=1'b0;
			RF_WrEn<=1'b0;
			RF_WrData_sel<=1'b0;
		
		//alustage wires
			ALU_Bin_sel<=1'b0;
			ALU_func<=4'b0000;
		
		//memstage wires
			MEM_WrEn<=1'b0;
			MEM_out_sel<=1'b0;
			RF_B2_seldir<=1'b0;
			//#20;
			PC_sel<=1'b0;		// read from nect instr
			//#150;
			PC_LdEn<=1'b1; // read next insrt
			//#20;
			PC_LdEn<=1'b0;// stop read next insrt
	 end
  //ALU part
	else if((Opcode==6'b100000) || (Opcode==6'b111000) || (Opcode==6'b111001) || (Opcode==6'b110000) || (Opcode==6'b110010) || (Opcode==6'b110011) || (Opcode==6'b111111) || (Opcode==6'b000000) || (Opcode==6'b000001) || (Opcode==6'b000011) || (Opcode==6'b000111) || (Opcode==6'b001111) || (Opcode==6'b011111))begin
		PC_LdEn<=1'b0;//stop reading instructions
		
		if (Opcode==6'b100000) begin//ALU instr => we choose rt =>RF_B_sel=0
			RF_B_sel=1'b0;					/////////////
			
			//ALU part///////////////////
			//ALU instr=> there is func
			ALU_Bin_sel=1'b0;//ALUbin =0 => we choose RF_B
			ALU_func <= {Instr[3:0]};//function
			#20;
			///////////////////////////////
			RF_WrData_sel=1'b0;    //ALU_out for data input
			#20;
			RF_WrEn=1'b1;			//Write to RF
			#20;
			RF_WrEn=1'b0;        //Not Write to RF
			#20;
			PC_sel<=1'b0;		// read from nect instr
			#20;
			PC_LdEn<=1'b1; // read next insrt
			#20;
			PC_LdEn<=1'b0;// stop read next insrt
			#150;
		end
		///////NOT ALU instr
		//we choose Immed in ALU
		// li, lui, addi, andi, ori
		else if ((Opcode==6'b111000)||(Opcode==6'b111001) ||(Opcode==6'b110000) ||(Opcode==6'b110010) ||(Opcode==6'b110011)) begin///to do
			//alu PART/////////////////////////////////////
			
			ALU_Bin_sel=1'b1;//ALUbin =1 => we choose Immed
			//Alu func select
			//li lui addi
			if((Opcode==6'b111000)||(Opcode==6'b111001) ||(Opcode==6'b110000)) begin
				//we choose add (rs = 0) or it's addi operation
				ALU_func<= {4'b0000};
			end
			//andi
			else if (Opcode==6'b110010) begin
				ALU_func<= {4'b0010};
			end
			//ori
			else if (Opcode==6'b110011) begin
				ALU_func<= {4'b0011};
			end
			
			#20;
			/////////////////////////
			RF_WrData_sel=1'b0;    //ALU_out for data input
			#20;
			RF_WrEn=1'b1;			//Write to RF
			#20;
			RF_WrEn=1'b0;        //Not Write to RF
			
			#20;
			PC_sel<=1'b0;		// read from nect instr
			#20;
			PC_LdEn<=1'b1; // read next insrt
			#20;
			PC_LdEn<=1'b0;// stop read next insrt
			#150;
		end
		//lb lw
		else if ((Opcode==6'b000011) ||(Opcode==6'b001111))begin
		//For input ADDRESS
			//first in ALU rs + Immed
			//we choose Immed
			ALU_Bin_sel=1'b1;//ALUbin =1 => we choose Immed
			ALU_func<= {4'b0000};//we choose add
			#20;
			MEM_WrEn=1'b0;// MEM is read only
			#20;
			//after MEM_out is MEM[RF[rs] + SignExtend(Imm)]
			//in datapath we choose direct connect to DECSTAGE or  
			//ZeroFill(31 downto 8)& MEM[RF[rs] + SignExtend(Imm)](7 downto 0)
		//For output DATA
			if (Opcode==6'b000011) begin
				MEM_out_sel=1'b0;//0 => second option not direct connect
			end
			else begin
				MEM_out_sel=1'b1;//1 => first option direct connect
			end
			#20;
			RF_WrData_sel=1'b1;    //we choose MEM_out for data input in RF
			#20;
			RF_WrEn=1'b1;			//Write to RF
			#20;
			RF_WrEn=1'b0;        //Not Write to RF
			
			#20;
			PC_sel<=1'b0;		// read from nect instr
			#20;
			PC_LdEn<=1'b1; // read next insrt
			#20;
			PC_LdEn<=1'b0;// stop read next insrt
			#150;
		end
		//sb sw
		else if ((Opcode==6'b000111) || (Opcode==6'b011111)) begin
		//For input DATA
			//first in DEC we choose RF_B = rd
			RF_B_sel=1'b1;					/////////////
			//#20;
			//we choose
			//direct connect or ZeroFill(31 downto 8) & RF[rd] (7 downto 0)
			//so RF_B2_seldir = 1 or 0
			if (Opcode==6'b000111) begin
				RF_B2_seldir=1'b0; //ZeroFill(31 downto 8) & RF[rd] (7 downto 0)
			end
			else begin
				RF_B2_seldir=1'b1; //direct connect
			end
			
			//NOW RF_B is RF[rd] or ZeroFill(31 downto 8) & RF[rd] (7 downto 0)
			#20;
		//For input ADDRESS
			//in ALU rs + Immed
			//we choose Immed
			ALU_Bin_sel=1'b1;//ALUbin =1 => we choose Immed
			ALU_func<= {4'b0000};//we choose add
			
			#20;
			MEM_WrEn=1'b1;//MEM is write only
			//MEM[RF[rs] + SignExtend(Imm)]= RF[rd] or ZeroFill(31 downto 8) & RF[rd] (7 downto 0)
			#20;
			MEM_WrEn=1'b0;//read only
			
			#20;
			PC_sel<=1'b0;		// read from nect instr
			#20;
			PC_LdEn<=1'b1; // read next insrt
			#20;
			PC_LdEn<=1'b0;// stop read next insrt
			#150;
		end
		//IFSTAGE
		//b beq bne + nop {32'b00000000000000000000000000000000}
		else if ((Opcode==6'b111111) || (Opcode==6'b000000) || (Opcode==6'b000001))begin
			//first nop + beq
			if(Opcode==6'b000000) begin
			  if(Instr==32'b00000000000000000000000000000000) begin//if it is nop
				MEM_WrEn=1'b0;//do not write anything
				RF_WrEn=1'b0; 
				
				#20;
				PC_sel<=1'b0;		// read from nect instr
				#20;
				PC_LdEn<=1'b1; // read next insrt
				#20;
				PC_LdEn<=1'b0;// stop read next insrt
				#150;
			  end
			  else begin//else it is beq
					//we need RF_A and RF_B=rd (RF_B_sel=1'b1)
					RF_B_sel=1'b1;
					#40;
					if (RF_A==RF_B)begin
						PC_sel<=1'b1;		// read from PC_immed => 1
						#20;
						PC_LdEn<=1'b1; // read next insrt
						#20;
						PC_LdEn<=1'b0;// stop read next insrt
						#150;
					end
					else begin
					   PC_sel<=1'b0;		// read from nect instr
						#20;
						PC_LdEn<=1'b1; // read next insrt
						#20;
						PC_LdEn<=1'b0;// stop read next insrt
						#150;
					end
			  end
			  //end of 000000
			end
			//
			else if(Opcode==6'b111111) begin//it is b
				PC_sel<=1'b1;		// read from PC_immed => 1
			   #20;
				PC_LdEn<=1'b1; // read next insrt
				#20;
				PC_LdEn<=1'b0;// stop read next insrt
				#150;
			end
			else begin//else it is bnq
				//we need RF_A and RF_B=rd (RF_B_sel=1'b1)
					RF_B_sel=1'b1;
					#20;
					if (RF_A!=RF_B)begin
						PC_sel<=1'b1;		// read from PC_immed => 1
						#20;
						PC_LdEn<=1'b1; // read next insrt
						#20;
						PC_LdEn<=1'b0;// stop read next insrt
						#150;
					end
					else begin
					   PC_sel<=1'b0;		// read from nect instr
						#20;
						PC_LdEn<=1'b1; // read next insrt
						#20;
						PC_LdEn<=1'b0;// stop read next insrt
						#150;
					end
			end
		end//end of branch instr
		//PC_LdEn<=1'b1; // read next insrt
		//#2
	end
/////////////////////////////////////////////////
		
endmodule
