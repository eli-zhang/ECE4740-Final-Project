/*
 * Mux2_1.v
 * 2:1 Mux of variable data width
 *
 * Author: Gregory George
 * Last update: May 5, 2021
 */

module Mux2_1
#(
   parameter DATA_WIDTH = 7   //Number of bits for inputs and outputs
 )
 (   
   input [DATA_WIDTH-1:0] A_DI,    // 1st input
   input [DATA_WIDTH-1:0] B_DI,    // 2nd input
   input                  Sel_DI,  // Select bit  
   
   output [DATA_WIDTH-1:0] MuxOut_DO // Muxed output
 );
 
 assign MuxOut_DO = Sel_DI ? B_DI : A_DI;

endmodule
