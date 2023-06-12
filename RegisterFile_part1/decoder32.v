`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:00:15 12/14/2021 
// Design Name: 
// Module Name:    decoder32 
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
module AND_5_input(output g,
	input a,
	input b,
	input c,
	input d,
	input e);
 
  and  and1(f1,a,b,c,d),
            and2(g,f1,e);
endmodule

module decoder32(
    input [4:0] Awr,
    output out0,
    output out1,
    output out2,
    output out3,
    output out4,
    output out5,
    output out6,
    output out7,
    output out8,
    output out9,
    output out10,
    output out11,
    output out12,
    output out13,
    output out14,
    output out15,
    output out16,
    output out17,
    output out18,
    output out19,
    output out20,
    output out21,
    output out22,
    output out23,
    output out24,
    output out25,
    output out26,
    output out27,
    output out28,
    output out29,
    output out30,
    output out31
    );
	
	not  Inv4(Nota, Awr[4]);
	not  Inv3(Notb, Awr[3]);
	not  Inv2(Notc, Awr[2]);
	not  Inv1(Notd, Awr[1]);
	not  Inv0(Note, Awr[0]);

	AND_5_input a0(out0,  Nota,Notb,Notc,Notd,Note); // 00000
	AND_5_input a1(out1,  Nota,Notb,Notc,Notd,Awr[0]); // 00001
	AND_5_input a2(out2,  Nota,Notb,Notc,Awr[1],Note); //00010
	AND_5_input a3(out3,  Nota,Notb,Notc,Awr[1],Awr[0]);
	AND_5_input a4(out4,  Nota,Notb,Awr[2],Notd,Note);
	AND_5_input a5(out5,  Nota,Notb,Awr[2],Notd,Awr[0]);
	AND_5_input a6(out6,  Nota,Notb,Awr[2],Awr[1],Note);
	AND_5_input a7(out7,  Nota,Notb,Awr[2],Awr[1],Awr[0]);
	AND_5_input a8(out8,    Nota,Awr[3],Notc,Notd,Note);
	AND_5_input a9(out9,    Nota,Awr[3],Notc,Notd,Awr[0]);
	AND_5_input a10(out10,  Nota,Awr[3],Notc,Awr[1],Note);
	AND_5_input a11(out11,  Nota,Awr[3],Notc,Awr[1],Awr[0]);
	AND_5_input a12(out12,  Nota,Awr[3],Awr[2],Notd,Note);
	AND_5_input a13(out13,  Nota,Awr[3],Awr[2],Notd,Awr[0]);
	AND_5_input a14(out14,  Nota,Awr[3],Awr[2],Awr[1],Note);
	AND_5_input a15(out15,  Nota,Awr[3],Awr[2],Awr[1],Awr[0]);
	AND_5_input a16(out16,  Awr[4],Notb,Notc,Notd,Note);
	AND_5_input a17(out17,  Awr[4],Notb,Notc,Notd,Awr[0]);
	AND_5_input a18(out18,  Awr[4],Notb,Notc,Awr[1],Note);
	AND_5_input a19(out19,  Awr[4],Notb,Notc,Awr[1],Awr[0]);
	AND_5_input a20(out20,  Awr[4],Notb,Awr[2],Notd,Note);
	AND_5_input a21(out21,  Awr[4],Notb,Awr[2],Notd,Awr[0]);
	AND_5_input a22(out22,  Awr[4],Notb,Awr[2],Awr[1],Note);
	AND_5_input a23(out23,  Awr[4],Notb,Awr[2],Awr[1],Awr[0]);
	AND_5_input a24(out24,  Awr[4],Awr[3],Notc,Notd,Note);
	AND_5_input a25(out25,  Awr[4],Awr[3],Notc,Notd,Awr[0]);
	AND_5_input a26(out26,  Awr[4],Awr[3],Notc,Awr[1],Note);
	AND_5_input a27(out27,  Awr[4],Awr[3],Notc,Awr[1],Awr[0]);
	AND_5_input a28(out28,  Awr[4],Awr[3],Awr[2],Notd,Note);
	AND_5_input a29(out29,  Awr[4],Awr[3],Awr[2],Notd,Awr[0]);
	AND_5_input a30(out30,  Awr[4],Awr[3],Awr[2],Awr[1],Note);
	AND_5_input a31(out31,  Awr[4],Awr[3],Awr[2],Awr[1],Awr[0]); // 11111

endmodule
