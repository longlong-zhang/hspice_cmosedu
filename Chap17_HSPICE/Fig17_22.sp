*** Figure 17.22 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.ic V(vbit)=550m
.tran .25n 500n 0 .25n UIC

VDD 	VDD	0	DC	1
Vphi1	phi1	0	DC	0	PULSE 1 0 1n 0 0 4n 10n
Vphi2	phi2	0	DC	0	PULSE 1 0 6n 0 0 4n 10n
Vclock	clock	0	DC	0	PULSE 0  1 0 0 0 5n 10n
Vref	Vref	0	DC 	0.5


M3	Vd3	Q	Vd2	VDD	P_50n L=1 W=20
M4	Vbit	Vref	Vd3	Vd3	P_50n L=1 W=20

Rcup	VDD	Vd2	25k	

Cbit	Vbit	0	500f 
Rmbit	Vbit	Vref	50k

X1	VDD	Vbit	Vref	clock	Qi	Q	Comp

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
MB2	db2	Inm	0	0	N_50n L=1 W=13

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
   
