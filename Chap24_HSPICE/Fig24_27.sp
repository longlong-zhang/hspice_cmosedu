*** Figure 24.27 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.ac dec 100 1 1G

VDD 	VDD	0	DC	1
vneg	vneg	0	DC	0	

Vp	Vin	0	DC	0.5	AC	1

Rbig	Vout	Vm	100MEG
Cbig	Vm	0	100u
xaol	VDD	vneg	vin	vm	vout	opamp

VDDp	VDDp	0	DC	1	AC	1
vpp	vpp	0	DC	500m	
Rbp	vop	vmp	100MEG
Cbp	vmp	0	100u
xpsrr	VDDp	vneg	vpp	vmp	vop	opamp 

xmsrr	VDD	vnegm	vpm	vmm	vom	opamp
Rbm	vom	vmm	100MEG
Cbm	vmm	0	100u
vnegm	vnegm	0	DC	0	AC	1
vpm	vpm	0	DC	500m

.subckt opamp	VDD	Vneg	vp	vm	vout
Cc	Vout	Vout1	2400f

M1	vd1	vm	vss	vneg	N_50n L=2 W=50
M2	vout1	vp	vss	vneg	N_50n L=2 W=50
M6B	Vdb1	Vbias4	vneg	vneg	N_50n L=2 W=100
M6T	vss	Vbias3	vdb1	vneg	N_50n L=2 W=100
M3	vd1	vd1	VDD	VDD	P_50n L=2 W=100
M4	vout1	vd1	VDD	VDD	P_50n L=2 W=100

M7	vout	Vout1	VDD	VDD	P_50n L=2 W=100
M8T	Vout	vbias3	vd8b	vneg	N_50n L=2 W=50
M8B	vd8b	vbias4	vneg	vneg	N_50n L=2 W=50


Xbias	VDD vneg Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas bias
.ends


.subckt bias VDD vneg Vbias1 Vbias2 Vbias3 Vbias4 Vhigh Vlow Vncas Vpcas

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

MN1	Vbias3	Vbias3	vneg	vneg	N_50n L=10 W=10
MN2	Vbias4	Vbias3	Vlow	vneg	N_50n L=2 W=50
MN3	Vlow	Vbias4	vneg	vneg	N_50n L=2 W=50
MN4	Vpcas	Vbias3	vn1	vneg	N_50n L=2 W=50
MN5	vn1	Vbias4	vneg	vneg	N_50n L=2 W=50
MN6	Vbias2	Vbias3	vn2	vneg	N_50n L=2 W=50
MN7	vn2	Vbias4	vneg	vneg	N_50n L=2 W=50
MN8	Vbias1	Vbias3	vn3	vneg	N_50n L=2 W=50
MN9	vn3	Vbias4	vneg	vneg	N_50n L=2 W=50
MN10	Vncas	Vncas	vn4	vneg	N_50n L=2 W=50
MN11	vn4	Vbias3	vn5	vneg	N_50n L=2 W=50
MN12	vn5	vn4	vneg	vneg	N_50n L=2 W=50

MBM1	Vbiasn	Vbiasn	vneg	vneg	N_50n L=2 W=50
MBM2	Vreg	Vreg	Vr	vneg	N_50n L=2 W=200
MBM3	Vbiasn	Vbiasp	VDD	VDD	P_50n L=2 W=100
MBM4	Vreg	Vbiasp	VDD	VDD	P_50n L=2 W=100

Rbias	Vr	vneg	5.5k

*amplifier 
MA1	Vamp	Vreg	vneg	vneg	N_50n L=2 W=50
MA2	Vbiasp	Vbiasn	vneg	vneg	N_50n L=2 W=50
MA3	Vamp	Vamp	VDD	VDD	P_50n L=2 W=100
MA4	Vbiasp	Vamp	VDD	VDD	P_50n L=2 W=100

MCP	VDD	Vbiasp	VDD	VDD	P_50n L=100 W=100

*start-up stuff
MSU1	Vsur	Vbiasn	vneg	vneg	N_50n L=2   W=50
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	vneg	N_50n L=1   W=10

.ends

.include cmosedu_models.txt   

.end
   

