*** Figure 20.28 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc 	Vo	0	1	1m

VDD 	VDD	0	DC	1 
Vo	Vo	0	Dc	0

X1 	VDD 	Vbiasp 	Vbiasn 	bmrefs
M1 	Vo	Vbiasn	0	0	N_50n L=2 W=50


.subckt	bmrefs 	VDD 	Vbiasp 	Vbiasn
M1	Vbiasn	Vbiasn	0	0	N_50n L=2 W=50
M2	Vreg	Vreg	Vr	0	N_50n L=2 W=200
M3	Vbiasn	Vbiasp	VDD	VDD	P_50n L=2 W=100
M4	Vreg	Vbiasp	VDD	VDD	P_50n L=2 W=100

Rbias	Vr	0	5.5k

*amplifier 
MA1	Vamp	Vreg	0	0	N_50n L=2 W=50
MA2	Vbiasp	Vbiasn	0	0	N_50n L=2 W=50
MA3	Vamp	Vamp	VDD	VDD	P_50n L=2 W=100
MA4	Vbiasp	Vamp	VDD	VDD	P_50n L=2 W=100

*start-up stuff
MSU1	Vsur	Vbiasn	0	0	N_50n L=2   W=50
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_50n L=1   W=10
.ends

.include cmosedu_models.txt  

.end
   

