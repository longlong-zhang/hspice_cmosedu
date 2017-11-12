*** Figure 11.11 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 2n UIC

vdd	vdd	0	DC	1
Vin	vin	0	DC	0	pulse 0 1 500p 0 0 1n 2n

M1	vout	vin	0	0	N_50n L=1 W=10	
M2	vout	vin	vdd	vdd	P_50n L=1 W=20

Cl	vout	0	50f

.include cmosedu_models.txt

.end
   

