*** Figure 20.4 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc Vo 0.1 5 1m

VDD 	VDD	0	DC	5
Vo	Vo	0	DC	0

R1	VDD	VGS1	200k

M1	VGS1	VGS1	0	0	N_1u L=2 W=10
M2	Vo	VGS1	0	0	N_1u L=2 W=10

.include cmosedu_models.txt 

.end
      