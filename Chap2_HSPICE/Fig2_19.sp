*** Figure 2.19 CMOS: Circuit Design, Layout, and Simulation ***

.option post

D1	 vd 	0 	Dtrr
R1	 vin 	vd	1k 
Vin	 vin	0	DC 	0 	pulse 10 -10 10n .1n .1n 20n 40n

.Model Dtrr  D 	is=1.0E-15 tt=10E-9 cj0=1E-12 vj=.7 m=0.33

.tran 100p 25n 
.end
