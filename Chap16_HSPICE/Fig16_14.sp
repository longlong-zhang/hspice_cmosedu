*** Figure 16.14 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.tran 100p 30n 0 100p UIC

VDD 	VDD	0	DC	1
VDDby2	VDDby2	0	DC	0.5
VEQ	EQ	0	DC	0	PULSE 0 1 5n 0 0 4n
VNSA	sense_n	0	DC	0	PULSE 0 1 15n 
VPSA	sense_p	0	DC	0	PULSE 1	0 18n
VRa0	ra0	0	DC	0	PULSE 0 1.5 12n	
VRa1	ra1	0	DC	0

Ccol0	cola0	0	100f	IC=0.25
Ccol1	cola1	0	100f	IC=0.75

ME1	cola0	EQ	VDDby2	0	N_50n L=1 W=10
ME2	cola1	EQ	VDDby2	0	N_50n L=1 W=10
ME3	cola0	EQ	cola1	0	N_50n L=1 W=10

M1	cola0	cola1	NLAT	0	N_50n L=1 W=10
M2	cola1	cola0	NLAT	0	N_50n L=1 W=10

M3	cola0	cola1	ACT	VDD	P_50n L=1 W=20
M4	cola1	cola0	ACT	VDD	P_50n L=1 W=20

MPD	NLAT	sense_n	0	0	N_50n L=1 W=10
MPU	ACT	sense_p	VDD	VDD	P_50n L=1 W=20

**ARRAY 0 mbit
Marray0	cola0	ra0	mbit0	0	N_50n L=1 W=10
Cbit0	Mbit0	0	20f	IC=1

**ARRAY 1 mbit
Marray1 cola1	ra1	mbit1	0	N_50n L=1 W=10
Cbit1	Mbit1	0	20f

.include cmosedu_models.txt

.end
   
