*** Figure 1.24 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 100p 30n 

Vin	Vin	0	DC	0	pulse 0 1 6n 0 0 3n 10n
R1	Vin	Vout	1k
C1	Vout	0	1p

.end
