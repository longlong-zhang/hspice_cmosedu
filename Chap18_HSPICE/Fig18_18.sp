*** Figure 18.18 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc	Vinp	0 	1 	1m 	Vinm	0	1 	200m

VDD	VDD	0	DC	1
Vinp	Vinp	0	DC	0
Vinm	Vinm	0	DC	0.5

X1	VDD	Vinm	Vinp	Vout	nbuffer

.subckt nbuffer	VDD	Vinm	Vinp	Vout
M1 	Vom	Vinm	Vnn	0	N_50n L=1 W=10
M2	Vop	Vinp	Vnn	0	N_50n L=1 W=10
M6	Vnn	Vom	0	0	N_50n L=1 W=10

M3	Vom	Vom	VDD 	VDD	P_50n L=1 W=20
M4	Vop	Vom	VDD	VDD	P_50n L=1 W=20

MI1	Vout	Vop	0	0	N_50n L=1 W=10
MI2	Vout	Vop	VDD 	VDD	P_50n L=1 W=20
.ends

.include cmosedu_models.txt    

.end
   
