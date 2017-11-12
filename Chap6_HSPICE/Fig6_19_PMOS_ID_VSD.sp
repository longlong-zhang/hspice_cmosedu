*** Figure 6.19_PMOS_ID_VSD CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VSD 0 1 1m VSG 0 1 250m

VSD 	0	VSD	DC	5
VSG	0	VSG	DC	0

M1	VSD	VSG	0	0	P_50n L=1 W=10

.include cmosedu_models.txt

.end
   

