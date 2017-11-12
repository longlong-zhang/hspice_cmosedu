*** Figure 20.13 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VDD 4.5 5.5 1m

VDD 	VDD	0	DC	5
Vop	Vop	0	DC	0
Von	VDD	Von	DC 	0

M1n	Vbiasn	Vbiasn	0	0	N_1u L=2 W=10
M2n	Vbiasn	Vbiasn	VDD	VDD	P_1u L=90 W=10


M1p	Vbiasp	Vbiasp	0	0	N_1u L=270 W=10
M2p	Vbiasp	Vbiasp	VDD	VDD	P_1u L=2 W=30

Mn	Von	Vbiasn	0	0	N_1u L=2 W=10

Mp	Vop	Vbiasp	VDD	VDD	P_1u L=2 W=30

.include cmosedu_models.txt   

.end
      