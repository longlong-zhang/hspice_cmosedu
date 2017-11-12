*** Example 8.11 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 1k
.noise V(Vout) Vs 100

Gs	 Vs	Vout	Vs 	Vout	100u
Rin	 Vout	0	1k
Vs	 Vs 	0	dc 	0 	ac 	1

.end