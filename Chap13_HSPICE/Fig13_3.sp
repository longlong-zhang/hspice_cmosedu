*** Figure 13.3 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 1n 10p

vdd	vdd	0	DC	1
Vin	vin	0	DC	0	pulse	0 1 200p 0 0 0.5n 4n

x1	vin	out	vdd	0	vdd	TG
cl	out	0	50f

.subckt	TG	in	out	s	sbar	VDD
M1	in	s	out	0	N_50n L=1 W=10
M2	in	sbar	out	vdd	P_50n L=1 W=20
.ends

.include cmosedu_models.txt

.end
   

