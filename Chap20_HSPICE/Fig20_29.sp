*** Figure 20.29 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc Vo 0.2 5 1m

VDD 	VDD	0	DC	5
Vo	Vo	0	DC	0

X1	VDD	Vbiasp	Vbiasn	bmrefl

M1	Vd1	Vd1	0	0	N_1u L=2 W=10
M2	Vd2	Vd1	0	0	N_1u L=2 W=10
M3	Vd3	Vd3	Vd1	0	N_1u L=2 W=10
M4	Vo	Vd3	Vd2	0	N_1u L=2 W=10
M5	Vd3	Vbiasp	VDD	VDD	P_1u L=2 W=30

.subckt bmrefl VDD Vbiasp Vbiasn
M1	Vbiasn	Vbiasn	0	0	N_1u L=2 W=10
M2	Vbiasp	Vbiasn	Vr	0	N_1u L=2 W=40
M3	Vbiasn 	Vbiasp	VDD	VDD	P_1u L=2 W=30
M4	Vbiasp	Vbiasp	VDD	VDD	P_1u L=2 W=30

Rbias	Vr	0	6.5k

MSU1	Vsur	Vbiasn	0	0	N_1u L=2   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_1u L=100 W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_1u L=1   W=10
.ends

.include cmosedu_models.txt  

.end
      