*** Figure 23.14 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VDD 0 1.2 1m temp 0 100 25

VDD 	VDD	0	DC	1 

M1	Vbiasn	Vbiasn	0	0	N_50n L=2 W=10
M2	Vref	Vref	Vr	0	N_50n L=2 W=40
M3	Vbiasn	Vbiasp	VDD	VDD	P_50n L=2 W=100
M4	Vref	Vbiasp	VDD	VDD	P_50n L=2 W=100

Rbias	Vr	0	5.5k 	TC1=0.002

*amplifier 
MA1	Vamp	Vref	0	0	N_50n L=2 W=10
MA2	Vbiasp	Vbiasn	0	0	N_50n L=2 W=10
MA3	Vamp	Vamp	VDD	VDD	P_50n L=2 W=100
MA4	Vbiasp	Vamp	VDD	VDD	P_50n L=2 W=100

*start-up stuff
MSU1	Vsur	Vbiasn	0	0	N_50n L=2   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_50n L=1   W=10

.include cmosedu_models.txt   

.end
   

