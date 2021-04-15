/*
 * Xor.v
 * XOR gate
 *
 * Author: Eli Zhang
 * Last update: April 14, 2021
 */

module Xor
#(
   parameter DATA_WIDTH = 1 // Number of bits to XOR, not used for now
)
(
   input [DATA_WIDTH-1:0] A_DI,
   input [DATA_WIDTH-1:0] B_DI,
   
   output [DATA_WIDTH-1:0] Xor_DO
);
   assign Xor_DO = A_DI ^ B_DI; 

endmodule
