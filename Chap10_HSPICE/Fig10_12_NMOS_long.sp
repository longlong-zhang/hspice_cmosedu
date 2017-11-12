*** Figure 10.12_NMOS_long CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.ic v(vout)=5
.tran 10p 600p UIC

Vin	vin	0	DC	0	pulse 0 5 200p 100p

M1	vout	vin	0	0	N_1u L=1 W=10	
cl	vout	0	50f

.include cmosedu_models.txt

.end
      