/****************************************************************************
 *                                                                          *
 *  VERILOG BEHAVIORAL DESCRIPTION OF THE TI 74182 CIRCUIT                  *
 *                                                                          *
 *  Function: Carry Lookahead Generator                                     *
 *                                                                          *
 *  Written by: Mark C. Hansen                                              *
 *                                                                          *
 *  Last modified: Dec 10, 1997                                             *
 *                                                                          *
 ****************************************************************************/

module Circuit74182 (CN, PB, GB, PBo, GBo, CNX, CNY, CNZ);

  input[3:0]    PB, GB;
  input	        CN;

  output	PBo, GBo, CNX, CNY, CNZ;
	
  TopLevel74182b Ckt74182b (CN, PB, GB, PBo, GBo, CNX, CNY, CNZ);

endmodule /* Circuit74182 */

/*************************************************************************/

module TopLevel74182b (CN, PB, GB, PBo, GBo, CNX, CNY, CNZ);

  input[3:0]	PB, GB;
  input         CN;

  output	PBo, GBo, CNX, CNY, CNZ;

  assign PBo = (PB[0]|PB[1]|PB[2]|PB[3]);
  assign GBo = ((GB[0]&GB[1]&GB[2]&GB[3]) | 
                (PB[1]&GB[1]&GB[2]&GB[3]) | 
                (PB[2]&GB[2]&GB[3]) | 
                (PB[3]&GB[3]));
  assign CNX = ~((PB[0]&GB[0]) | 
                 (~CN&GB[0]));
  assign CNY = ~((PB[1]&GB[1]) | 
                 (PB[0]&GB[0]&GB[1]) | 
                 (~CN&GB[0]&GB[1]));
  assign CNZ = ~((PB[2]&GB[2]) | 
                 (PB[1]&GB[1]&GB[2]) | 
                 (PB[0]&GB[0]&GB[1]&GB[2]) | 
                 (~CN&GB[0]&GB[1]&GB[2]));
  
endmodule /* TopLevel74182b */

