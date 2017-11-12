*** Figure 18.22 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran	1n 30n

VDD	VDD	0	DC	1
Vinp	Vinp	0	DC	0	pulse 100mV 300mV 5n 5n 5n 5n 20n
Vinm	Vinm	0	DC	0.2

X1	VDD	Vinm	Vinp	Vout	pbuffer
Cload	Vout	0	50f

.subckt pbuffer	VDD	Vinm	Vinp	Vout
M1	Vom	Vinm	Vpp	VDD	P_50n L=1 W=20
M2 	Vop	Vinp	Vpp 	VDD	P_50n L=1 W=20
M6	Vpp	Vom	VDD	VDD	P_50n L=1 W=20

M3	Vom	Vom	0	0	N_50n L=1 W=10
M4	Vop	Vom	0	0	N_50n L=1 W=10

MI1	Vout	Vop	0	0	N_50n L=1 W=10
MI2	Vout	Vop	VDD 	VDD	P_50n L=1 W=20
.ends


.include cmosedu_models.edu  

.end
   
