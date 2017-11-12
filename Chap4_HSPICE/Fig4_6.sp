*** Figure 4.6 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.tran 1p 2500p 

Vin	vin	0	DC	0	pulse 0 1 50p 0

W1	Vin	0	Vout1	0	N=1	L=1000	RLGCMODEL=poly_nosilicide
Rload1	Vout1	0	1G

W2	Vin	0	Vout2	0	N=1	L=1000	RLGCMODEL=poly_silicide
Rload2	Vout2	0	1G

.model	poly_nosilicide	W	MODELTYPE=RLGC 	N=1	Ro=200 Co=9e-18	Lo=1f

.model	poly_silicide	W	MODELTYPE=RLGC 	N=1	Ro=5	Co=9e-18	Lo=1f
.end

