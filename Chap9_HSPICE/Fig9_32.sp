*** Figure 9.32 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.DC 	VDS	0	1	1m

VDS 	VDS	0	DC	1
VGS	VGS	0	DC	350m

M1	VDS	VGS	0	0	N_50n L=2 W=50

.include cmosedu_models.txt  

.end
   
