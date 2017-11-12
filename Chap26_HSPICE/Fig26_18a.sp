*** Figure 26.18a CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.DC 	VDS	0	1	1m

VDS 	VDS	0	DC	1
VGS	VGS	0	DC	400m

M1	VDS	VGS	0	0	N_50n L=1 W=10

.include cmosedu_models.txt    

.end
   
