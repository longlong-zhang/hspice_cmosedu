*** Figure 12.12 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 2.5n 10p

vdd	vdd	0	DC	1
Vin	vin	0	DC	0	pulse	0 1 200p 0 0 1.5n 4n

x1	vin	vdd	vdd	out	vdd	NAND_3
cl	out	0	50f

.subckt	NAND_3	A	B	C	out	VDD
M1	n1	A	0	0	N_50n L=1 W=10
M2	n2	B	n1	0	N_50n L=1 W=10
M3	out	C	n2	0	N_50n L=1 W=10
M4	out	A	VDD	VDD	P_50n L=1 W=20
M5	out	B	VDD	VDD	P_50n L=1 W=20
M6	out	C	VDD	VDD	P_50n L=1 W=20
.ends

.include cmosedu_models.txt

.end
   

