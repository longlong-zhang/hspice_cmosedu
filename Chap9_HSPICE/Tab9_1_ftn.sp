*** Table 9.1 fT nmos CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u	post
.ac dec 100 1MEG 1G

VDD 	VDD	0	DC	5
VGS	VGS	0	DC	1.05	AC 	1

MN	VDD	VGS	0	0	N_1u L=2 W=10

.include cmosedu_models.txt

.end
      