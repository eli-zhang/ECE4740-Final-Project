/*
 * LFSR_Deg11.v
 * LFSR of Degree 11 
 * 	Implementing Primitive Polynomial: x^11 + x^10 + x^8 + x^7 + x^5 + x^4 + x^3 + x^1 + 1
 *
 * Author: Greg George
 * Last update: May 14, 2021
 */

module LFSR_DegEleven_One
#(
   parameter DEGREE = 11 // Degree of LFSR
)
(
   input Clk_CI, // Clock input
   input Rst_RBI, // Reset signal
   input WrEn_SI, // Write-enable

   input SeedWr_DI, // Select seed for initialization
   input [DEGREE-1:0] Seed_DI, // Initial Seed
   
   output LFSR_DO // Output of LFSR
);

wire tap_A, out_11_10, out_1110_8, out_11108_7, out_111087_5, out_1110875_4;
wire out_11108754_3, out_111087543_1;
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

// 11 DFF forming the LFSR. DFFK is the MSB and DFFA is the LSB
 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFK
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[10]),
   .Q_DO    ( LFSR_Mux_In[9])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFJ
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[9]),
   .Q_DO    ( LFSR_Mux_In[8])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFI
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[8]),
   .Q_DO    ( LFSR_Mux_In[7])
 );

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
   .Xor_DO  ( out_11_10)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORB
 (
   .A_DI    ( LFSR_Mux_In[2]),
   .B_DI    ( out_11_10),
   .Xor_DO  ( out_1110_8)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORC
 (
   .A_DI    ( LFSR_Mux_In[3]),
   .B_DI    ( out_1110_8),
   .Xor_DO  ( out_11108_7)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORD
 (
   .A_DI    ( LFSR_Mux_In[5]),
   .B_DI    ( out_11108_7),
   .Xor_DO  ( out_111087_5)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORE
 (
   .A_DI    ( LFSR_Mux_In[6]),
   .B_DI    ( out_111087_5),
   .Xor_DO  ( out_1110875_4)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORF
 (
   .A_DI    ( LFSR_Mux_In[7]),
   .B_DI    ( out_1110875_4),
   .Xor_DO  ( out_11108754_3)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORG
 (
   .A_DI    ( LFSR_Mux_In[9]),
   .B_DI    ( out_11108754_3),
   .Xor_DO  ( out_111087543_1)
 );

 Xor #(
   .DATA_WIDTH ( 1 )
 )
 XORH
 (
   .A_DI    ( LFSR_Mux_In[9]),
   .B_DI    ( out_111087543_1),
   .Xor_DO  ( LFSR_Out)
 );

 assign LFSR_Mux_In[10] = LFSR_Out;

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
