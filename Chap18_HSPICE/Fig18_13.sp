*** Figure 18.13 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .01n 5n

VDD	VDD	0	DC	1
Vin	Vin	0	DC	0 PULSE 0 1 1n 1n 1n 0.5n

X1	VDD	Vin	Vout	inverter
Cl	Vout	0	100f
X2	VDD	Vout	Vout2	inverter

.subckt inverter VDD A Ai
M1 	Ai	A	0	0	N_50n L=1 W=10
M2	Ai	A	VDD	VDD	P_50n L=1 W=10
.ends

.include cmosedu_models.txt   

.end
   
