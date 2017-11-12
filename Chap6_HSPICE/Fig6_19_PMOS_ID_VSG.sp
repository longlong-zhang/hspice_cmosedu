*** Figure 6.19_PMOS_ID_VSG CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VSG 0 500m 1m VBS 0 1 250m

VSD 	0	VSD	DC	1
VSG	0	VSG	DC	0
VBS	VBS	0	DC	0

M1	VSD	VSG	0	VBS	P_50n L=1 W=10

.include cmosedu_models.txt

.end
   

