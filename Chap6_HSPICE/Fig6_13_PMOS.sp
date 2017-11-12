*** Figure 6.14 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VSG 0 2 1m VBS 0 5 1

VSD 	0	VSD	DC	5
VSG	0	VSG	DC	0
VBS	VBS	0	DC	0

M1	VSD	VSG	0	VBS	P_1u L=1 W=10

.include cmosedu_models.txt

.end
      