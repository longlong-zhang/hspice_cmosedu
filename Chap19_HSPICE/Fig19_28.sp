*** Figure 19.28 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .1n 600n UIC
.ic v(clock)=0


VDD 	VDD	0	DC	1	
vdata	data	0	DC	0	pulse 0 1 0 0 0 10n 80n

XPD	VDD	data	dclock 	outpd	XORPD
Xvco	VDD	Vinvco	clock 	VCO
Xdiv	VDD	clock	dclock	dby2

Rf	outpd	Vinvco 	1k
Cf	Vinvco	0	2.5p 	ic=0.5

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

.subckt XORPD	VDD	A	B	outpd
M1	Ai	A	VDD	VDD	P_50n L=1 W=20
M2	Ai	A	0	0	N_50n L=1 W=10
M3	Bi	B	VDD	VDD	P_50n L=1 W=20
M4	Bi	B	0	0	N_50n L=1 W=10

M5	n1	A	VDD	VDD	P_50n L=1 W=20
M6	outpd	Ai	n1	VDD	P_50n L=1 W=20
M7	n1	B	VDD	VDD	P_50n L=1 W=20
M8	outpd	Bi	n1	VDD	P_50n L=1 W=20

M9	outpd	A	n2	0	N_50n L=1 W=10
M10	n2	B	0	0	N_50n L=1 W=10
M11	outpd	Ai	n3	0	N_50n L=1 W=10
M12	n3	Bi	0	0	N_50n L=1 W=10
.ends


.subckt VCO VDD Vinvco clock

M5	vn	Vn	0	0	N_50n L=1 W=10
M6	vn	vp	VDD	VDD	P_50n L=1 W=20
Rlow	vp	0	30k
M5R	vp	Vinvco	Vr	0	N_50n L=1 W=100
Rrange	Vr	0	100k
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
M1	vd1	Vn	0	0	N_50n 	L=1	W=10
M2	out	in	Vd1	0	N_50n 	L=1	W=10
M3	out	in	Vd4	VDD	P_50n	L=1	W=20
M4	Vd4	vp	VDD	VDD	P_50n	L=1	W=20
*model parasitic C
Cl	out	0	2f
.ends

.subckt inverter	VDD	in	out	
M1	out	in	0	0	N_50n	L=1	W=10
M2	out	in	VDD	VDD	P_50n	L=1	W=20
.ends

.include cmosedu_models.txt    

.end
   

