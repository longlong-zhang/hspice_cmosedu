*** Figure 16.66 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.DC VGS 0 2 1m

VGS	VGS	0	DC	0
VDS	VDS	0	DC	1


M1	VDS	VGS	OpenS 	0	N_50n L=1 W=10
RopenS	OpenS	0	1G

.include cmosedu_models.txt

.end
   
