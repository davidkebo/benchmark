/****************************************************************************
 *                                                                          *
 *  VERILOG BEHAVIORAL DESCRIPTION OF THE TI 74L85 CIRCUIT                  *
 *                                                                          *
 *  Function: Four-Bit Magnitude Comarator                                  *
 *                                                                          *
 *  Written by: Mark C. Hansen                                              *
 *                                                                          *
 *  Last modified: Dec 20, 1997                                             *
 *                                                                          *
 ****************************************************************************/

module Circuit74L85b (ALBi, AGBi, AEBi, A, B, ALBo, AGBo, AEBo);

  input[3:0]    A, B;
  input	        ALBi, AGBi, AEBi;

  output        ALBo, AGBo, AEBo;
	
  TopLevel74L85b Ckt74L85b (ALBi, AGBi, AEBi, A, B, ALBo, AGBo, AEBo);

endmodule /* Circuit74L85b */

/*************************************************************************/

module TopLevel74L85b (ALBi, AGBi, AEBi, A, B, ALBo, AGBo, AEBo);

  input[3:0]    A, B;
  input	        ALBi, AGBi, AEBi;
  output        ALBo, AGBo, AEBo;
  wire[4:0]     CSL, CSG;

  assign CSL = ~A + B + ALBi;
  assign ALBo = ~CSL[4];
  assign CSG = A + ~B + AGBi;
  assign AGBo = ~CSG[4];
  assign AEBo = ((A == B) && AEBi);

endmodule /* TopLevel74L85b */

/*************************************************************************/
