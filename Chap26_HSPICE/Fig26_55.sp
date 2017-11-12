* Figure 26.55 CMOS: Circuit Design, Layout, and Simulation *

.options scale=50nm post
.tran 0.1n 200n 0 0.1n UIC
VDD	VDD	0	DC	1
VCM	vcm	0	DC	500m

* Clock Signals
Vphi1  phi1  0 DC 0  Pulse 0 	1   0    200p  200p  4n 10n
Vphi1b phi1b 0 DC 0  Pulse 1    0   0    200p  200p  4n 10n
Vphi2  phi2  0 DC 0  Pulse 0 	1   5n   200p  200p  4n 10n
Vphi2b phi2b 0 DC 0  Pulse 1    0   5n   200p  200p  4n 10n
R1 phi1  0 1MEG
R2 phi1b 0 1MEG
R3 phi2  0 1MEG
R4 phi2b 0 1MEG

* op-amp input diff-amp
Xbias	vbiasn	vbiasp	Vbias1	Vbias2	vcm	VDD	bias
Xdiff	vp	vm	vbias1	vbias2	vbiasn	vcmfb	vopd	vomd	ccl	ccr	vdd	diffamp
Xcmfb1	vcmfb	vopd	vomd	vbiasn	vbias1	phi1	phi1b	phi2	phi2b	vdd	sccmfb
XTG1	vcm	vp	phi1	phi1b	vdd	TG
XTG2	vcm	vm	phi1	phi1b	vdd	TG
XTG3	vopd	vomd	phi1	phi1b	vdd	TG

* subcircuits

.subckt diffamp	vp	vm	vbias1	vbias2	vbiasn	vcmfb	vopd	vomd	ccl	ccr	vdd
M1	n1	vbias1	VDD	VDD	P_50n L=1 W=20
M2	vomd	vbias2	n1	VDD	P_50n L=1 W=20
M3	vomd	vbias1	ccl	0	N_50n L=1 W=10
M4	ccl	vp	vss	0	N_50n L=1 W=10
M5	vss	vbiasn	0	0	N_50n L=1 W=10
M6	n4	vbias1	VDD	VDD	P_50n L=1 W=20
M7	vopd	vbias2	n4	VDD	P_50n L=1 W=20
M8	vopd	vbias1	ccr	0	N_50n L=1 W=10
M9	ccr	vm	vss	0	N_50n L=1 W=10
M10	vss	vcmfb	0	0	N_50n L=1 W=10
.ends

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

.subckt	bias 	vbiasn 	vbiasp	vbias1	vbias2	vcm	VDD

MB1	nb1	vbias1	VDD	VDD	P_50n L=1 W=20
MB2	vbias1	Vbias2	nb1	VDD	P_50n L=1 W=20
MB3	vbias1	vbias1	nb2	0	N_50n L=1 W=10
MB4	nb2	vcm	nb3	0	N_50n L=1 W=10
MB5	nb3	vbiasn	0	0	N_50n L=1 W=10
MB6	vbias2	vbias2	VDD	VDD	P_50n L=3 W=10
MB8	vbias2	vcm	nb5	0	N_50n L=1 W=10
MB9	nb5	vbiasn	0	0	N_50n L=1 W=10	

M1	Vbiasn	Vbiasn	0	0	N_50n L=1 W=10
M2	Vreg	Vreg	Vr	0	N_50n L=1 W=40
M3	Vbiasn	Vbiasp	VDD	VDD	P_50n L=1 W=20
M4	Vreg	Vbiasp	VDD	VDD	P_50n L=1 W=20

Rbias	Vr	0	4k

*amplifier 
MA1	Vamp	Vreg	0	0	N_50n L=2 W=10
MA2	Vbiasp	Vbiasn	0	0	N_50n L=2 W=10
MA3	Vamp	Vamp	VDD	VDD	P_50n L=2 W=20
MA4	Vbiasp	Vamp	VDD	VDD	P_50n L=2 W=20

*start-up stuff
MSU1	Vsur	Vbiasn	0	0	N_50n L=1   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_50n L=1   W=10

.ends

.include cmosedu_models.txt    

.end
   


.end
