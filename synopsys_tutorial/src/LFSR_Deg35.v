/*
 * LFSR_Deg35.v
 * LFSR of Degree 35 
 * 	Implementing Primitive Polynomial: x^35 + x^2 + 1
 *
 * Author: Greg George
 * Last update: May 14, 2021
 */

module LFSR_DegThirtyFive
#(
   parameter DEGREE = 35 // Degree of LFSR
)
(
   input Clk_CI, // Clock input
   input Rst_RBI, // Reset signal
   input WrEn_SI, // Write-enable

   input SeedWr_DI, // Select seed for initialization
   input [DEGREE-1:0] Seed_DI, // Initial Seed
   
   output LFSR_DO // Output of LFSR
);

wire tap_A;
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

// 35 DFF forming the LFSR. DFFAI is the MSB and DFFA is the LSB
 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAI
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[34]),
   .Q_DO    ( LFSR_Mux_In[33])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAH
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[33]),
   .Q_DO    ( LFSR_Mux_In[32])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAG
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[32]),
   .Q_DO    ( LFSR_Mux_In[31])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAF
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[31]),
   .Q_DO    ( LFSR_Mux_In[30])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAE
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[30]),
   .Q_DO    ( LFSR_Mux_In[29])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAD
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[29]),
   .Q_DO    ( LFSR_Mux_In[28])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAC
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[28]),
   .Q_DO    ( LFSR_Mux_In[27])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAB
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[27]),
   .Q_DO    ( LFSR_Mux_In[26])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFAA
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[26]),
   .Q_DO    ( LFSR_Mux_In[25])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFZ
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[25]),
   .Q_DO    ( LFSR_Mux_In[24])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFY
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[24]),
   .Q_DO    ( LFSR_Mux_In[23])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFX
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[23]),
   .Q_DO    ( LFSR_Mux_In[22])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFW
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[22]),
   .Q_DO    ( LFSR_Mux_In[21])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFV
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[21]),
   .Q_DO    ( LFSR_Mux_In[20])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFU
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[20]),
   .Q_DO    ( LFSR_Mux_In[19])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFT
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[19]),
   .Q_DO    ( LFSR_Mux_In[18])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFS
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[18]),
   .Q_DO    ( LFSR_Mux_In[17])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFR
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[17]),
   .Q_DO    ( LFSR_Mux_In[16])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFQ
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[16]),
   .Q_DO    ( LFSR_Mux_In[15])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFP
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[15]),
   .Q_DO    ( LFSR_Mux_In[14])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFO
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[14]),
   .Q_DO    ( LFSR_Mux_In[13])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFN
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[13]),
   .Q_DO    ( LFSR_Mux_In[12])
 );

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFM
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[12]),
   .Q_DO    ( LFSR_Mux_In[11])
 ); 

 FF #(
   .DATA_WIDTH ( 1 )
 )
 DFFL
 (
   .Clk_CI  ( Clk_CI  ),
   .Rst_RBI ( Rst_RBI ),
   .WrEn_SI ( WrEn_SI ),
   .D_DI    ( LFSR_Mux_Out[11]),
   .Q_DO    ( LFSR_Mux_In[10])
 ); 

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
   .A_DI    ( LFSR_Mux_In[33]),
   .B_DI    ( tap_A),
   .Xor_DO  ( LFSR_Out)
 );

 assign LFSR_Mux_In[34] = LFSR_Out;

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
