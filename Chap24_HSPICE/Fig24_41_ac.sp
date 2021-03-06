*** Figure 24.41 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.ac dec 100 100 1G

VDD 	VDD	0	DC	1	
Vin	Vin	0	DC	0.5	AC	1

Xo	VDD	vout	vin	vm	ota
Rbig	vout	vm	100MEG
Cbig	vm	0	10u

CL	vout	0	1p


.subckt ota VDD vout vp vm

Xbias	VDD Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas bias
M1	vd1	vp	vss	0	N_50n L=2 W=50
M2	vd2	vm	vss	0	N_50n L=2 W=50
M31t	vd31t	vd1	VDD	VDD	P_50n L=2 W=100
M31b	vd1	Vbias2	vd31t	VDD	P_50n L=2 W=100
M3t	vd3t	vd1	VDD	VDD	P_50n L=2 W=100
M3b	vd3b	Vbias2	vd3t	VDD	P_50n L=2 W=100
M51t	vd3b	vbias3	vd51b	0	N_50n L=2 W=50
M51b	vd51b	vd3b	0	0	N_50n L=2 W=50
M41t	vd41t	vd2	VDD	VDD	P_50n L=2 W=100
M41b	vd2	vbias2	vd41t	VDD	P_50n L=2 W=100
M4t	vd4t	vd2	VDD	VDD	P_50n L=2 W=100
M4b	voutp	vbias2	vd4t	VDD	P_50n L=2 W=100
M5t	voutn	vbias3	vd5b	0	N_50n L=2 W=50
M5b	vd5b	vd3b	0	0	N_50n L=2 W=50
M6tr	vss	vbias3	vd6br	0	N_50n L=2 W=50
M6br	vd6br	vbias4	0	0	N_50n L=2 W=50
M6tl	vss	vbias3	vd6bl	0	N_50n L=2 W=50
M6bl	vd6bl	vbias4	0	0	N_50n L=2 W=50
MFCP	voutn	vpcas	voutp	VDD	P_50n L=2 W=50
MFCN	Voutp	vncas	voutn	0	N_50n L=2 W=25
MOP	Vout	voutp	VDD	VDD	P_50n L=2 W=100
MON	Vout	voutn	0	0	N_50n L=2 W=50
Cc	Vout	vd5b	240f
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
   

