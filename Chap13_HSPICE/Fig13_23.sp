*** Figure 13.23 CMOS: Circuit Design, Layout, and Simulation *** 

.option scale=50n post
.tran 10p 10n 10p UIC

vdd	vdd	0	DC	1
Vin	d	0	DC	0	PULSE 0 1 300p 0 0 700p 1.9n
Vclock	clock	0	DC	0	PULSE 0 1 0 0 0 1.1n 2.2n
Vclockb	clockb	0	DC	0	PULSE 1 0 0 0 0 1.1n 2.2n

x11	in1	qbar1	vdd	inv
X21	qbar1	q1	vdd	inv
X31	d	in1	clockb	clock	vdd	tg
X41	q1	in1	clock	clockb	vdd	tg

x12	in2	q	vdd	inv
X22	q	qbar	vdd	inv
X32	qbar1	in2	clock	clockb	vdd	tg
X42	in2	qbar	clockb	clock	vdd	tg

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
   

