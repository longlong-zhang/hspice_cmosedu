*** Figure 14.7 CMOS: Circuit Design, Layout, and Simulation *** 

.option scale=50n post
.tran .1n 200n 

.ic v(vstor)=1

vdd	vdd	0	DC	1

M1	vstor	0	0	0	N_50n L=1 W=10

M2	vout2	vstor	0	0	N_50n L=1 W=10
M3	vout2	vstor	vdd	vdd	P_50n L=1 W=20
M4	vout3	vout2	0	0	N_50n L=1 W=10
M5	vout3	vout2	vdd	vdd	P_50n L=1 W=20

.include cmosedu_models.txt

.end
   

