*** Figure 19.74 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 500n UIC

VDD 	VDD	0	DC	1	
Vref	Vref	0	DC	0.5
Vnrz	NRZ	0	DC	0	PULSE 0 1 0 0 0 0.9n 2n

Xdline	VDD	vref	Vinvco	clocki	clock	outp	outm	dline
Xpb3	VDD	outp	clocki	inverter
Xpb2	VDD	outm	clock	inverter

Xh	VDD	NRZ	clock	up	down	hoggepd	

Xinv1	VDD	up	upi	inverter
Xinv2	VDD	down	downi	inverter

M2L	vnx	up	Vpup	VDD	P_50n L=1 W=20
M2R	vinvco	upi	vpup	VDD	P_50n L=1 W=20
M1L	vnx	downi	vndwn	0	N_50n L=1 W=10
M1R	vinvco	down	vndwn	0	N_50n L=1 W=10

Mpb	Vp	Vp	VDD	VDD	P_50n L=2 W=100
Ibias	Vp	Vn	DC	10u
Mnb	Vn	Vn	0	0	N_50n L=2 W=50

Mpup	Vpup	Vp	VDD	VDD	P_50n L=2 W=100
Mndwn	Vndwn	Vn	0	0	N_50n L=2 W=50

C1	vrc		0	3.5p 	
R1	vinvco	vrc	5k	
C2	vinvco	0	350f	

.subckt	hoggepd	VDD	NRZ	clock	incb	decb

X1	VDD	NRZ	di	inverter
X2	VDD	di	d	inverter
X4	VDD	clock	ci	inverter
X5	VDD	ci	c	inverter

M1t	n1t	d	VDD	VDD	P_50n L=1 W=20
M2t	n2t	c	n1t	VDD	P_50n L=1 W=20
M3t	n2t	d	0	0	N_50n L=1 W=10
M4t	n3t	c	VDD	VDD	P_50n L=1 W=20
M5t	n3t	n2t	n4t	0	N_50n L=1 W=10
M6t	n4t	c	0	0	N_50n L=1 W=10
M7t	Ai	n3t	VDD	VDD	P_50n L=1 W=20
M8t	Ai	c	n5t	0	N_50n L=1 W=10
M9t	n5t	n3t	0	0	N_50n L=1 W=10

X3	VDD	Ai	A	inverter
X7	VDD	A	Aii	inverter

M1b	n1b	A	VDD	VDD	P_50n L=1 W=20
M2b	n2b	ci	n1b	VDD	P_50n L=1 W=20
M3b	n2b	A	0	0	N_50n L=1 W=10
M4b	n3b	ci	VDD	VDD	P_50n L=1 W=20
M5b	n3b	n2b	n4b	0	N_50n L=1 W=10
M6b	n4b	ci	0	0	N_50n L=1 W=10
M7b	Bi	n3b	VDD	VDD	P_50n L=1 W=20
M8b	Bi	ci	n5b	0	N_50n L=1 W=10
M9b	n5b	n3b	0	0	N_50n L=1 W=10

X6	VDD	Bi	B	inverter
X8	VDD	B	Bii	inverter

M1xt	n6t	dii	VDD	VDD	P_50n L=1 W=20
M2xt	inc	diii	n6t	VDD	P_50n L=1 W=20
M3xt	inc	dii	n7t	0	N_50n L=1 W=10
M4xt	n7t	A	0	0	N_50n L=1 W=10
M5xt	n6t	A	VDD	VDD	P_50n L=1 W=20
M6xt	inc	Aii	n6t	VDD	P_50n L=1 W=20
M7xt	inc	diii	n8t	0	N_50n L=1 W=10
M8xt	n8t	Aii	0	0	N_50n L=1 W=10

