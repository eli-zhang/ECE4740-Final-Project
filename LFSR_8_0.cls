###############################################################################
###### dff_dynamic_reset schematic finalProject  <vs>  dff_dynamic_reset layout finalProject
###############################################################################
###### This report is for informational purposes only. This cell
###### has been expanded because of a pin mismatch error.
###############################################################################

Reduce Statistics
=================                               Original             Reduced
Cell/Device                               schematic  layout   schematic  layout
(dff_dynamic) Cell                                1       1           1       1
(mux_2_1) Cell                                    1       1           1       1

Match Statistics
================                                  Total             Unmatched
Cell/Device                               schematic  layout   schematic  layout
(dff_dynamic) Cell                                1       1           0       0
(mux_2_1) Cell                                    1       1           0       0
                                             ------  ------      ------  ------
Total                                             2       2           0       0

Match Statistics for Nets                         8       8           0       0

======[ERROR REPORT FOR INFORMATION ONLY - THIS CELL HAS BEEN EXPANDED]========
============================================================[dff_dynamic_reset]
====== Unmatched Pins =========================================================
===============================================================================

S ?!CLK

======[ERROR REPORT FOR INFORMATION ONLY - THIS CELL HAS BEEN EXPANDED]========
============================================================[dff_dynamic_reset]
====== Shorted Instance Connections ===========================================
===============================================================================

Layout net: avC3 shorts to:
S   I0/CLK
S   I0/!CLK

======[ERROR REPORT FOR INFORMATION ONLY - THIS CELL HAS BEEN EXPANDED]========
============================================================[dff_dynamic_reset]
====== Problem Schematic Nets (no exact match in layout) ======================
===============================================================================
S
S ?!CLK
        (nothing)

======[ERROR REPORT FOR INFORMATION ONLY - THIS CELL HAS BEEN EXPANDED]========
============================================================[dff_dynamic_reset]
====== Summary of Errors ======================================================
===============================================================================

Schematic  Layout     Error Type
---------  ------     ----------
 1          -         Unmatched Pins
 -          1         Shorted Instance Connections

*******************************************************************************
****** LFSR_8_0 schematic finalProject  <vs>  LFSR_8_0 layout finalProject
*******************************************************************************

Reduce Statistics
=================                               Original             Reduced
Cell/Device                               schematic  layout   schematic  layout
(dff_dynamic) Cell                                8       8           8       8
(inv_clk_dff) Cell                                1       1           1       1
(inv_min) Cell                                    1       1           1       1
(inv_min_x2.5) Cell                               1       1           1       1
(inv_min_x4) Cell                                 1       1           1       1
(mux_2_1) Cell                                    8       8           8       8
(xor_regular) Cell                                3       3           3       3

Match Statistics
================                                  Total             Unmatched
Cell/Device                               schematic  layout   schematic  layout
(dff_dynamic) Cell                                8       8           0       0
(inv_clk_dff) Cell                                1       1           0       0
(inv_min) Cell                                    1       1           0       0
(inv_min_x2.5) Cell                               1       1           0       0
(inv_min_x4) Cell                                 1       1           0       0
(mux_2_1) Cell                                    8       8           0       0
(xor_regular) Cell                                3       3           0       0
                                             ------  ------      ------  ------
Total                                            23      23           0       0

Match Statistics for Nets                        26      26           0       0

=====================================================================[LFSR_8_0]
====== Shorted Instance Connections ===========================================
===============================================================================

Layout net: avC9 shorts to I206/avC7
Layout net: CLK shorts to:
S   I203/I0/CLK
S   I203/I0/!CLK
Layout net: CLK shorts to:
S   I197/I0/CLK
S   I197/I0/!CLK
Layout net: CLK shorts to:
S   I196/I0/CLK
S   I196/I0/!CLK
Layout net: CLK shorts to:
S   I198/I0/CLK
S   I198/I0/!CLK
Layout net: CLK shorts to:
S   I199/I0/CLK
S   I199/I0/!CLK
Layout net: CLK shorts to:
S   I200/I0/CLK
S   I200/I0/!CLK
Layout net: CLK shorts to:
S   I201/I0/CLK
S   I201/I0/!CLK
Layout net: CLK shorts to:
S   I202/I0/CLK
S   I202/I0/!CLK
Layout net: CLK shorts to:
S   I294/Vin
S   I294/Vout

=====================================================================[LFSR_8_0]
====== Bad Matched Nets (don't really match) ==================================
===============================================================================

= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =(badmatch 1)
Schematic Net:  !Set
S       8   of mux_2_1 !SEL
S       1   of inv_min_x4 Vout

Layout Net:  avC9
L      *1   of xor_regular ?avC7
L       8   of mux_2_1 !SEL
L       1   of inv_min_x4 Vout

=====================================================================[LFSR_8_0]
====== Problem Schematic Nets (no exact match in layout) ======================
===============================================================================
S
S ?!Set
S       8   of mux_2_1 !SEL
S       1   of inv_min_x4 Vout

=====================================================================[LFSR_8_0]
====== Problem Layout Nets (no exact match in schematic) ======================
===============================================================================
L
L ?avC9
L       1   of xor_regular ?avC7
L       8   of mux_2_1 !SEL
L       1   of inv_min_x4 Vout

=====================================================================[LFSR_8_0]
====== Summary of Errors ======================================================
===============================================================================

Schematic  Layout     Error Type
---------  ------     ----------
 1          1         Bad Matched Nets
 -          10        Shorted Instance Connections

