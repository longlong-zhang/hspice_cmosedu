*** Figure 26.18e CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.DC 	VGS	0	500m	1m

VDS 	VDS	0	DC	100m
VGs	VGS	0	DC	0

M1	VDS	VGS	0	0	N_50n L=1 W=10

.include cmosedu_models.txt    

.end
   