M1xb	n6b	B	VDD	VDD	P_50n L=1 W=20
M2xb	dec	Bii	n6b	VDD	P_50n L=1 W=20
M3xb	dec	B	n7b	0	N_50n L=1 W=10
M4xb	n7b	A	0	0	N_50n L=1 W=10
M5xb	n6b	A	VDD	VDD	P_50n L=1 W=20
M6xb	dec	Aii	n6b	VDD	P_50n L=1 W=20
M7xb	dec	Bii	n8b	0	N_50n L=1 W=10
M8xb	n8b	Aii	0	0	N_50n L=1 W=10

X9	VDD	inc	inci	inverter
X10	VDD	inci	incb	inverter
X11	VDD	dec	deci	inverter
X12	VDD	deci	decb	inverter

X13	VDD	d	diii	inverter
cd	diii	0	100f
X14	VDD	diii	dii	inverter

.ends


.subckt dline	VDD	vref	vindel	inp	inm	outp	outm

Xbias	VDD	vref	vpbias	vrbias	vindel	dbias
X1	VDD	vpbias	vrbias	inp	inm	o1p	o1m	delay
X2	VDD	vpbias	vrbias	o1p	o1m	o2p	o2m	delay
X3	VDD	vpbias	vrbias	o2p	o2m	o3p	o3m	delay
X4	VDD	vpbias	vrbias	o3p	o3m	o4p	o4m	delay
X5	VDD	vpbias	vrbias	o4p	o4m	o5p	o5m	delay
X6	VDD	vpbias	vrbias	o5p	o5m	o6p	o6m	delay
X7	VDD	vpbias	vrbias	o6p	o6m	o7p	o7m	delay
X8t	VDD	vpbias		o7p	o7m	outp		delay_last
X8i	VDD	vpbias		o7m	o7p	outm		delay_last
.ends

.subckt	delay	VDD	vpbias	vrbias	vp	vm	vop	vom
M1	n1	vpbias	VDD	VDD	P_50n L=1 W=200
M2	vom	vp	n1	VDD	P_50n L=1 W=20
M3	vop	vm	n1	VDD	P_50n L=1 W=20
M4	vop	vrbias	0	0	N_50n L=1 W=10
M5	vop	vop	0	0	N_50n L=2 W=10
M6	vom	vrbias	0	0	N_50n L=1 W=10
M7	vom	vom	0	0	N_50n L=2 W=10
*model parasitic C
Clp	vop	0	5f
Clm	vom	0	5f
.ends

.subckt	delay_last	VDD	vpbias	vp	vm	vop
M1	n1	vpbias	VDD	VDD	P_50n L=1 W=200
M2	vom	vp	n1	VDD	P_50n L=1 W=20
M3	vop	vm	n1	VDD	P_50n L=1 W=20
M4	vop	vom	0	0	N_50n L=1 W=10
M6	vom	vom	0	0	N_50n L=1 W=10
.ends


.subckt dbias 	VDD	vref	vpbias	vrbias	vindel
M1	vpbias	vindel	vr	0	N_50n L=1 W=100
M2	vpbias	vpbias	VDD	VDD	P_50n L=1 W=20
M3	n1	vpbias	VDD	VDD	P_50n L=1 W=200
M4	n2	0	n1	VDD	P_50n L=1 W=20	
M5	n2	vrbias	0	0	N_50n L=1 W=10
M6	n2	n2	0	0	N_50n L=2 W=10
Rr	vr	0	10k
X1	VDD	n2	vref	vrbias	pdiff
.ends

.subckt	pdiff	VDD	Vp	Vm	vout	
M1	n1	vb	VDD	VDD	P_50n L=1 W=20
M2	vb	vp	n1	VDD	P_50n L=1 W=20
M3	vout	vm	n1	VDD	P_50n L=1 W=20
M4	vb	vb	0	0	N_50n L=1 W=10
M5	vout	vb	0	0	N_50n L=1 W=10
.ends


.subckt inverter	VDD	in	out	
M1	out	in	0	0	N_50n	L=1	W=10
M2	out	in	VDD	VDD	P_50n	L=1	W=20
.ends

.include cmosedu_models.txt    

.end
   

