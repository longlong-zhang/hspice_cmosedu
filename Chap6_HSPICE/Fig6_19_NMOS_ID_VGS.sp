*** Figure 6.19_NMOS_ID_VGS CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VGS 0 500m 1m VSB 0 1 250m

VDS 	VD	0	DC	1
VGS	VGS	0	DC	0
VSB	0	VSB	DC	0

M1	VD	VGS	0	VSB	N_50n L=1 W=10

.include cmosedu_models.txt

.end
   

