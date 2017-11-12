*** Figure 24.52_AC CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.ac dec 100 10k 1G
*.op

VDD 	VDD	0	DC	1	
Vin	Vin	0	DC	0.5	AC	1

Xota	VDD	vout	vin	vm	opamp
Rbig	vout	vm	1MEG
Cbig	vm	0	1u

CL	vout	0	1p


.subckt opamp VDD vout vp vm

Xbias	VDD Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas bias
M1	vd1	vm	vss	0	N_50n L=1 W=50
M2	Vd2	vp	vss	0	N_50n L=1 W=50
M3LT	vss	vbias3	vd3lb	0	N_50n L=1 W=50
M3LB	vd3lb	vbias4	0	0	N_50n L=1 W=50
M3RT	vss	vbias3	vd3rb	0	N_50n L=1 W=50
M3RB	vd3rb	vbias4	0	0	N_50n L=1 W=50
M5L	vd1	vd7	VDD	VDD	P_50n L=1 W=100
M5R	vd1	vd7	VDD	VDD	P_50n L=1 W=100
M7	vd7	vbias2	vd1	VDD	P_50n L=1 W=100
M6L	vd2	vd7	VDD	VDD	P_50n L=1 W=100
M6R	vd2	vd7	VDD	VDD	P_50n L=1 W=100
M8	voutp	outn	vd2	VDD	P_50n L=1 W=100
M9	vd9	vbias3	vd11	0	N_50n L=1 W=50
M11	vd11	vd9	0	0	N_50n L=1 W=50
M10	voutn	outp	vd12	0	N_50n L=1 W=50
M12	vd12	vd9	0	0	N_50n L=1 W=50

MFCPR	voutn	vpcas	voutp	VDD	P_50n L=1 W=50
MFCNR	voutp	vncas	voutn	0	N_50n L=1 W=25
MOP	vout	voutp	VDD	VDD	P_50n L=1 W=100
MON	vout	voutn	0	0	N_50n L=1 W=50

cc	vout	vd12 	240f

MFCPL	vd9	vpcas	vd7	VDD	P_50n L=1 W=50
MFCNL	vd7	vncas	vd9	0	N_50n L=1 W=25

xnamp	VDD	vbias4	outn	vd1	vd2	namp
xpamp	VDD	vbias1	outp	vd11	vd12	pamp

.ends

.subckt	pamp	VDD	vbias1	vout	vp	vm 	
M1	vps	vbias1	VDD	VDD	P_50n L=2 W=100
M2	Vsp	vbias1	VDD	VDD	P_50n L=2 W=100
M3	Vms	vbias1	VDD	VDD	P_50n L=2 W=100
M4	0	vp	vps	VDD	P_50n L=2 W=100
M5	n1	vps	vsp	VDD	P_50n L=2 W=100
M6	vout	vms	vsp	VDD	P_50n L=2 W=100
M7	0	vm	vms	VDD	P_50n L=2 W=100
M8	n1	n1	0	0	N_50n L=2 W=50
M9	vout	n1	0	0	N_50n L=2 W=50
.ends

.subckt	namp	VDD	vbias4	vout	vp	vm
M1	VDD	vp	vps	0	N_50n L=2 W=50
M2	n1	n1	VDD	VDD	P_50n L=2 W=100
M3	vout	n1	VDD	VDD	P_50n L=2 W=100
M4	VDD	vm	vms	0	N_50n L=2 W=50
M5	n1	vps	vss	0	N_50n L=2 W=50
M6	vout	vms	vss	0	N_50n L=2 W=50
M7	vps	vbias4	0	0	N_50n L=2 W=50
M8	vss	vbias4	0	0	N_50n L=2 W=50
M9	vms	vbias4	0	0	N_50n L=2 W=50
.ends


.subckt bias VDD Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas

MP1	Vbias3	Vbiasp	VDD	VDD	P_50n L=2 W=100
MP2	Vbias4	Vbiasp 	VDD	VDD	P_50n L=2 W=100
MP3	vp1	vp2	VDD	VDD	P_50n L=2 W=100
MP4	vp2	Vbias2	vp1	VDD	P_50n L=2 W=100
MP5	Vpcas	Vpcas	vp2	VDD	P_50n L=2 W=100
MP6	Vbias2	Vbias2	VDD	VDD	P_50n L=10 W=20
MP7	Vhigh	Vbias1	VDD	VDD	P_50n L=2 W=100
MP8	Vbias1	Vbias2	Vhigh	VDD	P_50n L=2 W=100
MP9	vp3	Vbias1	VDD	VDD	P_50n L=2 W=100
MP10	Vncas	Vbias2	vp3	VDD	P_50n L=2 W=100

MN1	Vbias3	Vbias3	0	0	N_50n L=10 W=10
MN2	Vbias4	Vbias3	Vlow	0	N_50n L=2 W=50
MN3	Vlow	Vbias4	0	0	N_50n L=2 W=50
MN4	Vpcas	Vbias3	vn1	0	N_50n L=2 W=50
MN5	vn1	Vbias4	0	0	N_50n L=2 W=50
MN6	Vbias2	Vbias3	vn2	0	N_50n L=2 W=50
MN7	vn2	Vbias4	0	0	N_50n L=2 W=50
MN8	Vbias1	Vbias3	vn3	0	N_50n L=2 W=50
MN9	vn3	Vbias4	0	0	N_50n L=2 W=50
MN10	Vncas	Vncas	vn4	0	N_50n L=2 W=50
MN11	vn4	Vbias3	vn5	0	N_50n L=2 W=50
MN12	vn5	vn4	0	0	N_50n L=2 W=50

MBM1	Vbiasn	Vbiasn	0	0	N_50n L=2 W=50
MBM2	Vreg	Vreg	Vr	0	N_50n L=2 W=200
MBM3	Vbiasn	Vbiasp	VDD	VDD	P_50n L=2 W=100
MBM4	Vreg	Vbiasp	VDD	VDD	P_50n L=2 W=100

Rbias	Vr	0	5.5k

*amplifier 
MA1	Vamp	Vreg	0	0	N_50n L=2 W=50
MA2	Vbiasp	Vbiasn	0	0	N_50n L=2 W=50
MA3	Vamp	Vamp	VDD	VDD	P_50n L=2 W=100
MA4	Vbiasp	Vamp	VDD	VDD	P_50n L=2 W=100

MCP	VDD	Vbiasp	VDD	VDD	P_50n L=100 W=100

*start-up stuff
MSU1	Vsur	Vbiasn	0	0	N_50n L=2   W=50
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_50n L=1   W=10

.ends

.include cmosedu_models.txt   

.end
   

