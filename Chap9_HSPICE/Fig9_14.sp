*** Figure 9.14 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc	Vin	1	5 	1m	

VDD 	VDD	0	DC	5
Vin	Vin	0	DC	0
VDDM	VDD 	VDDM 	DC 	0

M1	VDDM	Vin	VR	0	N_1u L=1 W=10
R1	VR	0	10MEG

.include cmosedu_models.txt

.end
      