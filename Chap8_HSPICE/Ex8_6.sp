*** Example 8.6 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 1G
.noise V(Vout) Vin 100

R1	 Vin 		Vout 	10k 
C1	 Vout 	0 	1p 
Vin	 Vin 	0	dc 	0 	ac 	1

.end