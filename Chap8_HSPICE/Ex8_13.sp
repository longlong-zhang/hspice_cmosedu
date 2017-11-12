*** Example 8.13 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 1000G
.noise V(Vout) Vs 100

Vs	Vs	0	dc	1.7	ac	1
Rs	Vs	Vout	1k
D1	0 	Vout 	Diode

.model Diode D TT=10n Rs=0 cj0=25e-15 vj=1 m=.5

.end