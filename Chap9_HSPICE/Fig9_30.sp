*** Figure 9.30 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n	post
.DC 	VGS	0	1	1m	TEMP	0 	100	25

VDS 	VDS	0	DC	1
VGS	VGS	0	DC	0

M1	VDS	VGS	0	0	N_50n L=2 W=50

.include cmosedu_models.txt

.end
   
