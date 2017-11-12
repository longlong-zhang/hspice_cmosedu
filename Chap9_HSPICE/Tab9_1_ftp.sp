*** Table 9.1 ft pmos CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u	post
.ac dec 100 1MEG 1G

VDD 	VDD	0	DC	5
VSG	VDD	VSG	DC	1.15	AC 	1

MP	0	VSG	VDD	VDD	P_1u L=2 W=30

.include cmosedu_models.txt

.end
      