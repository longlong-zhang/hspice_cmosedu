*** Figure 18.29a CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran	0.1n 300n

VDD	VDD	0	DC	1


Vin	Vin	0	DC	0	PULSE 0 1 0 0 0 4n 20n
* PULSE 0 1 0 0 0 4n 20n
* PULSE 0 1 0 0 0 12n 20n
R1	Vin	in	1k
C1	in	0	10p

X1	VDD	in	vmax	outmax	buffer
MPlong	vmax	outmax	VDD	VDD	P_50n L=1 W=10
Cmax	vmax	0	1p
Rmax	vmax	avg	100k

Cavg	avg	0	1p

X2	VDD	in	vmin	outmin	buffer
MNlong	vmin	outmin	0	0	N_50n L=1 W=10
Cmin	vmin	0	1p
Rmin	vmin	avg	100k

X3	VDD	avg	in	Out	buffer


.subckt buffer	VDD	Vinm	Vinp	Vout
M1p	Vomp	Vinm	Vppp	VDD	P_50n L=1 W=20
M2p 	Vop	Vinp	Vppp 	VDD	P_50n L=1 W=20
M6p	Vppp	Vomp	VDD	VDD	P_50n L=1 W=20

M3p	Vomp	Vomp	0	0	N_50n L=1 W=10
M4p	Vop	Vomp	0	0	N_50n L=1 W=10

MI1	Vout	Vop	0	0	N_50n L=1 W=10
MI2	Vout	Vop	VDD 	VDD	P_50n L=1 W=20

M1 	Vom	Vinm	Vnn	0	N_50n L=1 W=10
M2	Vop	Vinp	Vnn	0	N_50n L=1 W=10
M6	Vnn	Vom	0	0	N_50n L=1 W=10

M3	Vom	Vom	VDD 	VDD	P_50n L=1 W=20
M4	Vop	Vom	VDD	VDD	P_50n L=1 W=20
.ends

.include cmosedu_models.txt    

.end
   
