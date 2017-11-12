*** Figure 13.19 CMOS: Circuit Design, Layout, and Simulation *** 

.option scale=50n post
.tran 10p 10n 10p UIC

vdd	vdd	0	DC	1
Vin	d	0	DC	0	PULSE 0 1 500p 0 0 700p 1.9n
Vclock	clock	0	DC	0	PULSE 0 1 0 0 0 1n 2n

x1	in	out	vdd	inv
X2	out	in	vdd	invl
X3	out	q	vdd	inv
M1	d	clock	in	0	N_50n L=1 W=10

.subckt	inv	in	out	VDD
M1	out	in	0	0	N_50n L=1 W=10
M2	out	in	vdd	vdd	P_50n L=1 W=10
.ends

.subckt	invl	in	out	VDD
M1	out	in	0	0	N_50n L=10 W=10
M2	out	in	vdd	vdd	P_50n L=10 W=10
.ends

.include cmosedu_models.txt 

.end
   

