*** Figure 20.25 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 1m 1 sweep temp 0 100 25

VDD 	VDD	0	DC	1
Vo	Vo	0	DC	0
Vmeas	Vmeas	0	DC	0

Iref	VD1	Vmeas	DC	10u
M1	VD1	VD1	VDD	VDD	P_50n L=2 W=100
M2	Vo	VD1	VDD	VDD	P_50n L=2 W=100

.include cmosedu_models.txt  

.end
   

