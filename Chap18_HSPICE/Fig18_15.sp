*** Figure 18.15 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .01n 2n

VDD	VDD	0	DC	1
VA	A	0	DC	0 PULSE 0 1 0 1n 
VB	B	0	DC	1

X1	VDD	A	B	outa	NAND
X2	VDD	B	A	outb	NAND
Ca	outa	0	50f
Cb	outb	0	50f

.subckt nand VDD A B ANANDB
M1 	vd1	A	0	0	N_50n L=1 W=10
M2	ANANDB	B	vd1	0	N_50n L=1 W=10
M3	ANANDB	A	VDD	VDD	P_50n L=1 W=10
M4	ANANDB	B	VDD	VDD	P_50n L=1 W=10
.ends

.include cmosedu_models.txt    

.end
   
