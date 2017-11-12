*** Example 8.12 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 100G
.noise V(Vout) Vs 100

Vs	Vs	0	dc	1.7	ac	1
Rs	Vs	Vout	1k
D1	Vout	0 	Diode

.model Diode D TT=10n Rs=0

.end