*** Figure 20.16 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VDD 0 6 1m

VDD 	VDD	0	DC	5
Vop	Vop	0	DC	0
Von	VDD	Von	DC 	0
Vmeas1	Vmeas1	0	DC	0
Vmeas2	Vmeas2	0	DC	0

M1	Vbiasn	Vbiasn	Vmeas1	0	N_1u L=2 W=10
M2	Vbiasp	Vbiasn	Vr	0	N_1u L=2 W=40
M3	Vbiasn 	Vbiasp	VDD	VDD	P_1u L=2 W=30
M4	Vbiasp	Vbiasp	VDD	VDD	P_1u L=2 W=30

Rbias	Vr	vmeas2	6.5k

MSU1	Vsur	Vbiasn	0	0	N_1u L=2   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_1u L=100 W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_1u L=1   W=10

.include cmosedu_models.txt  

.end
      