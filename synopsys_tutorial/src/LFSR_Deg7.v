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

   input SeedWr_DI, // Select seed for initialization
   input [DEGREE-1:0] Seed_DI, // Initial Seed
   
   output LFSR_DO // Output of LFSR
);

wire G_D, F_D, E_D, D_D;
wire C_D, B_D, A_D, LFSR_Out;
wire [DEGREE-1:0] LFSR_Mux_In, LFSR_Mux_Out;

////////////////////////
// Mux Selection
////////////////////////

 Mux2_1 #(
   .DATA_WIDTH ( DEGREE )
 )
 Mux
 (
   .A_DI (LFSR_Mux_In),
   .B_DI (Seed_DI),
   .Sel_DI (SeedWr_DI),
   .MuxOut_DO (LFSR_Mux_Out)
 );

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
   .D_DI    ( LFSR_Mux_Out[6]),
   .Q_DO    ( LFSR_Mux_In[6])
 );
 
 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFF
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[5]),
   .Q_DO    ( LFSR_Mux_In[5])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFE
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[4]),
   .Q_DO    ( LFSR_Mux_In[4])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFD
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[3]),
   .Q_DO    ( LFSR_Mux_In[3])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFC
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[2]),
   .Q_DO    ( LFSR_Mux_In[2])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFB
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[1]),
   .Q_DO    ( LFSR_Mux_In[1])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFA
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[0]),
   .Q_DO    ( LFSR_Mux_In[0])
 );

////////////////////////
// XOR TAPS
////////////////////////

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XOR
 (
   .A_DI    ( LFSR_Mux_In[6]),
   .B_DI    ( LFSR_Mux_In[0]),
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

endmodule
