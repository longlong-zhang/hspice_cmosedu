*** Figure 10.12_NMOS_short CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.ic v(vout)=1
.tran 10p 1000p UIC

Vin	vin	0	DC	0	pulse 0 1 200p 100p

M1	vout	vin	0	0	N_50n L=1 W=10	
cl	vout	0	50f

.include cmosedu_models.txt

.end
   

