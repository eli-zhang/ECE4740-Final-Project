/*
 * Inv.v
 * XOR gate
 *
 * Author: Greg George
 * Last update: May 16, 2021
 */

module Inv
#(
   parameter DATA_WIDTH = 1 // Number of bits to invert, not used for now
)
(
   input [DATA_WIDTH-1:0] A_DI,
   
   output [DATA_WIDTH-1:0] Inv_DO
);
   assign Inv_DO = !A_DI; 

endmodule
