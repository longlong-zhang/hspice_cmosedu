*** Figure 26.18b CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.DC 	VSD	0	1	1m

VSD 	0	VSD	DC	1
VSG	0	VSG	DC	400m

M1	VSD	VSG	0	0	P_50n L=1 W=20

.include cmosedu_models.txt   

.end
   
