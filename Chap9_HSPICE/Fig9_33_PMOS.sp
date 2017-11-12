*** Figure 9.33 (PMOS) CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.DC 	VSG	0	500m	1m

VSD 	0	VSD	DC	100m
VSG	0	VSG	DC	0

M1	VSD	VSG	0	0	P_50n L=2 W=100

.include cmosedu_models.txt

.end
   
