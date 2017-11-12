*** Figure 13.21 CMOS: Circuit Design, Layout, and Simulation *** 

.option scale=50n post
.tran 10p 10n 10p UIC

vdd	vdd	0	DC	1
Vin	d	0	DC	0	PULSE 0 1 500p 0 0 700p 1.9n
Vclock	clock	0	DC	0	PULSE 0 1 0 0 0 1n 2n
Vclockb	clockb	0	DC	0	PULSE 1 0 0 0 0 1n 2n

x1	in	qbar	vdd	inv
X2	qbar	q	vdd	inv
X3	d	in	clock	clockb	vdd	tg
X4	in	q	clockb	clock	vdd	tg

.subckt	inv	in	out	VDD
M1	out	in	0	0	N_50n L=1 W=10
M2	out	in	vdd	vdd	P_50n L=1 W=20
.ends

.subckt	TG	in	out	s	sbar	VDD
M1	in	s	out	0	N_50n L=1 W=10
M2	in	sbar	out	vdd	P_50n L=1 W=20
.ends

.include cmosedu_models.txt

.end
   

