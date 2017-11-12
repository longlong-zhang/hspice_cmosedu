*** Figure 11.4_long CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc vin 0 5 1m

vdd	vdd	0	DC	5
Vin	vin	0	DC	0

M1	vout	vin	0	0	N_1u L=1 W=10	
M2	vout	vin	vdd	vdd	P_1u L=1 W=10

.include cmosedu_models.txt

.end
      