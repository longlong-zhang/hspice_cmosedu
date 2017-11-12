*** Figure 16.37 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.tran 10p 21n 19n 10p UIC

VDD 	VDD	0	DC	1
Vclock	clock	0	DC	0	PULSE 0  1 0 0 0 5n 10n

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
*MB3	db1	gb3	0	0	N_50n L=1 W=10
*MB4	db2	gb4	0	0	N_50n L=1 W=10
*MB5	gb3	gb3	0	0	N_50n L=1 W=10
*MB6	gb4	gb4	0	0	N_50n L=1 W=10
*MB7	gb3	Inm	VDD	VDD	P_50n L=1 W=20
*MB8	gb4	Inp	VDD	VDD	P_50n L=1 W=20

MI1	Inp	VDD	0	0	N_50n L=10 W=10
MI2	Inp	VDD	VDD	VDD	P_50n L=10 W=20
MI3	Inm	0	0	0	N_50n L=10 W=10
MI4	Inm	0	VDD	VDD	P_50n L=10 W=20

X1	Outp	Q	Qi	VDD	Nand
X2	Qi	Outm	Q	VDD	Nand

.subckt Nand A B ANANDB VDD
M1	ANANDB	A	d2	0	N_50n L=1 W=10
M2	d2	B	0	0	N_50n L=1 W=10
M3	ANANDB	A	VDD	VDD	P_50n L=1 W=20
M4	ANANDB	B	VDD	VDD	P_50n L=1 W=20
.ends

.include cmosedu_models.txt

.end
   
