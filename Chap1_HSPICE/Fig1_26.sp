*** Figure 1.26 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 100p 8n 

Vin	Vin	0	DC	0	pulse 0 1 2n 10p 
R1	Vin	Vout	1k
C1	Vout	0	1p

.end
