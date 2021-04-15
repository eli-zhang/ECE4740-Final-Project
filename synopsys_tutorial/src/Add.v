/*
 * Add.v
 * Adder for real numbers
 *
 * Author: Oscar Castaneda
 * Last update: April 17, 2019
 */

module Add
#(
   parameter DATA_WIDTH = 12   //Number of bits for inputs and outputs
 )
 (   
   input [DATA_WIDTH-1:0] A_DI,    // Numbers to
   input [DATA_WIDTH-1:0] B_DI,    // be added
   input                  Cin_DI,  // Carry-in  
   
   output [DATA_WIDTH-1:0] Sum_DO, // Result of addition
   output                  Cout_DO // Carry-out
 );

 assign {Cout_DO, Sum_DO} = A_DI + B_DI + Cin_DI;

endmodule