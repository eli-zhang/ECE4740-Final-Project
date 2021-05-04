/*
 * LFSR_Deg7.v
 * LFSR of Degree 7 
 * 	Implementing Primitive Polynomial: x^7 + x^1 + 1
 *
 * Author: Greg George
 * Last update: May 4, 2021
 */

module LFSR_DegSeven_One
#(
   parameter DEGREE = 7 // Degree of LFSR
)
(
   input Clk_CI, // Clock input
   input Rst_RBI, // Reset signal
   input WrEn_SI, // Write-enable

   input SeedWr_DI,
   input [DEGREE-1:0] Seed_DI,
   
   output LFSR_DO
);

wire G_D, F_D, E_D, D_D;
wire C_D, B_D, A_D, LFSR_Out;


////////////////////////
// LFSR registers
////////////////////////

// 7 DFF forming the LFSR. DFF6 is the MSB and DFF0 is the LSB

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFG
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Out),
   .Q_DO    ( G_D     )
 );
 
 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFF
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( G_D     ),
   .Q_DO    ( F_D     )
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFE
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( F_D     ),
   .Q_DO    ( E_D     )
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFD
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( E_D     ),
   .Q_DO    ( D_D     )
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFC
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( D_D     ),
   .Q_DO    ( C_D     )
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFB
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( C_D     ),
   .Q_DO    ( B_D     )
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFA
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( B_D     ),
   .Q_DO    ( A_D     )
 );

////////////////////////
// XOR TAPS
////////////////////////

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XOR
 (
   .A_DI    ( G_D    ),
   .B_DI    ( A_D    ),
   .Xor_DO ( LFSR_Out)
 );

 ////////////////////////
 // Output registers
 //////////////////////// 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 LFSRReg
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Out),
   .Q_DO    ( LFSR_DO  )
 ); 

// Purpose: Load up LFSR with Seed if Data Valid (DV) pulse is detected.
 // Othewise just run LFSR when enabled.
  always @(posedge Clk_CI)
    begin
      if (WrEn_SI == 1'b1)
        begin
          if (SeedWr_DI == 1'b1)
            DFFG <= Seed_DI[6];
            DFFF <= Seed_DI[5];
            DFFE <= Seed_DI[4];
            DFFD <= Seed_DI[3];
            DFFC <= Seed_DI[2];
            DFFB <= Seed_DI[1];
            DFFA <= Seed_DI[0];
        end
    end

endmodule
