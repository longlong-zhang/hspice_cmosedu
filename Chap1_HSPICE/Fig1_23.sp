*** Figure 1.23 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.ac dec 100 1 10k

Vin	Vin	0	DC	0	SIN 0 1 200 AC 1
R1	Vin	Vout	1k
CL	Vout	0	1u

.end
