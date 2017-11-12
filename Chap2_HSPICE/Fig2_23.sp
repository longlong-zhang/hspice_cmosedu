*** Figure 2.23 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.tran 100p 100n 

W1	Vin	0	Vout	0	N=1	L=50	RLGCMODEL=TRC
Rload	Vout	0	1G
Vin	vin	0	DC	0	pulse 0 1 5n 0

.model	TRC	W	MODELTYPE=RLGC 	N=1	Ro=5k	Co=5f	Lo=1f
* set L, the series inductance, to a negligibly small value
.end
