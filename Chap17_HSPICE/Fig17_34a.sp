*** Figure 17.34a CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .5n 1500n 0 .5n UIC

VDD 	VDD	0	DC	1
Vphi1	phi1	0	DC	0	PULSE 1 0 1n 0 0 4n 10n
Vphi2	phi2	0	DC	0	PULSE 1 0 6n 0 0 4n 10n
Vclock	clock	0	DC	0	PULSE 0  1 0 0 0 5n 10n
Vshr	shr	0	DC	0	Pulse 0 1 0 0 0 100n 5u
Vshi	shi	0	DC	0	Pulse 0 1 120n 0 0 100n 5u

Vblack	Vblack	0	DC 	650mV
Vinten	Vinten	0	DC	650mV

Chr	Vr	0	1p
Chi	Vi	0	1p

MSHR	Vblack	shr	Vr	0	N_50n L=1 W=10
MSHI	Vinten	shi	Vi	0	N_50n L=1 W=10

M1r	Vd1r	phi1	VDD	VDD	P_50n L=1 W=20
M2r	Vd2r	phi2	Vd1r	VDD	P_50n L=1 W=20
M3r	Vd3r	0	Vd2r	VDD	P_50n L=1 W=20
M4r	Vd4r	Vr	Vd3r	Vd3r	P_50n L=1 W=20
Ccupr	Vd1r	0	100f	

M1i	Vd1i	phi1	VDD	VDD	P_50n L=1 W=20
M2i	Vd2i	phi2	Vd1i	VDD	P_50n L=1 W=20
M3i	Vd3i	Q	Vd2i	VDD	P_50n L=1 W=20
M4i	Vbucket	Vi	Vd3i	Vd3i	P_50n L=1 W=20
Ccupi	Vd1i	0	100f

M1	Vd4r	Vd4r	0	0	N_50n L=10 W=10
M2	Vbucket	Vd4r	0	0	N_50n L=10 W=10	

Cbucket	Vbucket	0	500f 

X1	VDD	Vbucket	vd4r	clock	Qi	Q	Comp

.subckt Comp 	VDD	Inp	Inm	clock	Qi	Q	
M1	d1	Outp	db1 	0	N_50n L=1 W=10
M2	d2	Outm	db2	0	N_50n L=1 W=10
M3	Outm	Outp	VDD	VDD	P_50n L=1 W=20
M4	Outp	Outm	VDD 	VDD	P_50n L=1 W=20

MS1	Outm	clock	d1	0	N_50n L=1 W=10
MS2	Outp	clock	d2	0	N_50n L=1 W=10
MS3	Outm	clock	VDD	VDD	P_50n L=1 W=20
MS4	OUtp	clock	VDD	VDD	P_50n L=1 W=20

MB1	db1	Inp	0	0	N_50n L=1 W=10
MB2	db2	Inm	0	0	N_50n L=1 W=10
X1	Outp	Q	Qi	VDD	Nand
X2	Qi	Outm	Q	VDD	Nand
.ends

.subckt Nand A B ANANDB VDD
M1	ANANDB	A	d2	0	N_50n L=1 W=10
M2	d2	B	0	0	N_50n L=1 W=10
M3	ANANDB	A	VDD	VDD	P_50n L=1 W=20
M4	ANANDB	B	VDD	VDD	P_50n L=1 W=20
.ends

.include cmosedu_models.txt

.end
   
