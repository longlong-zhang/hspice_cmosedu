*** Figure 26.25 CMOS: Circuit Design, Layout, and Simulation ***

.tran 100p 200n UIC
.options scale=50n post
VDD	VDD	0	DC	1

* clock signals
Vphi1	phi1	0	DC	0	PULSE 1	0 5n 0 0 5n 10n
Vphi2	phi2	0	DC	0	PULSE 1	0 5.2n 0 0 5n 10n
Vphi3	phi3	0	DC	0	PULSE 0 1 5.4n 0 0 4n 10n

* input signals
vinp	vinp	0	DC	0	SIN 500m 100m	5MEG
vinm	vinm	0	DC	0	SIN 500m -100m	5MEG

* op-amp call
xopamp	vop	vom	vp	vm	VDD	opamp

* capacitors
Ct	t1	vm	250f
Cb	b1	vp	250f

Coutp	voutp	0	250f
Coutm	voutm	0	250f

* MOSFET switches
M1	vinp	phi2	t1	0	N_50n L=1 W=10
M2	vinm	phi2	b1	0	N_50n L=1 W=10

M3	t1	phi3	vop	0	N_50n L=1 W=10
M4	b1	phi3	vom	0	N_50n L=1 W=10

M5	vm	phi1	vop	0	N_50n L=1 W=10
M6	vp	phi1	vom	0	N_50n L=1 W=10

M7	vop	phi3	voutp	0	N_50n L=1 W=10
M8	vom	phi3	voutm	0	N_50n L=1 W=10

* op-amp circuit

.subckt opamp	vop	vom	vp	vm	VDD
Xbias	vbiasn	vbiasp	VDD	bias
Xdiffamp	vop1	vom1	vp	vm	vbiasn	cr	cl	vdd	diffamp
Xbuffr	vop1	vom1	vom	VDD	buff
Xbuffl	vom1	vop1	vop	VDD	buff
cc1	vom	cr	50f
cc2	vop	cl	50f
.ends

.subckt	buff	vp	vm	vout	VDD	
M1p	vout	vp	VDD	VDD	P_50n L=1 W=20
M2p	n1	vm	VDD	VDD	P_50n L=1 W=20	
M3n	n1	n1	0	0	N_50n L=1 W=10
M4n	vout	n1	0	0	N_50n L=1 W=10
.ends

.subckt	diffamp	vop	vom	vp	vm	vbiasn	n2R	n2L	vdd

M1R	n1b	vbiasn	0	0	N_50n L=1 W=10
M2R	n1t	vbiasn	0	0	N_50n L=1 W=10
M3R	n2	vm	n1b	0	N_50n L=1 W=10
M4R	n2R	vm	n1t	0	N_50n L=1 W=10
M5R	n3	n3	n2	0	N_50n L=1 W=10
M6R	vop	n3	n2R	0	N_50n L=1 W=10
M7R	n3	vbiasn	n4	VDD	P_50n L=1 W=20
M8R	vop	vbiasn	n4R	VDD	P_50n L=1 W=20
M9R	n4	n3	VDD	VDD	P_50n L=1 W=20
M10R	n4R	n3	VDD	VDD	P_50n L=1 W=20

M1L	n1b	vbiasn	0	0	N_50n L=1 W=10
M2L	n1t	vbiasn	0	0	N_50n L=1 W=10
M3L	n2	vp	n1b	0	N_50n L=1 W=10
M4L	n2L	vp	n1t	0	N_50n L=1 W=10
M5L	n3	n3	n2	0	N_50n L=1 W=10
M6L	vom	n3	n2L	0	N_50n L=1 W=10
M7L	n3	vbiasn	n4	VDD	P_50n L=1 W=20
M8L	vom	vbiasn	n4L	VDD	P_50n L=1 W=20
M9L	n4	n3	VDD	VDD	P_50n L=1 W=20
M10L	n4L	n3	VDD	VDD	P_50n L=1 W=20

.ends


.subckt bias vbiasn vbiasp VDD

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
   

