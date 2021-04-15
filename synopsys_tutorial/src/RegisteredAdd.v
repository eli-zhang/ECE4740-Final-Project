/*
 * RegisteredAdd.v
 * Adder for real numbers with inputs and outputs registered
 *
 * Author: Oscar Castaneda
 * Last update: April 17, 2019
 */

module RegisteredAdd
#(
   parameter DATA_WIDTH = 12   //Number of bits for inputs and outputs
 )
 ( 
   input                  Clk_CI,  // Clock input
   input                  Rst_RBI, // Reset signal
   input                  WrEn_SI, // Write-enable
   
   input [DATA_WIDTH-1:0] A_DI,    // Numbers to
   input [DATA_WIDTH-1:0] B_DI,    // be added
   input                  Cin_DI,  // Carry-in  
   
   output [DATA_WIDTH-1:0] Sum_DO, // Result of addition
   output                  Cout_DO // Carry-out
 );
 
 wire [DATA_WIDTH-1:0] A_D, B_D, Sum_D;
 wire                  Cin_D, Cout_D;

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

 FF #(
   .DATA_WIDTH ( 1 )
 )
 CinReg
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( Cin_DI  ),
   .Q_DO    ( Cin_D   )
 ); 
 
 ////////////////////////
 // Adder
 ////////////////////////
 
 Add #(
   .DATA_WIDTH ( DATA_WIDTH )
 )
 Adder
 (
   .A_DI    ( A_D    ),
   .B_DI    ( B_D    ),
   .Cin_DI  ( Cin_D  ),
   .Sum_DO  ( Sum_D  ),
   .Cout_DO ( Cout_D )

 );  
 
 ////////////////////////
 // Output registers
 //////////////////////// 

 FF #(
   .DATA_WIDTH ( DATA_WIDTH )
 )
 SumReg
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( Sum_D   ),
   .Q_DO    ( Sum_DO  )
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 CoutReg
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( Cout_D  ),
   .Q_DO    ( Cout_DO )
 );

endmodule