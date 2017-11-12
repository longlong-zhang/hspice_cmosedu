*** Figure 31.53 CMOS: Circuit Design, Layout, and Simulation ***

.options scale=50n 
.tran 50n 30u 0 UIC

VDD	VDD	0	DC	1
XU1 	Vbias1 	Vhigh 	Vbias2 	Vpcas 	Vncas 	Vbias3 	Vlow 	Vbias4 	VDD 	0 	fig_20_47
M1 	N002 	in 	0 	0 	N_50n 	l=2 	w=10
M4 	VDD 	Vbias1 	N001 	VDD 	P_50n 	l=2 	w=20
M2 	out 	Vbias3 	N002 	0 	N_50n 	l=2 	w=10
M3 	N001 	Vbias2 	out 	VDD 	P_50n 	l=2 	w=20
I1 	in 	0	10p	
CF 	in 	out 	10f
M5 	out 	reset 	in 	0 	N_50n 	l=1 	w=10
Vreset 	reset 	0 	PULSE(1 0 5u 1n )
Cload 	out 	0 	10p


.subckt	fig_20_47 	Vbias1 	Vhigh 	Vbias2 	Vpcas 	Vncas 	Vbias3 	Vlow 	Vbias4 	VDD	GND
MSU2 	VDD 	N002 	N002 	VDD 	P_50n 	l=20 	w=10
MSU1 	N002 	N003 	0 	0 	N_50n 	l=2 	w=50
MSU3 	Vbiasp 	N002 	N003 	0 	N_50n 	l=1 	w=10
M3 	VDD 	Vbiasp 	N003 	VDD 	P_50n 	l=2 	w=100
M4 	VDD 	Vbiasp 	N004 	VDD 	P_50n 	l=2 	w=100
M1 	N003 	N003 	0 	0 	N_50n 	l=2 	w=50
M2 	N004 	N004 	N005 	0 	N_50n 	l=2 	w=200
R1 	N005 	GND 	5.5k 	TC1=0.002
MA4 	VDD 	N001 	Vbiasp 	VDD 	P_50n 	l=2 	w=100
MA3 	VDD 	N001 	N001 	VDD 	P_50n 	l=2 	w=100
M5 	N001 	N004 	0 	0 	N_50n 	l=2 	w=50
M6 	Vbiasp 	N003 	0 	0 	N_50n 	l=2 	w=50
M7 	VDD 	Vbiasp 	VDD 	VDD 	P_50n 	l=100 	w=100
MA1 	VDD 	Vbiasp 	Vbias3 	VDD 	P_50n 	l=2 	w=100
MA2 	VDD 	Vbiasp 	Vbias4 	VDD 	P_50n 	l=2 	w=100
MSU4 	Vbias3 	Vbias3 	0 	0 	N_50n 	l=10 	w=10
M8 	Vbias4 	Vbias3 	Vlow 	0 	N_50n 	l=2 	w=50
M9 	Vlow 	Vbias4 	0 	0 	N_50n 	l=2 	w=50
M10 	Vpcas 	Vbias3 	N009 	0 	N_50n 	l=2 	w=50
M11 	N009 	Vbias4 	0 	0 	N_50n 	l=2 	w=50
M12 	Vbias2 	Vbias3 	N010 	0 	N_50n 	l=2 	w=50
M13 	N010 	Vbias4 	0 	0 	N_50n 	l=2 	w=50
M14 	Vbias1 	Vbias3 	N011 	0 	N_50n 	l=2 	w=50
M15 	N011 	Vbias4 	0 	0 	N_50n 	l=2 	w=50
MA5 	N006 	Vpcas 	Vpcas 	VDD 	P_50n 	l=2 	w=100
MA6 	N007 	Vbias2 	N006 	VDD 	P_50n 	l=2 	w=100
MA7 	VDD 	N006 	N007 	VDD 	P_50n 	l=2 	w=100
MA8 	VDD 	Vbias2 	Vbias2 	VDD 	P_50n 	l=10 	w=20
MA9 	Vhigh 	Vbias2 	Vbias1 	VDD 	P_50n 	l=2 	w=100
MA10 	VDD 	Vbias1 	Vhigh 	VDD 	P_50n 	l=2 	w=100
MA11 	N008 	Vbias2 	Vncas 	VDD 	P_50n 	l=2 	w=100
MA12 	VDD 	Vbias1 	N008 	VDD 	P_50n 	l=2 	w=100
M16 	Vncas 	Vncas 	N012 	0 	N_50n 	l=2 	w=50
M17 	N012 	Vbias3 	P001 	0 	N_50n 	l=2 	w=50
M18 	P001 	N012 	0 	0 	N_50n 	l=2 	w=50
.ends fig_20_47

.include cmosedu_models.txt

.end
