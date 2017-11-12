*** Figure 6.13 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VGS 0 2 1m VSB 0 5 1

VDS 	VD	0	DC	5
VGS	VGS	0	DC	0
VSB	0	VSB	DC	0

M1	VD	VGS	0	VSB	N_1u L=1 W=10

.include cmosedu_models.txt

.end
      