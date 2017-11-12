*** Figure 23.4 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VDD 4 6 1m temp 0 100 25

VDD 	VDD	0	DC	5
R1	VDD	VREF	1MEG	TC1=0.002
M1	VREF	VREF	0	0	N_1u L=2 W=10

.include cmosedu_models.txt

.end
      