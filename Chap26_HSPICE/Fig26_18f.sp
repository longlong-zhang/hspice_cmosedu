*** Figure 26.18f CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.DC 	VSG	0	500m	1m

VSD 	0	VSD	DC	100m
VSG	0	VSG	DC	0

M1	VSD	VSG	0	0	P_50n L=1 W=20

.include cmosedu_models.txt    

.end
   
