*** Figure 27.10 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc vp	0	5	10m	vm	0	5	500m

VDD 	VDD	0	DC	5
Vp	vp	0	DC	2.5
vm	vm	0	DC	2.5

X1	vbiasn	vbiasp	vdd	bias
M1	n1	vp	vss	0	N_1u L=1 W=10
M2	n2	vm	vss	0	N_1u L=1 W=10
M3a	vss	vbiasn	0	0	N_1u L=2 W=20
M31	n1	n1	vdd	vdd	P_1u L=1 W=20
M41	n2	n2	vdd	vdd	P_1u L=1 W=20
M3	vop	n1	vdd	vdd	P_1u L=1 W=20
M4	vom	n2	vdd	vdd	P_1u L=1 W=20
M5	vop	vop	vc	0	N_1u L=1 W=10
M6	vop	vom	vc	0	N_1u L=1 W=10
M7	vom	vop	vc	0	N_1u L=1 W=10
M8	vom	vom	vc	0	N_1u L=1 W=10
Mc	vc	vc	0	0	N_1u L=10 W=10

M1P	vopb	vp	vpp	vdd	P_1u L=1 W=20
M2P	vomb	vm	vpp	vdd	P_1u L=1 W=20
M3p	vpp	vbiasp	vdd	vdd	P_1u L=2 W=20
M4n	vopb	vopb	0	0	N_1u L=1 W=10
M5n	n2	vopb	0	0	N_1u L=1 W=10
M6n	vomb	vomb	0	0	N_1u L=1 W=10
M7n	n1	vomb	0	0	N_1u L=1 W=10

M1D	vdp	vbiasp	vdd	vdd	P_1u L=1 W=20
M2D	nd1	vom	vdp	vdd	P_1u L=1 W=20
M3D	vdo	vop	vdp	vdd	P_1u L=1 W=20
M4D	nd1	nd1	0	0	N_1u L=1 W=10
M5D	vdo	nd1	0	0	N_1u L=1 W=10

MIN	out	vdo	0	0	N_1u L=1 W=10
MIP	out	vdo	vdd	vdd	P_1u L=1 W=20

.subckt bias	vbiasn	vbiasp	VDD
M1	Vbiasn	Vbiasn	0	0	N_1u L=2 W=10
M2	Vbiasp	Vbiasn	Vr	0	N_1u L=2 W=40
M3	Vbiasn 	Vbiasp	VDD	VDD	P_1u L=2 W=30
M4	Vbiasp	Vbiasp	VDD	VDD	P_1u L=2 W=30

Rbias	Vr	0	6.5k

MSU1	Vsur	Vbiasn	0	0	N_1u L=2   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_1u L=100 W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_1u L=1   W=10
.ends

.include cmosedu_models.txt   

.end
      