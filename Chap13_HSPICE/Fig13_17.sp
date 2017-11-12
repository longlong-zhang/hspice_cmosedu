*** Figure 13.17 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 10n 10p UIC

vdd	vdd	0	DC	1

x1	in	out	vdd	inv
X2	out	in	vdd	inv
cin	out	0	50f	
.IC v(out)=0.5 v(in)=0.5
cout	in	0	50f	

.subckt	inv	in	out	VDD
M1	out	in	0	0	N_50n L=1 W=10
M2	out	in	vdd	vdd	P_50n L=1 W=20
.ends

.include cmosedu_models.txt

.end
   

