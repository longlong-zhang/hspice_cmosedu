*** Figure 9.24 (PMOS) CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VDD 0 5 1m

VDD 	VDD	0	DC	5
VGP	VDD	VGP	DC	1.15

MP	0	VGP	VDD	VDD	P_1u L=2 W=30

.include cmosedu_models.txt

.end
      