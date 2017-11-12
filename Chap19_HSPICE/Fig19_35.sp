*** Figure 19.35 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 1n 1500n UIC
.ic v(clock)=0


VDD 	VDD	0	DC	1	
vdata	data	0	DC	0	pulse 0 1 0 0 0 10n 20n

XPD	VDD	data	dclock 	up	down	pfd
Xvco	VDD	Vinvco	clock 	VCO
Xdiv	VDD	clock	dclock	dby2

Xinv1	VDD	up	upi	inverter
Mp	vpdtri	upi	VDD	VDD	P_50n L=1 W=20
Mn	vpdtri	down	0	0	N_50n L=1 W=10
R1	vpdtri	vinvco	42.5k
C1	vinvco	vrc	10p
R2	vrc	0	20k


.subckt	dby2	VDD	clock	dclock
M1	n1	dclock	VDD	VDD	P_50n L=1 W=20
M2	n2	clock	n1	VDD	P_50n L=1 W=20
M3	n2	dclock	0	0	N_50n L=1 W=10
M4	n3	clock	VDD	VDD	P_50n L=1 W=20
M5	n4	n2	n3	0	N_50n L=1 W=10
M6	n4	clock	0	0	N_50n L=1 W=10
M7	dclock	n3	VDD	VDD	P_50n L=1 W=20
M8	dclock	clock	n5	0	N_50n L=1 W=10
M9	n5	n3	0	0	N_50n L=1 W=10
.ends

.subckt VCO VDD Vinvco clock

M5	vn	Vn	0	0	N_50n L=1 W=10
M6	vn	vp	VDD	VDD	P_50n L=1 W=20
M5R	vp	Vinvco	Vr	0	N_50n L=1 W=100
Rset	Vr	0	10k
M6R	vp	vp	VDD	VDD	P_50n L=1 W=20

X1	VDD	Vn	Vp	out21	out1	VCOstage
X2	VDD	Vn	Vp	out1	out2	VCOstage
X3	VDD	Vn	Vp	out2	out3	VCOstage
X4	VDD	Vn	Vp	out3	out4	VCOstage
X5	VDD	Vn	Vp	out4	out5	VCOstage
X6	VDD	Vn	Vp	out5	out6	VCOstage
X7	VDD	Vn	Vp	out6	out7	VCOstage
X8	VDD	Vn	Vp	out7	out8	VCOstage
X9	VDD	Vn	Vp	out8	out9	VCOstage
X10	VDD	Vn	Vp	out9	out10	VCOstage
X11	VDD	Vn	Vp	out10	out11	VCOstage
X12	VDD	Vn	Vp	out11	out12	VCOstage
X13	VDD	Vn	Vp	out12	out13	VCOstage
X14	VDD	Vn	Vp	out13	out14	VCOstage
X15	VDD	Vn	Vp	out14	out15	VCOstage
X16	VDD	Vn	Vp	out15	out16	VCOstage
X17	VDD	Vn	Vp	out16	out17	VCOstage
X18	VDD	Vn	Vp	out17	out18	VCOstage
X19	VDD	Vn	Vp	out18	out19	VCOstage
X20	VDD	Vn	Vp	out19	out20	VCOstage
X21	VDD	Vn	Vp	out20	out21	VCOstage

X22	VDD	out21	clock	inverter
.ends


.subckt	VCOstage	VDD	Vn	Vp	in	out
M1	vd1	vn	0	0	N_50n 	L=1	W=10
M2	out	in	Vd1	0	N_50n 	L=1	W=10
M3	out	in	Vd4	VDD	P_50n	L=1	W=20
M4	Vd4	vp	VDD	VDD	P_50n	L=1	W=20
*model parasitic C
Cl	out	0	2f
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
   

