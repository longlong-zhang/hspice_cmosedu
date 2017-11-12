* Figure 26.59 CMOS: Circuit Design, Layout, and Simulation *

.options scale=50nm post
.tran 1n 2000n 0 0.1n UIC
VDD	VDD	0	DC	1
VCM	vcm	0	DC	500m

* Clock Signals 
***IMPORTANT -  if you want to measure settling time reduce rise/fall from 2n to 0.2n
Vphi1  phi1  0 DC 0  Pulse 0 	1   0    2n  2n  40n 100n
Vphi1b phi1b 0 DC 0  Pulse 1    0   0    2n  2n  40n 100n
Vphi2  phi2  0 DC 0  Pulse 0 	1   50n   2n  2n  40n 100n
Vphi2b phi2b 0 DC 0  Pulse 1    0   50n   2n  2n  40n 100n
R1 phi1  0 1MEG
R2 phi1b 0 1MEG
R3 phi2  0 1MEG
R4 phi2b 0 1MEG

* input signals
vinp	vinp	0	DC	0	SIN 500m 300m	.5MEG
vinm	vinm	0	DC	0	SIN 500m -300m	.5MEG

* capacitors
Ct	t1	vm	250f
Cb	b1	vp	250f

Coutp	voutp	0	250f
Coutm	voutm	0	250f

* switches
XTGs1	vinp	t1	phi1	phi1b	VDD	TG
XTGs2	vinm	b1	phi1	phi1b	VDD	TG
XTGs3	t1	vop	phi2	phi2b	VDD	TG	
XTGs4	b1	vom	phi2	phi2b	VDD	TG
XTGs5	vop	voutp	phi2	phi2b	VDD	TG
XTGs6	vom	voutm	phi2	phi2b	VDD	TG

* op-amp 
Xbias	vbiasn	vbiasp	Vbias1	Vbias2	vcm	VDD	bias
Xdiff	vp	vm	vbias1	vbias2	vbiasn	vcmfb1	vopd	vomd	ccl	ccr	vdd	diffamp
Xcmfb1	vcmfb1	vopd	vomd	vbiasn	vbias1	phi1	phi1b	phi2	phi2b	vdd	sccmfb
XTG1	vcm	vp	phi1	phi1b	vdd	TG
XTG2	vcm	vm	phi1	phi1b	vdd	TG
XTG3	vopd	vomd	phi1	phi1b	vdd	TG
ccl	vop	ccl	50f
ccr	vom	ccr	50f
Xcmfb2	vcmfb2	vop	vom	vcm	vcm	phi1	phi1b	phi2	phi2b	vdd	sccmfb
xbuff	vopd	vomd	vcmfb2	vop	vom	vcm	vdd	buffer
XTG4	vop	vom	phi1	phi1b	vdd	TG

*subcircuits

.subckt buffer	vopd	vomd	vcmfb	vop	vom	vcm	vdd	
M1	vop	vomd	VDD	VDD	P_50n L=1 W=40
M2	vop	n1	vss	0	N_50n L=1 W=20
M3	vss	vcmfb	0	0	N_50n L=1 W=20
M4	n1	vopd	VDD	VDD	P_50n L=1 W=20
M5	n1	n1	n2	0	N_50n L=1 W=10
M6	n2	vcm	0	0	N_50n L=1 W=10
M7	n3	vomd	VDD	VDD	P_50n L=1 W=20
M8	n3	n3	n4	0	N_50n L=1 W=10
M9	n4	vcm	0	0	N_50n L=1 W=10
M10	vom	vopd	VDD	VDD	P_50n L=1 W=40
M11	vom	n3	vss	0	N_50n L=1 W=20
M12	vss	vcmfb	0	0	N_50n L=1 W=20
.ends	


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
