*** Figure 20.27 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.tran 1m 1 sweep temp 0 100 25

VDD 	VDD	0	DC	5
Vop	Vop	0	DC	0
Von	VDD	Von	DC 	0
Vmeas1	Vmeas1	0	DC	0
Vmeas2	Vmeas2	0	DC	0

M1	Vref	Vref	Vmeas1	0	N_1u L=2 W=10
M2	Vbiasp	Vref	Vr	0	N_1u L=2 W=40
M3	Vref 	Vbiasp	VDD	VDD	P_1u L=2 W=30
M4	Vbiasp	Vbiasp	VDD	VDD	P_1u L=2 W=30

Rbias	Vr	vmeas2	5k TC1=0.002

MSU1	Vsur	Vref	0	0	N_1u L=2   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_1u L=100 W=10 
MSU3	Vbiasp	Vsur	Vbiasn	0	N_1u L=1   W=10

.include cmosedu_models.txt   

.end
      