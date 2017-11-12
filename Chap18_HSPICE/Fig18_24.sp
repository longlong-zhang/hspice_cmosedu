*** Figure 18.24 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc	Vinp	0 	1 	1m 	Vinm	0	1 	100m
**.tran	1n 30n

VDD	VDD	0	DC	1
Vinp	Vinp	0	DC	0	pulse 100mV 300mV 5n 5n 5n 5n 20n
Vinm	Vinm	0	DC	0.2

X1	VDD	Vinm	Vinp	Vout	buffer
Cload	Vout	0	50f

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
   
