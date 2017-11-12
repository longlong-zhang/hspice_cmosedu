*** Figure 1.28 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 100p 8n 

Vin	Vin	0	DC	0	pwl 0 0.5 3n 1 5n 1 5.5n 0 7n 0
R1	Vin	Vout	1k
C1	Vout	0	1p

.end
