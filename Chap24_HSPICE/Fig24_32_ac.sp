*** Figure 24.32_AC CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.ac dec 100 1k 1G

VDD 	VDD	0	DC	1	
Vin	Vin	0	DC	0.5	AC	1

Xopamp	VDD	vout	vin	vm	opamp
Rbig	vout	vm	1MEG
Cbig	vm	0	100u

Rl 	vout	0	1k
Cl	vout	0	10p


.subckt opamp VDD vout vp vm

Xbias	VDD Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas bias

M1B	n2	vm	n8	0	N_50n L=1 W=50
M1T	n6	n4	n2	0	N_50n L=1 W=50
M2B	n3	vp	n8	0	N_50n L=1 W=50
M2T	n1	n4	n3	0	N_50n L=1 W=50
MCM	n4	n4	n8	0	N_50n L=10 W=10
M6T	n8	Vbias3	n12	0	N_50n L=1 W=150
M6B	n12	Vbias4	0	0	N_50n L=1 W=150
M8T	n10	Vbias3	n11	0	N_50n L=1 W=50
M8B	n11	Vbias4	0	0	N_50n L=1 W=50
MFCN	n1	Vncas	n10	0	N_50n L=1 W=25
MON	vout	n10	0	0	N_50n L=1 W=500

M3B	n6	Vbias2	n5	VDD	P_50n L=1 W=100
M3T	n5	n6	VDD	VDD	P_50n L=1 W=100
M5T	n13	Vbias1	VDD	VDD	P_50n L=1 W=100
M5B	n4	Vbias2	n13	VDD	P_50n L=1 W=100
M4T	n7	n6	VDD	VDD	P_50n L=1 W=100
M4B	n1	Vbias2	n7	VDD	P_50n L=1 W=100
M9T	n9	n6	VDD	VDD	P_50n L=1 W=100
M9B	n1	Vbias2	n9	VDD	P_50n L=1 W=100
MFCP	n10	Vpcas	n1	VDD	P_50n L=1 W=50
MOP	vout	n1	VDD	VDD	P_50n L=1 W=1000

Cc	vout	n3	240f
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
   

