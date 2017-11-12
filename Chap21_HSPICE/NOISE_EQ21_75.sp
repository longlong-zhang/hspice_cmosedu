*** Equation 21.75 NOISE CMOS: Circuit Design, Layout, and Simulation ***

.noise	 v(Vout)	Vin 	100
.AC dec  	100 	1 	100MEG 
.options scale=50n post

VDD	VDD	0	DC	1
Vin	Vin	0	DC	350m	AC	1

* Bias the MOSFETs at the operating points in Table 9.2 (back inside cover)

M2	Vout	VACGND	VDD	VDD	P_50n L=2 W=100
RBIG	VACGND	Vout	100MEG
CBIG	VACGND	0	1u
M1	Vout	Vin	0	0	N_50n L=2 W=50

.include cmosedu_models.txt   

.end
   

