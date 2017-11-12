*** Figure 1.27 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 100p 8n 

Vin	Vin	0	DC	0	pulse -1 -2 2n 10p
R1	Vin	Vout	1k
C1	Vout	0	1p

.end
