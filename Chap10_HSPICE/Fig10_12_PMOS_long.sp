*** Figure 10.12_PMOS_long CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.ic v(vout)=0 v(vin)=5
.tran 10p 800p UIC

VDD	VDD	0	DC	5
Vin	vin	0	DC	0	pulse 5 0 200p 100p

M1	vout	vin	VDD	VDD	P_1u L=1 W=10	
cl	vout	0	50f	

.include cmosedu_models.txt

.end
      