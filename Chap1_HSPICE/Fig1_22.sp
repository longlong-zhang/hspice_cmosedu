*** Figure 1.22 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 10u 16m 

Vin	Vin	0	DC	0	SIN 0 1 200
R1	Vin	Vout	1k
C1	Vin	Vout	1u
C2	Vout	0	1u

.end
