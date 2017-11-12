*** Figure 17.11 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 100p 1000n 10n 100p UIC

VDD 	VDD	0	DC	1
Vphi1	phi1	0	DC	0	PULSE 1 0 1n 0 0 4n 10n
Vphi2	phi2	0	DC	0	PULSE 1 0 6n 0 0 4n 10n
*Add resistors to the sim just to make sure the voltage sources always have a load.
Rphi1	phi1	0	1G
Rphi2	phi2	0	1G
Vbit	Vbit	0	DC	0	Pulse 0.3 1 0 1000n

M1	Vd1	phi1	VDD	VDD	P_50n L=1 W=20
M2	Vd2	phi2	Vd1	VDD	P_50n L=1 W=20
M3	Vbit	0	Vd2	VDD	P_50n L=1 W=20
Ccup	Vd1	0	100f	

.include cmosedu_models.txt

.end
   
