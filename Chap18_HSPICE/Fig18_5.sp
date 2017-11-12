*** Figure 18.5 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .1n 200n

VDD	VDD	0	DC	1
Vin	Vin	0	DC	0 PULSE 0 1 0 100n 100n 1n

M1	Vxn	Vin	0	0	N_50n L=1 W=10
M2	Vout	Vin	Vxn	0	N_50n L=1 W=10
M3	VDD	Vout	Vxn	0	N_50n L=1 W=22.5

M4	Vout	Vin	Vxp	VDD	P_50n L=1 W=20
M5	Vxp	Vin	VDD	VDD	P_50n L=1 W=26
M6	0	Vout	Vxp	VDD	P_50n L=1 W=20

.include cmosedu_models.txt   

.end
   
