*** Figure 10.19_PMOS CMOS: Circuit Design, Layout, and Simulation ***

*#destroy all
*#run
*#plot vout vin ylimit 0 1

.option scale=50n

.tran 10p 2.5n UIC

vdd	vdd	0	DC	1
Vin	vin	0	DC	0	pulse 1 0 500p 100p 100p 900p 2n

M1	vout	0	vin	VDD	P_50n L=1 W=20	
cl	vout	0	50f	IC=1

.include cmosedu_models.txt

.end
   

