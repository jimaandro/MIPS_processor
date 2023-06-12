`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:56:19 12/13/2021 
// Design Name: 
// Module Name:    registerfile 
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

module registerfile(
    input wire [4:0] Adr1,		//Reading only addres
    input wire [4:0] Adr2,
    input wire [4:0] Awr,     //Addres to write
    input wire [31:0] Din,		//input data
    input wire WrEn,         //Write Enable => only to write
    input wire Clk,
    output wire [31:0] Dout1, //RF_A
    output wire [31:0] Dout2 //RF_B
    );
	 
	wire wren [0:31];//write enable array
	wire decout [0:31];//decoder output
	//creation of a 5 to 32 decoder
	decoder32 dec(Awr,decout[0],decout[1],decout[2],decout[3],decout[4],decout[5],decout[6],decout[7],decout[8],decout[9],decout[10],decout[11],decout[12],decout[13],decout[14],decout[15],decout[16],decout[17],decout[18],decout[19],decout[20],decout[21],decout[22],decout[23],decout[24],decout[25],decout[26],decout[27],decout[28],decout[29],decout[30],decout[31]);
	
	//the output of decoder AND Write Enable
	assign wren[1]=decout[1]&WrEn;
	assign wren[2]=decout[2]&WrEn;
	assign wren[3]=decout[3]&WrEn;
	assign wren[4]=decout[4]&WrEn;
	assign wren[5]=decout[5]&WrEn;
	assign wren[6]=decout[6]&WrEn;
	assign wren[7]=decout[7]&WrEn;
	assign wren[8]=decout[8]&WrEn;
	assign wren[9]=decout[9]&WrEn;
	assign wren[10]=decout[10]&WrEn;
	assign wren[11]=decout[11]&WrEn;
	assign wren[12]=decout[12]&WrEn;
	assign wren[13]=decout[13]&WrEn;
	assign wren[14]=decout[14]&WrEn;
	assign wren[15]=decout[15]&WrEn;
	assign wren[16]=decout[16]&WrEn;
	assign wren[17]=decout[17]&WrEn;
	assign wren[18]=decout[18]&WrEn;
	assign wren[19]=decout[19]&WrEn;
	assign wren[20]=decout[20]&WrEn;
	assign wren[21]=decout[21]&WrEn;
	assign wren[22]=decout[22]&WrEn;
	assign wren[23]=decout[23]&WrEn;
	assign wren[24]=decout[24]&WrEn;
	assign wren[25]=decout[25]&WrEn;
	assign wren[26]=decout[26]&WrEn;
	assign wren[27]=decout[27]&WrEn;
	assign wren[28]=decout[28]&WrEn;
	assign wren[29]=decout[29]&WrEn;
	assign wren[30]=decout[30]&WrEn;
	assign wren[31]=decout[31]&WrEn;
	///////////////////////////////////////////////////
	
	wire [31:0] dout [0:31];//output data before MUXs
	//making 32 registers with register module that was created
   register re0(Clk, 1'b1, 32'd0, dout[0]);//register0 is always 0
	register re1(Clk, wren[1], Din, dout[1]);
	register re2(Clk, wren[2], Din, dout[2]);
	register re3(Clk, wren[3], Din, dout[3]);
	register re4(Clk, wren[4], Din, dout[4]);
	register re5(Clk, wren[5], Din, dout[5]);
	register re6(Clk, wren[6], Din, dout[6]);
	register re7(Clk, wren[7], Din, dout[7]);
	register re8(Clk, wren[8], Din, dout[8]);
	register re9(Clk, wren[9], Din, dout[9]);
	register re10(Clk, wren[10], Din, dout[10]);
	register re11(Clk, wren[11], Din, dout[11]);
	register re12(Clk, wren[12], Din, dout[12]);
	register re13(Clk, wren[13], Din, dout[13]);
	register re14(Clk, wren[14], Din, dout[14]);
	register re15(Clk, wren[15], Din, dout[15]);
	register re16(Clk, wren[16], Din, dout[16]);
	register re17(Clk, wren[17], Din, dout[17]);
	register re18(Clk, wren[18], Din, dout[18]);
	register re19(Clk, wren[19], Din, dout[19]);
	register re20(Clk, wren[20], Din, dout[20]);
	register re21(Clk, wren[21], Din, dout[21]);
	register re22(Clk, wren[22], Din, dout[22]);
	register re23(Clk, wren[23], Din, dout[23]);
	register re24(Clk, wren[24], Din, dout[24]);
	register re25(Clk, wren[25], Din, dout[25]);
	register re26(Clk, wren[26], Din, dout[26]);
	register re27(Clk, wren[27], Din, dout[27]);
	register re28(Clk, wren[28], Din, dout[28]);
	register re29(Clk, wren[29], Din, dout[29]);
	register re30(Clk, wren[30], Din, dout[30]);
	register re31(Clk, wren[31], Din, dout[31]);
	/////////////////////////////////////////////////////////
	//MUXs
	MUX mux1(Dout1,dout[0],dout[1],dout[2],dout[3],dout[4],dout[5],dout[6],dout[7],dout[8],dout[9],dout[10],dout[11],dout[12],dout[13],dout[14],dout[15],dout[16],dout[17],dout[18],dout[19],dout[20],dout[21],dout[22],dout[23],dout[24],dout[25],dout[26],dout[27],dout[28],dout[29],dout[30],dout[31] ,Adr1);
	MUX mux2(Dout2,dout[0],dout[1],dout[2],dout[3],dout[4],dout[5],dout[6],dout[7],dout[8],dout[9],dout[10],dout[11],dout[12],dout[13],dout[14],dout[15],dout[16],dout[17],dout[18],dout[19],dout[20],dout[21],dout[22],dout[23],dout[24],dout[25],dout[26],dout[27],dout[28],dout[29],dout[30],dout[31] ,Adr2);
	
endmodule
