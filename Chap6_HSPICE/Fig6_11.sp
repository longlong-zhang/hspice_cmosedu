*** Figure 6.11 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VDS 0 5 1m VGS 0 5 1

VDS 	VDS	0	DC	5
VGS	VGS	0	DC	0

M1	VDS	VGS	0	0	N_1u L=1 W=10

.include cmosedu_models.txt

.end
      