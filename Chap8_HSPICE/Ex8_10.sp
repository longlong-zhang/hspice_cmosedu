*** Example 8.10 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 1k
.noise V(Vout) Vs 100

Rs	 Vs 	Vout 	10k 
Gin	 Vout 	0 	Vout 	0 	1e-3 
Vs	 Vs 	0	dc 	0 	ac 	1
.print noise all
.end