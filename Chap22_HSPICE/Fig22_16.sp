*** Figure 22.16 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.ac dec 100 100k 1000MEG

VDD 	VDD	0	DC	1	

Vi1	Vi1	0	DC	0.7	AC 1
Vi2	Vi2	0	DC	0.7

Vc	Vc	0	DC	0.7	AC 1


Xbias	VDD Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas bias
X1	VDD	Vbias3	Vbias4	vc	vc	Ac	diff_amp
X2	VDD	Vbias3	Vbias4	vi1	vi2	Ad	diff_amp

.subckt diff_amp VDD	Vbias3	Vbias4 	vi1	vi2	vout

M1	vd1	vi1	vss	0	N_50n L=2 W=50
M2	vout	vi2	vss	0	N_50n L=2 W=50
MB1	Vdb1	Vbias4	0	0	N_50n L=2 W=100
MB2	vss	Vbias3	vdb1	0	N_50n L=2 W=100
M3	vd1	vd1	VDD	VDD	P_50n L=2 W=100
M4	vout	vd1	VDD	VDD	P_50n L=2 W=100

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
   

