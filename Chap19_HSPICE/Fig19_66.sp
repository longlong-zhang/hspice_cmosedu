*** Figure 19.66 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 20n UIC

VDD 	VDD	0	DC	1	
Vref	Vref	0	DC	0.5
Vin	Vin	0	DC	0	pulse 0 1 0 50p 50p 0.2n 0.5n

Xdline	VDD	vref	Vindel	vind	vini	outp	outm	dline
Xtg	VDD	0	VDD	vin	vind	tg
Xin	VDD	vin	vini	inverter
Xpb3	VDD	outp	outmb	inverter
Xpb2	VDD	outm	outpb	inverter

Xpfd	VDD	vin	outpb	up 	down	pfd

Xinv1	VDD	up	upi	inverter
Xinv2	VDD	down	downi	inverter

M2L	vnx	up	Vpup	VDD	P_50n L=1 W=20
M2R	vindel	upi	vpup	VDD	P_50n L=1 W=20
M1L	vnx	downi	vndwn	0	N_50n L=1 W=10
M1R	vindel	down	vndwn	0	N_50n L=1 W=10

Mpb	Vp	Vp	VDD	VDD	P_50n L=2 W=100
Ibias	Vp	Vn	DC	10u
Mnb	Vn	Vn	0	0	N_50n L=2 W=50

Mpup	Vpup	Vp	VDD	VDD	P_50n L=2 W=100
Mndwn	Vndwn	Vn	0	0	N_50n L=2 W=50

C1	vindel	0	5p	IC=300m

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

.subckt	tg	VDD	pg	ng	in	out
M1	out	pg	in	VDD	P_50n L=1 W=20
M2	out	ng	in	0	N_50n L=1 W=10
.ends

.subckt buffer	VDD	Vinm	Vinp	Vout
M1p	Vomp	Vinm	Vppp	VDD	P_50n L=1 W=20
M2p 	Vop	Vinp	Vppp 	VDD	P_50n L=1 W=20
M6p	Vppp	Vomp	VDD	VDD	P_50n L=1 W=20

M3p	Vomp	Vomp	0	0	N_50n L=1 W=10
M4p	Vop	Vomp	0	0	N_50n L=1 W=10

MI1	Vout	Vop	0	0	N_50n L=1 W=10
MI2	Vout	Vop	VDD 	VDD	P_50n L=1 W=20

M1 	Vom	Vinm	Vnn	0	N_50n L=1 W=10
M2	Vop	Vinp	Vnn	0	N_50n L=1 W=10
M6	Vnn	Vom	0	0	N_50n L=1 W=10

M3	Vom	Vom	VDD 	VDD	P_50n L=1 W=20
M4	Vop	Vom	VDD	VDD	P_50n L=1 W=20
.ends

.subckt	pfd	VDD	data	dclock	up 	down
X1	VDD	data	n1	inverter
X2	VDD	n1	n5	n2	nand
X3	VDD	n2	n3	inverter
X4	VDD	n3	n4	inverter
X5	VDD	n4	n6	reset	n5	nand3
X6	VDD	n5	up	inverter
X7	VDD	n2	n7	n6	nand
X8	VDD	n6	reset	n7	nand
X9	VDD	reset	n8	n9	nand
X10	VDD	n9	n11	n8	nand
X11	VDD	n6	n2	n11	n8	reset	nand4
X12	VDD	dclock	n10	inverter
X13	VDD	n10	n14	n11	nand
X14	VDD	n11	n12	inverter
X15	VDD	n12	n13	inverter
X16	VDD	reset	n8	n13	n14	nand3
X17	VDD	n14	down	inverter
.ends

.subckt nand	VDD	A	B	ANANDB
M1	n1	A	0	0	N_50n	L=1 	W=10
M2	ANANDB	B	n1	0	N_50n 	L=1	W=10
M3	ANANDB	A	VDD	VDD	P_50n	L=1	W=20
M4	ANANDB	B	VDD	VDD	P_50n	L=1	W=20
.ends

.subckt inverter	VDD	in	out	
M1	out	in	0	0	N_50n	L=1	W=10
M2	out	in	VDD	VDD	P_50n	L=1	W=20
.ends

.subckt nand3	VDD	A	B	C	OUT
M1	n1	A	0	0	N_50n	L=1 	W=10
M2	n2	B	n1	0	N_50n 	L=1	W=10
M3	OUT	C	n2	0	N_50n 	L=1	W=10
M4	OUT	A	VDD	VDD	P_50n	L=1	W=20
M5	OUT	B	VDD	VDD	P_50n	L=1	W=20
M6	OUT	C	VDD	VDD	P_50n	L=1	W=20
.ends

.subckt nand4	VDD	A	B	C	D	OUT
M1	n1	A	0	0	N_50n	L=1 	W=10
M2	n2	B	n1	0	N_50n 	L=1	W=10
M3	n3	C	n2	0	N_50n 	L=1	W=10
M4	OUT	D	n3	0	N_50n	L=1	W=10
M5	OUT	A	VDD	VDD	P_50n	L=1	W=20
M6	OUT	B	VDD	VDD	P_50n	L=1	W=20
M7	OUT	C	VDD	VDD	P_50n	L=1	W=20
M8	OUT	D	VDD	VDD	P_50n	L=1	W=20
.ends

.include cmosedu_models.txt    

.end
   

