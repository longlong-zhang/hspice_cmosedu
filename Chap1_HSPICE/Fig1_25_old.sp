*** Figure 1.25_old CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 100p 100n 

Vin	Vin	0	DC	1
R1	Vin	Vout	1k
R2	Vout	0	2k

.end
