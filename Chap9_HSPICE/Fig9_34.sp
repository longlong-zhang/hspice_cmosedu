*** Figure 9.34 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.AC	DEC 100	10MEG 10G

VDS 	VDS	0	DC	1
VGS	VGS	0	DC	350m	AC	1

M1	VDS	VGS	0	0	N_50n L=2 W=50

.include cmosedu_models.txt

.end
   
