*** Figure 16.67 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.DC VB 0 2 1m

VDS	VDS	0	DC	0
VGS	VGS	0	DC	0
VB	VB	0	DC	0	

M1	OpenD	VGS	OpenS 	VB	N_50n L=1 W=10
RopenS	OpenS	0	1G
RopenD	OpenD	0	1G

.include cmosedu_models.txt

.end
   
