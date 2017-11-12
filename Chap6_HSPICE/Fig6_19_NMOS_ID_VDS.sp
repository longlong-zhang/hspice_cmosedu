*** Figure Fig6.19_NMOS_ID_VDS CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VDS 0 1 1m VGS 0 1 250m

VDS 	VDS	0	DC	5
VGS	VGS	0	DC	0

M1	VDS	VGS	0	0	N_50n L=1 W=10

.include cmosedu_models.txt

.end
   

