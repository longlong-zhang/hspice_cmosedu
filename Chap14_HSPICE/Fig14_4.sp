*** Figure 14.4 CMOS: Circuit Design, Layout, and Simulation *** 

.option scale=50n post
.tran 10n 40u UIC

M1	vout1	0	0	0	N_50n L=1 W=10
vmeas	vout1	vout	DC	0
Cl	vout	0	50f	IC=1

.include cmosedu_models.txt

.end
   

