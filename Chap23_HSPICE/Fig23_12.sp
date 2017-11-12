*** Figure 23.12 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VDD 0 1.5 1m

VDD 	VDD	0	DC	1
Vop	Vop	0	DC	0
Von	VDD	Von	DC 	0
Vmeas1	Vmeas1	0	DC	0
Vmeas2	Vmeas2	0	DC	0

M1B	Vbiasn	Vbiasn	Vmeas1	0	N_50n L=2 W=50
M2B	n2	Vbiasn	Vr	0	N_50n L=2 W=200
M1T	vncas	vncas	vbiasn	0	N_50n L=2 W=50
M2T	vpcas	vncas	n2	0	N_50n L=2 W=50
M3T	n1 	Vbiasp	VDD	VDD	P_50n L=2 W=100
M4T	Vbiasp	Vbiasp	VDD	VDD	P_50n L=2 W=100
M3B	vncas	Vpcas	n1	VDD	P_50n L=2 W=100
M4B	Vpcas	Vpcas	Vbiasp	VDD	P_50n L=2 W=100

Rbias	Vr	vmeas2	6.5k

MSU1	Vsur	Vbiasn	0	0	N_50n L=2   W=50
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_50n L=1   W=10

.include cmosedu_models.txt   

.end
   

