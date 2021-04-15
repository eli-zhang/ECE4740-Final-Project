/*
 * FF.v
 * Flip-flop with asynchronous reset and write enable.
 *
 * Author: Oscar Castaneda
 * Last update: October 11, 2017
 */

module FF
#(
   parameter DATA_WIDTH = 6   // Number of bits for data
 )
 (   
   input                       Clk_CI,  // Clock signal
   input                       Rst_RBI, // Asynchronous, active low reset
   input                       WrEn_SI, // Write enable

   input      [DATA_WIDTH-1:0] D_DI,    // Input data to FF
   
   output reg [DATA_WIDTH-1:0] Q_DO     // Output data of FF
 );

 always@(posedge Clk_CI or negedge Rst_RBI)
   if(~Rst_RBI)
     Q_DO <= 0;
   else if(WrEn_SI)
     Q_DO <= D_DI;

endmodule