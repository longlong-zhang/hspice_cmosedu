*** Example 8.18 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 1000G
.noise V(Vout) Vplus 100

Vplus	Vplus	0	dc	0	ac	1
Rf	Vout	Vminus	100k
Cf	Vout	Vminus 	1000pf
Eopamp	Vout	0	Vplus	Vminus 100MEG

.end