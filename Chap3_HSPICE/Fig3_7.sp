*** Figure 3.7 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.tran 1p 250p 

W1	Vin	0	Vout	0	N=1	L=5000	RLGCMODEL=TRC
Rload	Vout	0	1G
Vin	vin	0	DC	0	pulse 0 1 50p 0

.model	TRC	W	MODELTYPE=RLGC 	N=1	Ro=0.1 Co=32e-18	Lo=1f

.end
