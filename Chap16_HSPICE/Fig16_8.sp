*** Figure 16.8 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.tran 100p 10n 0 100p UIC

VDD 	VDD	0	DC	1
VDDby2	VDDby2	0	DC	0.5
VEQ	EQ	0	DC	0	PULSE 0 1 5n 0 0 4n
VNSA	sense_n	0	DC	0

Ccol0	cola0	0	100f	IC=0.25
Ccol1	cola1	0	100f	IC=0.75

ME1	cola0	EQ	VDDby2	0	N_50n L=1 W=10
ME2	cola1	EQ	VDDby2	0	N_50n L=1 W=10
ME3	cola0	EQ	cola1	0	N_50n L=1 W=10

M1	cola0	cola1	NLAT	0	N_50n L=1 W=10
M2	cola1	cola0	NLAT	0	N_50n L=1 W=10

MPD	NLAT	sense_n	0	0	N_50n L=1 W=10

.include cmosedu_models.txt

.end
   
