/****************************************************************************
 *                                                                          *
 *  VERILOG BEHAVIORAL DESCRIPTION OF THE TI 74283 CIRCUIT                  *
 *                                                                          *
 *  Function: Four-bit Fast Adder                                           *
 *                                                                          *
 *  Written by: Mark C. Hansen                                              *
 *                                                                          *
 *  Last modified: Dec 12, 1997                                             *
 *                                                                          *
 ****************************************************************************/

module Circuit74283b (C0, A, B, S, C4);

  input[3:0]    A, B;
  input	        C0;

  output[3:0]   S;
  output        C4;
	
  TopLevel74283b Ckt74283b (C0, A, B, S, C4);

endmodule /* Circuit74283b */

/*************************************************************************/

module TopLevel74283b (C0, A, B, S, C4);

  input[3:0]    A, B;
  input	        C0;
  output[3:0]   S;
  output        C4;
  wire[4:0]     CS;

  assign CS = A + B + C0;
  assign S = CS[3:0];
  assign C4 = CS[4];

endmodule /* TopLevel74182b */

