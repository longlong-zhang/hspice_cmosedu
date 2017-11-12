*** Figure 17.29 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc vin 0 0.75 1m

VDD	VDD	0	DC	1
Vin	Vin	0	DC	0

R1	VDD	Vr	10MEG

M1	0	Vin	Vr	Vr 	P_50n L=1 W=20

.include cmosedu_models.txt

.end
   
