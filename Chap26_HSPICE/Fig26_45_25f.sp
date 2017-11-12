*** Figure 26.45_25f CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 100p 90n 70n 100p UIC

VDD 	VDD	0	DC	1
vcm	vcm	0	DC	500m
vip	vip	0	DC	0	PULSE 700m 300m 0 500p 500p 4.5n 10n
vim	vim	0	DC	0	PULSE 300m 700m 0 500p 500p 4.5n 10n

Rf1	vop	vm	20k
Rf2	vom	vp	20k
Ri1	vip	vm	20k
Ri2	vim	vp	20k
Clr	vop	0	250f 
cll	vom	0	250f 

Vos	vp	vpos	DC	50m

xopamp	vop	vom	vpos	vm	VDD	vcm	opamp

.subckt opamp	vop	vom	vp	vm	VDD	vcm
Xbias	vbiasn	vbiasp	VDD	bias
Xdiffamp	vop1	vom1	vp	vm	vbiasn	cr	cl	vcm 	vdd	diffamp
Xbuffr	vop1	vom1	vom	vbiasn	vc	vcmfb	VDD	buff
Xbuffl	vom1	vop1	vop	vbiasn	vc	vcmfb	VDD	buff
cc1	vom	cr	25f
cc2	vop	cl	25f
xcmfb	vop	vom	vcm	vcmfb	vbiasp	vdd	cmfb
.ends

.subckt cmfb	vop	vom	vcm	vcmfb	vbiasp vdd	
Ra1	vop	vcma	20k
Ca1	vop	vcma	10f
Ra2	vom	vcma	20k
Ca2	vom	vcma	10f

Mp1	vss	vbiasp	VDD	VDD	P_50n L=1 W=20
Mp2	n1	vcma	vss	VDD	P_50n L=1 W=20
Mp3	vcmfb	vcm	vss	VDD	P_50n L=1 W=20
Mn1	n1	n1	0	0	N_50n L=1 W=10
Mn2	vcmfb	n1	0	0	N_50n L=1 W=10
.ends

.subckt	buff	vp	vm	vout	vbiasn	vc	vcmfb	VDD	
M1p	vout	vp	VDD	VDD	P_50n L=1 W=40
M2p	n1	vm	VDD	VDD	P_50n L=1 W=20	
M3n	n1	n1	n2	0	N_50n L=1 W=10
M4n	n2	vbiasn	0	0	N_50n L=1 W=40
M5n	vout	n1	vc	0	N_50n L=1 W=20
M6n	vc	vcmfb	0	0	N_50n L=1 W=80
.ends

.subckt	diffamp	vop	vom	vp	vm	vbiasn	n2R	n2L	vcm	vdd

M2R	n1t	vbiasn	0	0	N_50n L=1 W=10
M4R	n2R	vm	n1t	0	N_50n L=1 W=10
M6R	vop	n3	n2R	0	N_50n L=1 W=10
M8R	vop	vws	n4R	VDD	P_50n L=1 W=20
M10R	n4R	n3	VDD	VDD	P_50n L=1 W=20

M1R	n1ws	vbiasn	0	0	N_50n L=1 W=10
M1L	n1b	vbiasn	0	0	N_50n L=1 W=10
M3R	vws	vcm	n1ws	0	N_50n L=1 W=10
M3L	n2	vcm	n1b	0	N_50n L=1 W=10
M5L	n3	n3	n2	0	N_50n L=1 W=10
M7R	vws	vws	VDD	VDD	P_50n L=3 W=10
M7L	n3	vws	n4	VDD	P_50n L=1 W=20
M9L	n4	n3	VDD	VDD	P_50n L=1 W=20

M2L	n1t	vbiasn	0	0	N_50n L=1 W=10
M4L	n2L	vp	n1t	0	N_50n L=1 W=10
M6L	vom	n3	n2L	0	N_50n L=1 W=10
M8L	vom	vws	n4L	VDD	P_50n L=1 W=20
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
   

