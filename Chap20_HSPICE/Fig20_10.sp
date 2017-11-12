*** Figure 20.10 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VDD 0.9 1.1 1m

VDD	VDD	0 	DC 	1
Vo	Vo	0	DC	0
Vmeas	Vmeas	0	DC	0

R1	VD1	vmeas	65k
M1	VD1	VD1	VDD	VDD	P_50n L=2 W=100
M2	Vo	VD1	VDD	VDD	P_50n L=2 W=100

.include cmosedu_models.txt   

.end
   

