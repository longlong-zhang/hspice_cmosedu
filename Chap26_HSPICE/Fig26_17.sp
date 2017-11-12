*** Figure 26.17 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc 	vcmfb 	300m 	500m 	1m

VDD 	VDD	0	DC	1
vcm	vcm	0	DC	500m
vcmfb	vcmfb	0	DC	0

Xbias	vbiasn	vbiasp	VDD	bias

M1L	vop	vcm	vss	0	N_50n L=1 W=10
M1R	vom	vcm	vss	0	N_50n L=1 W=10
M2L	vop	vbiasp	VDD	VDD	P_50n L=1 W=20
M2R	vom	vbiasp	VDD	VDD	P_50n L=1 W=20
M3R	vss	vcmfb	0	0	N_50n L=1 W=10
M3L	vss	vbiasn	0	0	N_50n L=1 W=10


.subckt bias vbiasn vbiasp VDD

M1	Vbiasn	Vbiasn	0	0	N_50n L=1 W=10
M2	Vreg	Vreg	Vr	0	N_50n L=1 W=40
M3	Vbiasn	Vbiasp	VDD	VDD	P_50n L=1 W=20
M4	Vreg	Vbiasp	VDD	VDD	P_50n L=1 W=20

Rbias	Vr	0	4k

*amplifier 
MA1	Vamp	Vreg	0	0	N_50n L=2 W=10
MA2	Vbiasp	Vbiasn	0	0	N_50n L=2 W=10
MA3	Vamp	Vamp	VDD	VDD	P_50n L=2 W=20
MA4	Vbiasp	Vamp	VDD	VDD	P_50n L=2 W=20

*start-up stuff
MSU1	Vsur	Vbiasn	0	0	N_50n L=1   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_50n L=1   W=10

.ends

.include cmosedu_models.txt    

.end
   

