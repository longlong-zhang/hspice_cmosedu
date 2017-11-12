*** Figure 19.72 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 100p 10n UIC

VDD 	VDD	0	DC	1	
Vnrz	NRZ	0	DC	0	PWL 0n 0 0.95n 0 1.05n 1 1.95n 1 2.05n 0 4.95n 0 5.05n 1 6.95n 1 7.05n 0
Vclock	clock	0	DC	0	PULSE 0 1 0.45n 0 0 0.4n 1n

Xh	VDD	NRZ	clock	inc	dec	hoggepd	

.subckt	hoggepd	VDD	NRZ	clock	incb	decb

X1	VDD	NRZ	di	inverter
X2	VDD	di	d	inverter
X4	VDD	clock	ci	inverter
X5	VDD	ci	c	inverter

M1t	n1t	d	VDD	VDD	P_50n L=1 W=20
M2t	n2t	c	n1t	VDD	P_50n L=1 W=20
M3t	n2t	d	0	0	N_50n L=1 W=10
M4t	n3t	c	VDD	VDD	P_50n L=1 W=20
M5t	n3t	n2t	n4t	0	N_50n L=1 W=10
M6t	n4t	c	0	0	N_50n L=1 W=10
M7t	Ai	n3t	VDD	VDD	P_50n L=1 W=20
M8t	Ai	c	n5t	0	N_50n L=1 W=10
M9t	n5t	n3t	0	0	N_50n L=1 W=10

X3	VDD	Ai	A	inverter
X7	VDD	A	Aii	inverter

M1b	n1b	A	VDD	VDD	P_50n L=1 W=20
M2b	n2b	ci	n1b	VDD	P_50n L=1 W=20
M3b	n2b	A	0	0	N_50n L=1 W=10
M4b	n3b	ci	VDD	VDD	P_50n L=1 W=20
M5b	n3b	n2b	n4b	0	N_50n L=1 W=10
M6b	n4b	ci	0	0	N_50n L=1 W=10
M7b	Bi	n3b	VDD	VDD	P_50n L=1 W=20
M8b	Bi	ci	n5b	0	N_50n L=1 W=10
M9b	n5b	n3b	0	0	N_50n L=1 W=10

X6	VDD	Bi	B	inverter
X8	VDD	B	Bii	inverter

M1xt	n6t	dii	VDD	VDD	P_50n L=1 W=20
M2xt	inc	diii	n6t	VDD	P_50n L=1 W=20
M3xt	inc	dii	n7t	0	N_50n L=1 W=10
M4xt	n7t	A	0	0	N_50n L=1 W=10
M5xt	n6t	A	VDD	VDD	P_50n L=1 W=20
M6xt	inc	Aii	n6t	VDD	P_50n L=1 W=20
M7xt	inc	diii	n8t	0	N_50n L=1 W=10
M8xt	n8t	Aii	0	0	N_50n L=1 W=10

M1xb	n6b	B	VDD	VDD	P_50n L=1 W=20
M2xb	dec	Bii	n6b	VDD	P_50n L=1 W=20
M3xb	dec	B	n7b	0	N_50n L=1 W=10
M4xb	n7b	A	0	0	N_50n L=1 W=10
M5xb	n6b	A	VDD	VDD	P_50n L=1 W=20
M6xb	dec	Aii	n6b	VDD	P_50n L=1 W=20
M7xb	dec	Bii	n8b	0	N_50n L=1 W=10
M8xb	n8b	Aii	0	0	N_50n L=1 W=10

X9	VDD	inc	inci	inverter
X10	VDD	inci	incb	inverter
X11	VDD	dec	deci	inverter
X12	VDD	deci	decb	inverter

X13	VDD	d	diii	inverter
Cd	diii	0	100f
X14	VDD	diii	dii	inverter

.ends

.subckt inverter	VDD	in	out	
M1	out	in	0	0	N_50n	L=1	W=10
M2	out	in	VDD	VDD	P_50n	L=1	W=20
.ends

.include cmosedu_models.txt   

.end
   

