*** Figure 1.17 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.dc Vin 0 1 1m

Vin	Vin	0	DC	1
R1	Vin	Vd	1k
D1	Vd	0	mydiode

.model mydiode D

.end