/*
 * RegisteredXor.v
 * RegisteredXOR gate
 *
 * Author: Greg George
 * Last update: April 14, 2021
 */

module RegisteredXor
#(
   parameter DATA_WIDTH = 1 // Number of bits to XOR, not used for now
)
(
   input Clk_CI, // Clock input
   input Rst_RBI, // Reset signal
   input WrEn_SI, // Write-enable

   input [DATA_WIDTH-1:0] A_DI,
   input [DATA_WIDTH-1:0] B_DI,
   
   output [DATA_WIDTH-1:0] Xor_DO
);

wire [DATA_WIDTH-1:0] A_D, B_D, Xor_Out;

////////////////////////
// Input registers
////////////////////////

 FF #(
   .DATA_WIDTH ( DATA_WIDTH )
 )
 AReg
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( A_DI    ),
   .Q_DO    ( A_D     )
 );
 
 FF #(
   .DATA_WIDTH ( DATA_WIDTH )
 )
 BReg
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( B_DI    ),
   .Q_DO    ( B_D     )
 );

////////////////////////
// XOR
////////////////////////

 Xor #(
   .DATA_WIDTH ( DATA_WIDTH )
 )
 XOR
 (
   .A_DI    ( A_D    ),
   .B_DI    ( B_D    ),
   .Xor_DO ( Xor_Out )

 );

 ////////////////////////
 // Output registers
 //////////////////////// 

 FF #(
   .DATA_WIDTH ( DATA_WIDTH )
 )
 XorReg
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( Xor_Out   ),
   .Q_DO    ( Xor_DO  )
 ); 

endmodule
