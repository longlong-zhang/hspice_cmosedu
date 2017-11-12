*** Figure 17.17 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.tran 100p 500n 

VDD 	VDD	0	DC	1
Vinp	Inp	0	DC	0	PULSE .5 .6 0n 500n
Vinm	Inm	0	DC	0.5
Vclock	clock	0	DC	0	PULSE 0  1 0 0 0 5n 10n

X1	VDD	Inp	Inm	clock	Qi	Q	Comp

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
   
