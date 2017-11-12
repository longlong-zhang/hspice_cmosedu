*** Figure 1.16 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals

.option post
.dc Vin 0 1 1m

Vin	Vin	0	DC	1
R1	Vin	Vout	1k
R2	Vout	0	2k

.end