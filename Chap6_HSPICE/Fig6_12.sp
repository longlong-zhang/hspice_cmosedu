*** Figure 6.12 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VSD 0 5 1m VSG 0 5 1

VSD 	0	VSD	DC	5
VSG	0	VSG	DC	0

M1	VSD	VSG	0	0	P_1u L=1 W=10

.include cmosedu_models.txt

.end
      