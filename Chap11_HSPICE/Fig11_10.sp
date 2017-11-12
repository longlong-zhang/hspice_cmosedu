*** Figure 11.10 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 1p 250p UIC

vdd	vdd	0	DC	1
vin	vin	0	DC	0	pulse 0 1 50p 0 0 100p 200p

M1	vout	vin	0	0	N_50n L=1 W=10	
M2	vout	vin	vdd	vdd	P_50n L=1 W=20

.include cmosedu_models.txt

.end
   

