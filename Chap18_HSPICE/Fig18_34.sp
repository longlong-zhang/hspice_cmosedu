*** Figure 18.34 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran	1n 1u UIC

VDD	VDD	0	DC	1
Vosc  	osc 	0   	DC 	0 	AC 	0 	PULSE(1 0 0 0 0 50ns 100ns)

M1inv	osci	osc	0	0	N_50n L=1 W=10
M2inv	osci	osc	VDD	VDD	P_50n L=1 W=20

M1 	VDD	VDD	A	0	N_50n L=1 W=10
M2	A	A	vout	0	N_50n L=1 W=10

C1	osci	A	1p
Cload	vout	0	1p  IC=0

.include cmosedu_models.txt    

.end
   
