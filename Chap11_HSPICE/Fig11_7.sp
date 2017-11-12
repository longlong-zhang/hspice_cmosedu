*** Figure 11.7 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc vin 0 1 1m

vdd	vdd	0	DC	1
Vin	vin	0	DC	0	

M1	vout	vin	0	0	N_50n L=1 W=10	
M2	vout	vin	vdd	vdd	P_50n L=1 W=20

.include cmosedu_models.txt

.end
   

