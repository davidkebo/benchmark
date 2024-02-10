/****************************************************************************
 *                                                                          *
 *  VERILOG HIGH-LEVEL DESCRIPTION OF THE TI 74L85 CIRCUIT                  *
 *                                                                          *
 *  Function: Four-Bit Magnitude Comarator                                  *
 *                                                                          *
 *  Written by: Mark C. Hansen                                              *
 *                                                                          *
 *  Last modified: Dec 20, 1997                                             *
 *                                                                          *
 ****************************************************************************/

module Circuit74L85 (ALBi, AGBi, AEBi, A, B, ALBo, AGBo, AEBo);

  input[3:0]    A, B;
  input	        ALBi, AGBi, AEBi;

  output        ALBo, AGBo, AEBo;
	
  TopLevel74L85 Ckt74L85 (ALBi, AGBi, AEBi, A, B, ALBo, AGBo, AEBo);

endmodule /* Circuit74L85 */

/*************************************************************************/

module TopLevel74L85 (ALBi, AGBi, AEBi, A, B, ALBo, AGBo, AEBo);

  input[3:0]    A, B;
  input	        ALBi, AGBi, AEBi;
  output        ALBo, AGBo, AEBo;
  wire[3:0]     G1, G2, P;

  GPmodule GPmod0(A,B,G1,G2,P);
  CLAmodule ALBmod1(G1,P,ALBi,ALBo);
  CLAmodule AGBmod2(G2,P,AGBi,AGBo);
  EQmodule EQmod3(AEBi,P,AEBo);

endmodule /* TopLevel74L85 */

/*************************************************************************/

module GPmodule(A,B,G1,G2,P);
  input[3:0]    A, B;
  output[3:0]   G1, G2, P;
  wire[3:0]     Ab, Bb, AbB, ABb;

  not A0bgate(Ab[0], A[0]);
  not A1bgate(Ab[1], A[1]);
  not A2bgate(Ab[2], A[2]);
  not A3bgate(Ab[3], A[3]);

  not B0bgate(Bb[0], B[0]);
  not B1bgate(Bb[1], B[1]);
  not B2bgate(Bb[2], B[2]);
  not B3bgate(Bb[3], B[3]);

  and G10gate(G1[0], Ab[0], B[0]);
  and G11gate(G1[1], Ab[1], B[1]);
  and G12gate(G1[2], Ab[2], B[2]);
  and G13gate(G1[3], Ab[3], B[3]);

  and G20gate(G2[0], A[0], Bb[0]);
  and G21gate(G2[1], A[1], Bb[1]);
  and G22gate(G2[2], A[2], Bb[2]);
  and G23gate(G2[3], A[3], Bb[3]);

  and AbB0gate(AbB[0], Ab[0], B[0]);
  and AbB1gate(AbB[1], Ab[1], B[1]);
  and AbB2gate(AbB[2], Ab[2], B[2]);
  and AbB3gate(AbB[3], Ab[3], B[3]);

  and ABb0gate(ABb[0], A[0], Bb[0]);
  and ABb1gate(ABb[1], A[1], Bb[1]);
  and ABb2gate(ABb[2], A[2], Bb[2]);
  and ABb3gate(ABb[3], A[3], Bb[3]);

  nor P0gate(P[0], AbB[0], ABb[0]); 
  nor P1gate(P[1], AbB[1], ABb[1]); 
  nor P2gate(P[2], AbB[2], ABb[2]); 
  nor P3gate(P[3], AbB[3], ABb[3]); 

endmodule /* GPmodule */

/*************************************************************************/

module     CLAmodule (G,P,AxBi,AxBo);
input[3:0]      G, P;
input           AxBi;
output          AxBo;

  buf G3gate (G3, G[3]);
  and G2P3gate (G2P3, G[2], P[3]);
  and G1P2P3gate(G1P2P3, G[1], P[2], P[3]);
  and G0P1P2P3gate(G0P1P2P3, G[0], P[1], P[2], P[3]);
  and AxBiP0P1P2P3gate(AxBiP0P1P2P3, AxBi, P[0], P[1], P[2], P[3]);

  or AxBogate(AxBo, G3, G2P3, G1P2P3, G0P1P2P3, AxBiP0P1P2P3);

endmodule /* CLAmodule */

/*************************************************************************/

module     EQmodule (AEBi,P,AEBo);
  input           AEBi;
  input[3:0]      P;
  output          AEBo;

  and AEBogate(AEBo, AEBi, P[0], P[1], P[2], P[3]);

endmodule /* EQmodule */
