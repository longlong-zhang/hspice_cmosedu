*** Figure 18.40b CMOS: Circuit Design, Layout, and Simulation ***

.option	scale=50n	post
.tran	100p 	30n 

VDD	VDD	0	DC	1
VS 	S 	0 	DC	0	PULSE(0 1 0 10p 10p 5ns 10ns)
VR 	R 	0 	DC	0	PULSE(0 1 5n 10p 10p 5ns 10ns)

M1 	N003 	R 	0 	0 	N_50n 	l=1 	w=10
Mc1 	S 	A 	S 	0 	N_50n 	l=10 	w=10
M2 	VDD 	S 	N003 	0 	N_50n 	l=1 	w=10
M3 	N004 	N003 	0 	0 	N_50n 	l=1 	w=10
M4 	VDD 	R 	N004 	0 	N_50n 	l=1 	w=10
M5 	VDD 	R 	A 	0 	N_50n 	l=1 	w=10
M6 	B 	A 	S 	0 	N_50n 	l=1 	w=10
M7 	A 	S 	N004 	0 	N_50n 	l=1 	w=10
M8 	N002 	R 	0 	0 	N_50n 	l=1 	w=10
M9 	B 	VDD 	N002 	0 	N_50n 	l=1 	w=10
M10 	N001 	N004 	0 	0 	N_50n 	l=1 	w=10
Mc2 	N001 	B 	N001 	0 	N_50n 	l=10 	w=10
M12 	VDD 	B 	N001 	0 	N_50n 	l=1 	w=10
M13 	VDD 	B 	out 	0 	N_50n 	l=1 	w=40
M11 	out 	N005 	0 	0 	N_50n 	l=1 	w=40
M14 	N005 	S 	0 	0 	N_50n 	l=1 	w=10
M15 	VDD 	R 	N005 	0 	N_50n 	l=1 	w=10

Cload out 0 100f

.include cmosedu_models.txt 

.end
   
   
