*** Figure 1.20 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 1n 3u 

Vin	Vin	0	DC	0	SIN 0 1 1MEG
R1	Vin	Vout	1k
R2	Vout	0	2k

.end
