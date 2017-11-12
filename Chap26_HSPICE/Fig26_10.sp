*** Figure 26.10 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 1u 100u UIC

VDD 	VDD	0	DC	1
vcm	vcm	0	DC	500m
vcmos	vcmos	0	DC	450m

Xbias	vbiasn	vbiasp	VDD	bias

M1L	vd1l	vcm	vss	0	N_50n L=1 W=10
M1R	vd1r	vcm	vss	0	N_50n L=1 W=10
M2L	vd1l	vbiasp	VDD	VDD	P_50n L=1 W=20
M2R	vd1r	vbiasp	VDD	VDD	P_50n L=1 W=20
M3R	vss	vcmfb1	0	0	N_50n L=1 W=10
M3L	vss	vcmfb1	0	0	N_50n L=1 W=10
X1	vd1l	vd1r	vbiasp	vcmfb1	vbiasp	VDD	cmfb
c1	vd1l	0	250f
c2	vd1r	0	250f

M1Los	vd1los	vcmos	vssos	0	N_50n L=1 W=10
M1Ros	vd1ros	vcm	vssos	0	N_50n L=1 W=10
M2Los	vd1los	vbiasp	VDD	VDD	P_50n L=1 W=20
M2Ros	vd1ros	vbiasp	VDD	VDD	P_50n L=1 W=20
M3Ros	vssos	vcmfb2	0	0	N_50n L=1 W=10
M3Los	vssos	vcmfb2	0	0	N_50n L=1 W=10
X2	vd1los	vd1ros	vbiasp	vcmfb2	vbiasp	VDD	cmfb
c1os	vd1los	0	250f
c2os	vd1ros	0	250f

.subckt cmfb	vp1	vp2	vm	vcmfb	vbiasp	VDD

MP1	vss	vbiasp	VDD	VDD	P_50n L=1 W=20	
MP2	vss	vbiasp	VDD	VDD	P_50n L=1 W=20
M3L	vd3	vp1	vss	VDD	P_50n L=1 W=100
M3R	vd3	vp2	vss	VDD	P_50n L=1 W=100
M3M	vcmfb	vm	vss	VDD	P_50n L=1 W=200
M2	vd3	vd3	0	0	N_50n L=1 W=10
M1	vcmfb	vd3	0	0	N_50n L=1 W=10
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
   

