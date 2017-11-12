* Figure 26.51 CMOS: Circuit Design, Layout, and Simulation *

.options scale=50nm post
.tran 0.1n 400n 0 0.1n UIC
VDD	VDD	0	DC	1

*Clock Signals
Vphi1  phi1  0 DC 0  Pulse 0 	1   0    200p  200p  4n 10n
Vphi1b phi1b 0 DC 0  Pulse 1    0   0    200p  200p  4n 10n
Vphi2  phi2  0 DC 0  Pulse 0 	1   5n   200p  200p  4n 10n
Vphi2b phi2b 0 DC 0  Pulse 1    0   5n   200p  200p  4n 10n
R1 phi1  0 1MEG
R2 phi1b 0 1MEG
R3 phi2  0 1MEG
R4 phi2b 0 1MEG

*CMFB Circuit
Xcmfb	vcmfb	vop	vom	vcmfbi	vavgi	phi1	phi1b	phi2	phi2b	vdd	sccmfb

* Setup voltage
vop	vop	0	DC	0	Pulse	500m	700m	150n	0	0	
vom	vom	0	DC	0	Pulse	500m	700m	150n	0	0	
vcmfbi	vcmfbi	0	DC	400m
vavgi	vavgi	0	DC	500m


.subckt	sccmfb vcmfb	vop	vom	vcmfbi	vavgi	phi1	phi1b	phi2	phi2b	vdd
x1	vavgi	n1	phi1	phi1b	vdd	TG
X2	n1	vop	phi2	phi2b	vdd	TG
X3	vom	n2	phi2	phi2b	vdd	TG
X4	n2	vavgi	phi1	phi1b	vdd	TG
X5	vcmfbi	n3	phi1	phi1b	vdd	TG
X6	n3	vcmfb	phi2	phi2b	vdd	TG
X7	vcmfb	n4	phi2	phi2b	vdd	TG
X8	n4	vcmfbi	phi1	phi1b	vdd	TG
C1	n1	n3	50f
C2	vop	vcmfb	10f
C3	vom	vcmfb	10f
C4	n2	n4	50f
.ends

.subckt TG 	in	out	s	sb	vdd
Mn	in	s	out	0	N_50n L=1 W=10
Mp	in	sb	out	vdd	P_50n L=1 W=10
.ends

.include cmosedu_models.txt   

.end

