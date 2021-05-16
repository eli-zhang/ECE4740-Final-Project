/*
 * LFSR_Deg8.v
 * LFSR of Degree 8 
 * 	Implementing Primitive Polynomial: x^8 + x^7 + x^6 + x^5 + x^2 + x^1 + 1
 *
 * Author: Greg George
 * Last update: May 14, 2021
 */

module LFSR_DegEight_One
#(
   parameter DEGREE = 8 // Degree of LFSR
)
(
   input Clk_CI, // Clock input
   input Rst_RBI, // Reset signal
   input WrEn_SI, // Write-enable

   input SeedWr_DI, // Select seed for initialization
   input [DEGREE-1:0] Seed_DI, // Initial Seed
   
   output LFSR_DO // Output of LFSR
);

wire tap_A, out_8_7, out_87_6, out_876_5, out_8765_2;
wire LFSR_Out;
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

// 8 DFF forming the LFSR. DFFH is the MSB and DFFA is the LSB
 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFH
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[7]),
   .Q_DO    ( LFSR_Mux_In[6])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFG
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[6]),
   .Q_DO    ( LFSR_Mux_In[5])
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
   .Q_DO    ( LFSR_Mux_In[4])
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
   .Q_DO    ( LFSR_Mux_In[3])
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
   .Q_DO    ( LFSR_Mux_In[2])
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
   .Q_DO    ( LFSR_Mux_In[1])
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
   .Q_DO    ( LFSR_Mux_In[0])
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
   .Q_DO    ( tap_A)
 );

////////////////////////
// XOR TAPS
////////////////////////

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORA
 (
   .A_DI    ( LFSR_Mux_In[0]),
   .B_DI    ( tap_A),
   .Xor_DO  ( out_8_7)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORB
 (
   .A_DI    ( LFSR_Mux_In[1]),
   .B_DI    ( out_8_7),
   .Xor_DO  ( out_87_6)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORC
 (
   .A_DI    ( LFSR_Mux_In[2]),
   .B_DI    ( out_87_6),
   .Xor_DO  ( out_876_5)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORD
 (
   .A_DI    ( LFSR_Mux_In[5]),
   .B_DI    ( out_876_5),
   .Xor_DO  ( out_8765_2)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORE
 (
   .A_DI    ( LFSR_Mux_In[6]),
   .B_DI    ( out_8765_2),
   .Xor_DO  ( LFSR_Out)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORF
 (
   .A_DI    ( LFSR_Mux_In[6]),
   .B_DI    ( out_87652_1),
   .Xor_DO  ( out_87652_1)
 );

 assign LFSR_Mux_In[7] = LFSR_Out;

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
