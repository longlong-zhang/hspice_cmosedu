*** Figure 26.1_P_50n CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc	Idp	0	250u 	10n

VDD	VDD	0	DC	1

**Idn	VDD	vgn	DC	0
Idp	vgp	0	DC	0

**Mn	vgn	vgn	0	0	N_50n L=1 W=10
Mp	vgp	vgp	VDD	VDD	P_50n L=1 W=20

.include cmosedu_models.txt    

.end
   

