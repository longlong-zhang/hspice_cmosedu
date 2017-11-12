*** Figure 9.31 (PMOS) CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n	post
.DC 	VSD	0	1	1m

VSD 	0	VSD	DC	1
VSG	0	VSG	DC	350m

M1	VSD	VSG	0	0	P_50n L=2 W=100

.include cmosedu_models.txt 

.end
   
