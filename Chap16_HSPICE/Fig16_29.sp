*** Figure 16.29 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.tran 100p 30n 5n 100p UIC

VDD 	VDD	0	DC	1
Vinp	Vinp	0	DC	0	PULSE .4 .6 5n 0 0 4n 12n
Vinm	Vinm	0	DC	0.5
Vclock	clock	0	DC	0	PULSE 0  1 0 0 0 5n 10n

MS1	Vinp	clock	Voutp	VDD	P_50n L=1 W=20
MS2	Vinm	clock	Voutm	VDD	P_50n L=1 W=20
MS3	Vlat	clock	0	0	N_50n L=1 W=20

M1	Voutp	Voutm	Vlat	0	N_50n L=1 W=10
M2	Voutm	Voutp	Vlat	0	N_50n L=1 W=10
M3	Voutp	Voutm	VDD	VDD	P_50n L=1 W=20
M4	Voutm	Voutp	VDD	VDD	P_50n L=1 W=20

.include cmosedu_models.txt

.end
   
