*** Figure 25.20 CMOS: Circuit Design, Layout, and Simulation ***

.tran 100p 200n
.options scale=50n post

* clock signals
Vphi1	phi1	0	DC	0	PULSE 1	0 5n 0 0 5n 10n
Vphi2	phi2	0	DC	0	PULSE 1	0 5.2n 0 0 5n 10n
Vphi3	phi3	0	DC	0	PULSE 0 1 5.4n 0 0 4n 10n

* input signals
vinp	vinp	0	DC	0	SIN 500m 100m	5MEG
vinm	vinm	0	DC	0	SIN 500m -100m	5MEG

* op-amp model
E1	vop	vcm	vp	vm	1e6
E2	vcm	vom	vp	vm	1e6
Vcm	vcm	0	DC	500m

* capacitors
Ct	t1	vm	1p
Cb	b1	vp	1p

Coutp	voutp	0	1p
Coutm	voutm	0	1p

* MOSFET switches
M1	vinp	phi2	t1	0	N_50n L=1 W=10
M2	vinm	phi2	b1	0	N_50n L=1 W=10

M3	t1	phi3	vop	0	N_50n L=1 W=10
M4	b1	phi3	vom	0	N_50n L=1 W=10

M5	vm	phi1	vop	0	N_50n L=1 W=10
M6	vp	phi1	vom	0	N_50n L=1 W=10

M7	vop	phi3	voutp	0	N_50n L=1 W=10
M8	vom	phi3	voutm	0	N_50n L=1 W=10

.include cmosedu_models.txt   

.end
   

