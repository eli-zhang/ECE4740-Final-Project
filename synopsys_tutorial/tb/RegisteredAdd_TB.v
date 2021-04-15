/*
 * RegisteredAdd_TB.v
 * Registered Adder testbench
 *
 * Author: Oscar Castaneda
 * Last update: April 17, 2019
 */
 
`timescale 1ns / 1ps

module RegisteredAdd_TB();

 localparam CLK_PERIOD = 1.0;  // Clock period in ns
 localparam IN_DELAY   = 0.2; // Delay after clock edge that testbench signals take to reach DUT pins 
 localparam OUT_DELAY  = 0.8; // Delay after clock edge that DUT outputs take to change
 localparam DATA_WIDTH = 16;  // Number of bits for adder operands
 
 localparam CLK_PERIOD_HALF = CLK_PERIOD/2; 
 
 integer fileIn;
 integer recIn;
 integer fileOut;
 integer recOut;
 integer error;
 
 /////////////////////
 //DUT instantiation  
 /////////////////////
 
 reg                   Clk_C;
 reg                   Rst_RB;
 reg                   WrEn_S;
 reg  [DATA_WIDTH-1:0] A_D;
 reg  [DATA_WIDTH-1:0] B_D;
 reg                   Cin_D;
 wire [DATA_WIDTH-1:0] Sum_D;
 wire                  Cout_D;
 reg  [DATA_WIDTH-1:0] Sum_DE;
 reg                   Cout_DE; 
 
 RegisteredAdd #(
   .DATA_WIDTH( DATA_WIDTH )
 )
 DUT (
   .Clk_CI  ( Clk_C  ),
   .Rst_RBI ( Rst_RB ),
   .WrEn_SI ( WrEn_S ),
   .A_DI    ( A_D    ),
   .B_DI    ( B_D    ),
   .Cin_DI  ( Cin_D  ),
   .Sum_DO  ( Sum_D  ),
   .Cout_DO ( Cout_D )
 );
 
 //Clock generation
 initial begin
   Clk_C = 1'b1;
   forever
     #CLK_PERIOD_HALF Clk_C=~Clk_C;
 end

 //Stimuli application 
 initial begin
   //Wait for the input delay
   #(IN_DELAY) begin end 
   //Prepare stimuli file
   fileIn = $fopen("../tb/RegisteredAdd_in.txt","r");
   //Read file on a per cycle basis
   while(!$feof(fileIn)) begin
     recIn = $fscanf(fileIn, "%d %d %d %d %d\n", Rst_RB, WrEn_S, A_D, B_D, Cin_D);
	 #CLK_PERIOD begin end
   end
   //Close file
   $fclose(fileIn);
 end
 
  //Output comparison
 initial begin
   //Initialize the error counter
   error = 0;
   //Wait for the output delay
   #(OUT_DELAY) begin end 
   //Prepare expected output file
   fileOut = $fopen("../tb/RegisteredAdd_out.txt","r");
   //Read file on a per cycle basis
   while(!$feof(fileOut)) begin
     recOut = $fscanf(fileOut, "%d %d\n", Sum_DE, Cout_DE);
     //For each signal, we compare the expected output with the one obtained
     //Sum_DO
     if(&Sum_DE !== 1'bX) begin
       if(Sum_D !== Sum_DE) begin
         $display("[", $time, "] Sum_DO :: Value %d Expected %d",Sum_D,Sum_DE);
         error = error + 1;
       end
     end
     //Cout_DO
     if(&Cout_DE !== 1'bX) begin
       if(Cout_D !== Cout_DE) begin
         $display("[", $time, "] Cout_DO  :: Value %d Expected %d",Cout_D,Cout_DE);
         error = error + 1;
       end
     end
     #CLK_PERIOD begin end
   end
   //Close file
   $fclose(fileOut);
   //Finish simulation
   if(error == 0) $display("<<< :D All outputs match the expected results! :D >>>");
   $finish;
 end

endmodule
