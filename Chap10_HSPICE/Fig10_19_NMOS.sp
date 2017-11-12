*** Figure 10.19_NMOS CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.tran 10p 2.5n UIC

vdd	vdd	0	DC	1
Vin	vin	0	DC	0	pulse 0 1 500p 100p 100p 900p 2n

M1	vout	vdd	vin	0	N_50n L=1 W=10	
cl	vout	0	50f

.include cmosedu_models.txt

.end
   

