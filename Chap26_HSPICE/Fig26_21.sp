*** Figure 26.21 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc 	vin	450m 	550m 	1m

VDD 	VDD	0	DC	1
vcm	vcm	0	DC	500m
vin	vin	0	DC	500m

Xbias	vbiasn	vbiasp	VDD	bias

Xdiffamp	vop	vom	vin	vcm	vbiasn	vdd	diffamp

.subckt	diffamp	vop	vom	vp	vm	vbiasn	vdd

M1R	n1b	vbiasn	0	0	N_50n L=1 W=10
M2R	n1t	vbiasn	0	0	N_50n L=1 W=10
M3R	n2	vm	n1b	0	N_50n L=1 W=10
M4R	n2R	vm	n1t	0	N_50n L=1 W=10
M5R	n3	n3	n2	0	N_50n L=1 W=10
M6R	vop	n3	n2R	0	N_50n L=1 W=10
M7R	n3	vbiasn	n4	VDD	P_50n L=1 W=20
M8R	vop	vbiasn	n4R	VDD	P_50n L=1 W=20
M9R	n4	n3	VDD	VDD	P_50n L=1 W=20
M10R	n4R	n3	VDD	VDD	P_50n L=1 W=20

M1L	n1b	vbiasn	0	0	N_50n L=1 W=10
M2L	n1t	vbiasn	0	0	N_50n L=1 W=10
M3L	n2	vp	n1b	0	N_50n L=1 W=10
M4L	n2L	vp	n1t	0	N_50n L=1 W=10
M5L	n3	n3	n2	0	N_50n L=1 W=10
M6L	vom	n3	n2L	0	N_50n L=1 W=10
M7L	n3	vbiasn	n4	VDD	P_50n L=1 W=20
M8L	vom	vbiasn	n4L	VDD	P_50n L=1 W=20
M9L	n4	n3	VDD	VDD	P_50n L=1 W=20
M10L	n4L	n3	VDD	VDD	P_50n L=1 W=20

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
   

