*** Figure 19.34 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 0.1n 50n


VDD 	VDD	0	DC	1	
vdata	data	0	DC	0	pulse 0 1 0 0 0 5n 10n
vdclock	dclock	0	DC	0	pulse 0 1 2n 0 0 5n 9n

X1	VDD	data	dclock	up	down	pfd

.subckt	pfd	VDD	data	dclock	up 	down
X1	VDD	data	n1	inverter
X2	VDD	n1	n5	n2	nand
X3	VDD	n2	n3	inverter
X4	VDD	n3	n4	inverter
X5	VDD	n4	n6	reset	n5	nand3
X6	VDD	n5	up	inverter
X7	VDD	n2	n7	n6	nand
X8	VDD	n6	reset	n7	nand
X9	VDD	reset	n8	n9	nand
X10	VDD	n9	n11	n8	nand
X11	VDD	n6	n2	n11	n8	reset	nand4
X12	VDD	dclock	n10	inverter
X13	VDD	n10	n14	n11	nand
X14	VDD	n11	n12	inverter
X15	VDD	n12	n13	inverter
X16	VDD	reset	n8	n13	n14	nand3
X17	VDD	n14	down	inverter
.ends

.subckt nand	VDD	A	B	ANANDB
M1	n1	A	0	0	N_50n	L=1 	W=10
M2	ANANDB	B	n1	0	N_50n 	L=1	W=10
M3	ANANDB	A	VDD	VDD	P_50n	L=1	W=20
M4	ANANDB	B	VDD	VDD	P_50n	L=1	W=20
.ends

.subckt inverter	VDD	in	out	
M1	out	in	0	0	N_50n	L=1	W=10
M2	out	in	VDD	VDD	P_50n	L=1	W=20
.ends

.subckt nand3	VDD	A	B	C	OUT
M1	n1	A	0	0	N_50n	L=1 	W=10
M2	n2	B	n1	0	N_50n 	L=1	W=10
M3	OUT	C	n2	0	N_50n 	L=1	W=10
M4	OUT	A	VDD	VDD	P_50n	L=1	W=20
M5	OUT	B	VDD	VDD	P_50n	L=1	W=20
M6	OUT	C	VDD	VDD	P_50n	L=1	W=20
.ends

.subckt nand4	VDD	A	B	C	D	OUT
M1	n1	A	0	0	N_50n	L=1 	W=10
M2	n2	B	n1	0	N_50n 	L=1	W=10
M3	n3	C	n2	0	N_50n 	L=1	W=10
M4	OUT	D	n3	0	N_50n	L=1	W=10
M5	OUT	A	VDD	VDD	P_50n	L=1	W=20
M6	OUT	B	VDD	VDD	P_50n	L=1	W=20
M7	OUT	C	VDD	VDD	P_50n	L=1	W=20
M8	OUT	D	VDD	VDD	P_50n	L=1	W=20
.ends

.include cmosedu_models.txt    

.end
   

