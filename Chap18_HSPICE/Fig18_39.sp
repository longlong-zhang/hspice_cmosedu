*** Figure 18.39 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 	100p 	30n

VDD 	VDD 	0 	DC	1
Vin 	N003 	0 	DC	0	PULSE(1 0 0 10p 10p 5ns 10ns)

M1i 	N001 	N003 	0 	0 	N_50n 	l=1 	w=50
M2i 	VDD 	N003 	N001 	VDD 	P_50n 	l=1 	w=100
M1a 	N002 	N001 	0 	0 	N_50n 	l=1 	w=50
M2a 	VDD 	N001 	N002 	VDD 	P_50n 	l=1 	w=100
M3 	Vout 	N001 	0 	0 	N_50n 	l=1 	w=100
M4 	B 	N001 	Vout 	B 	P_50n 	l=1 	w=100
M2 	VDD 	A 	B 	0 	N_50n 	l=1 	w=100
M1 	VDD 	B 	A 	0 	N_50n 	l=1 	w=20

Cload 	Vout 	0 	100f
C1 	N001 	A 	100f
C2 	N002 	B 	1p

.include cmosedu_models.txt 

.end
   
   
