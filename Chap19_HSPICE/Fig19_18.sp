*** Figure 19.18 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .1n 50n UIC
.ic v(osc)=0


VDD 	VDD	0	DC	1	
Vinvco	Vinvco	0	DC	0.5

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

X22	VDD	out21	osc	inverter


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
   

