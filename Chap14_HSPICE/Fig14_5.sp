*** Figure 14.5 CMOS: Circuit Design, Layout, and Simulation *** 

.option scale=50n post
.tran 10n 40u UIC

vddby2	vddby2	0	DC	500m


M1	vout1	0	vddby2	0	N_50n L=1 W=10
vmeas	vout1	vout	DC	0
Cl	vout	0	50f	IC=1

.include cmosedu_models.txt

.end
   

