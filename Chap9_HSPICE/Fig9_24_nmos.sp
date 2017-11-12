*** Figure 9.24 (NMOS) CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VDD 0 5 1m

VDD 	VDD	0	DC	5
VGN	VGN	0	DC	1.05

MN	VDD	VGN	0	0	N_1u L=2 W=10

.include cmosedu_models.txt  

.end
      