*** Figure 20.20 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VDD 0 1.1 1m
**.tran 1n 100n

VDD 	VDD	0	DC	1 pulse 0 1 10n 100n 0
Vop	Vop	0	DC	0
Von	VDD	Von	DC 	0
Vmeas1	Vmeas1	0	DC	0
Vmeas2	Vmeas2	0	DC	0

M1	Vbiasn	Vbiasn	Vmeas1	0	N_50n L=2 W=50
M2	Vreg	Vbiasn	Vr	0	N_50n L=2 W=200
M3	Vbiasn	Vbiasp	VDD	VDD	P_50n L=2 W=100
M4	Vreg	Vbiasp	VDD	VDD	P_50n L=2 W=100

Ereg	Vbiasp	0	Vreg	Vbiasn	10

Rbias	Vr	vmeas2	5.5k

MSU1	Vsur	Vbiasn	0	0	N_50n L=2   W=50
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_50n L=1   W=10

.include cmosedu_models.txt   

.end
   

