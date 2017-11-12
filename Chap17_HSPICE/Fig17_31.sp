*** Figure 17.31 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc vin 0.4 1 1m

VDD	VDD	0	DC	1
Vin	Vin	0	DC	0

Mn	VDD	Vin	Vcol	0	N_50n L=1 W=10

Ibias	Vcol	0	DC	10u
Rbias	Vcol	0	10MEG

.include cmosedu_models.txt

.end
   
