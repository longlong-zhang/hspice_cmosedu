*** Figure 13.28 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 1.5n UIC

vdd	vdd	0	DC	1
Vin	in	0	DC	0	pulse 0 1 500p 0 0 500p 1n

M1	n1	in	0	0	N_50n L=1 W=10	
M2	n1	in	vdd	vdd	P_50n L=1 W=20

M3	out	n1	0	0	N_50n L=1 W=100	
M4	out	n1	vdd	vdd	P_50n L=1 W=200

Cl	out	0	50f

.include cmosedu_models.txt

.end
   

