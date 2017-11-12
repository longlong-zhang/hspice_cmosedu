*** Figure 26.28 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc 	vcma	400m 	600m 	1m

VDD 	VDD	0	DC	1
vcm	vcm	0	DC	500m
vcma	vcma	0	DC	0

Xbias	vbiasn	vbiasp	vdd	bias

xdiffa	vcma	vcm	vcmfba	vbiasp	vdd	diffa
xdiffb	vcma	vcm	vcmfbb	vbiasp	vdd	diffb

.subckt diffa	vcma	vcm	vcmfb	vbiasp	vdd	
Mp1	vss	vbiasp	VDD	VDD	P_50n L=1 W=20
Mp2	n1	vcma	vss	VDD	P_50n L=1 W=20
Mp3	vcmfb	vcm	vss	VDD	P_50n L=1 W=20
Mn1	n1	n1	0	0	N_50n L=1 W=10
Mn2	vcmfb	vcmfb	0	0	N_50n L=1 W=10
.ends

.subckt diffb	vcma	vcm	vcmfb	vbiasp	vdd	
Mp1	vss	vbiasp	VDD	VDD	P_50n L=1 W=20
Mp2	n1	vcma	vss	VDD	P_50n L=1 W=20
Mp3	vcmfb	vcm	vss	VDD	P_50n L=1 W=20
Mn1	n1	n1	0	0	N_50n L=1 W=10
Mn2	vcmfb	n1	0	0	N_50n L=1 W=10
.ends

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
   

