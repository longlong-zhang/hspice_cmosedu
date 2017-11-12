*** Figure 13.4 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 1n 10p UIC
.ic v(out)=1

vdd	vdd	0	DC	1
Vs	s	0	DC	0	pulse	0 1 200p 0 0 2n 4n
Vsbar	sbar	0	DC	0	pulse	1 0 200p 0 0 2n 4n

x1	0	out	s	sbar	vdd	TG
cl	out	0	50f

.subckt	TG	in	out	s	sbar	VDD
M1	in	s	out	0	N_50n L=1 W=10
M2	in	sbar	out	vdd	P_50n L=1 W=20
.ends

.include cmosedu_models.txt

.end
   

