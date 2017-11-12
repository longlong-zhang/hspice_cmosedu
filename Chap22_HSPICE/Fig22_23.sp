*** Figure 22.23 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc Vi1 3 4 1m
**.op

VDD 	VDD	0	DC	5	
Vi1	vi1	0	DC	3.5	
Vi2	vi2	0	DC	3.5
vid1	VDD	vd1	DC	0
Vid2	VDD	vd2	DC	0

M1	Vd1	vi1	vs1	0	N_1u L=2 W=10
M2	Vd2	vi2	vs2	0	N_1u L=2 W=10
M3	0	vb2	vs1	VDD	P_1u L=2 W=30
M4	0	vb1	vs2	VDD	P_1u L=2 W=30

M11	VDD	vi1	vs11	0	N_1u L=2 W=10
M41	vb1	vb1	vs11	VDD	P_1u L=2 W=30
MB1	vb1	Vbias3	vdb1	0	N_1u L=2 W=10
MB2	vdb1	vbias4	0	0	N_1u L=2 W=10

M21	VDD	vi2	vs22	0	N_1u L=2 W=10
M31	vb2	vb2	vs22	VDD	P_1u L=2 W=30
MB3	vb2	Vbias3	vdb2	0	N_1u L=2 W=10
MB4	vdb2	vbias4	0	0	N_1u L=2 W=10

Xbias	VDD Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas bias

.subckt bias VDD Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas

MN1	Vbias2	Vbiasn	0	0	N_1u L=2 W=10
MN2	Vbias1	Vbiasn	0	0	N_1u L=2 W=10
MN3	Vncas	Vncas	vn1	0	N_1u L=2 W=10
MN4	vn1	Vbias3	vn2	0	N_1u L=2 W=10
MN5	vn2	vn1	0	0	N_1u L=2 W=10
MN6	Vbias3	Vbias3	0	0	N_1u L=10 W=10
MN7	Vbias4	Vbias3	Vlow	0	N_1u L=2 W=10
MN8	Vlow	Vbias4	0	0	N_1u L=2 W=10
MN9	Vpcas	Vbias3	vn3	0	N_1u L=2 W=10
MN10	vn3	Vbias4	0	0	N_1u L=2 W=10

MP1	Vbias2	Vbias2	VDD	VDD	P_1u L=10 W=30
MP2	Vhigh	Vbias1	VDD	VDD	P_1u L=2 W=30
MP3	Vbias1	Vbias2	Vhigh	VDD	P_1u L=2 W=30
MP4	vp1	Vbias1	VDD	VDD	P_1u L=2 W=30
MP5	Vncas	Vbias2	vp1	VDD	P_1u L=2 W=30
MP6	vp2	Vbias1	VDD	VDD	P_1u L=2 W=30
MP7	Vbias3	Vbias2	vp2	VDD	P_1u L=2 W=30
MP8	vp3	Vbias1	VDD	VDD	P_1u L=2 W=30
MP9	Vbias4	Vbias2	vp3	VDD	P_1u L=2 W=30
MP10	vp4	vp5	VDD	VDD	P_1u L=2 W=30
MP11	vp5	Vbias2	vp4	VDD	P_1u L=2 W=30
MP12	Vpcas	Vpcas	vp5	VDD	P_1u L=2 W=30

MBM1	Vbiasn	Vbiasn	0	0	N_1u L=2 W=10
MBM2	Vbiasp	Vbiasn	Vr	0	N_1u L=2 W=40
MBM3	Vbiasn 	Vbiasp	VDD	VDD	P_1u L=2 W=30
MBM4	Vbiasp	Vbiasp	VDD	VDD	P_1u L=2 W=30

Rbias	Vr	0	6.5k

MSU1	Vsur	Vbiasn	0	0	N_1u L=2   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_1u L=100 W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_1u L=1   W=10

.ends

.include cmosedu_models.txt  

.end
      