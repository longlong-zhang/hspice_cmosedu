*** Figure 10.12_PMOS_short CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.ic v(vout)=0 v(vin)=1
.tran 10p 800p UIC

VDD	VDD	0	DC	1
Vin	vin	0	DC	0	pulse 1 0 200p 100p

M1	vout	vin	VDD	VDD	P_50n L=1 W=10	
cl	vout	0	50f	

.include cmosedu_models.txt

.end
   

