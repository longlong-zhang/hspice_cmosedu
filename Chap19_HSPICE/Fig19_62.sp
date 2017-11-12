*** Figure 19.62 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 10p 6n 5n 10p UIC

VDD 	VDD	0	DC	1	
Vref	Vref	0	DC	0.5
Vindel	vindel	0	DC	0.5
Vin	Vin	0	DC	0	pulse 0 1 5n 50p 50p 0.2n 5n

Xdline	VDD	vref	Vindel	vind	vini	outp	outm	dline
Xtg	VDD	0	VDD	vin	vind	tg
Xin	VDD	vin	vini	inverter

.subckt dline	VDD	vref	vindel	inp	inm	outp	outm

Xbias	VDD	vref	vpbias	vrbias	vindel	dbias
X1	VDD	vpbias	vrbias	inp	inm	o1p	o1m	delay
X2	VDD	vpbias	vrbias	o1p	o1m	o2p	o2m	delay
X3	VDD	vpbias	vrbias	o2p	o2m	o3p	o3m	delay
X4	VDD	vpbias	vrbias	o3p	o3m	o4p	o4m	delay
X5	VDD	vpbias	vrbias	o4p	o4m	o5p	o5m	delay
X6	VDD	vpbias	vrbias	o5p	o5m	o6p	o6m	delay
X7	VDD	vpbias	vrbias	o6p	o6m	o7p	o7m	delay
X8	VDD	vpbias	vrbias	o7p	o7m	outp	outm	delay
.ends


.subckt	delay	VDD	vpbias	vrbias	vp	vm	vop	vom
M1	n1	vpbias	VDD	VDD	P_50n L=1 W=200
M2	vom	vp	n1	VDD	P_50n L=1 W=20
M3	vop	vm	n1	VDD	P_50n L=1 W=20
M4	vop	vrbias	0	0	N_50n L=1 W=10
M5	vop	vop	0	0	N_50n L=2 W=10
M6	vom	vrbias	0	0	N_50n L=1 W=10
M7	vom	vom	0	0	N_50n L=2 W=10
*model parasitic C
Clp	vop	0	5f
Clm	vom	0	5f
.ends

.subckt dbias 	VDD	vref	vpbias	vrbias	vindel
M1	vpbias	vindel	vr	0	N_50n L=1 W=100
M2	vpbias	vpbias	VDD	VDD	P_50n L=1 W=20
M3	n1	vpbias	VDD	VDD	P_50n L=1 W=200
M4	n2	0	n1	VDD	P_50n L=1 W=20	
M5	n2	vrbias	0	0	N_50n L=1 W=10
M6	n2	n2	0	0	N_50n L=2 W=10
Rr	vr	0	10k
X1	VDD	n2	vref	vrbias	pdiff
.ends

.subckt	pdiff	VDD	Vp	Vm	vout	
M1	n1	vb	VDD	VDD	P_50n L=1 W=20
M2	vb	vp	n1	VDD	P_50n L=1 W=20
M3	vout	vm	n1	VDD	P_50n L=1 W=20
M4	vb	vb	0	0	N_50n L=1 W=10
M5	vout	vb	0	0	N_50n L=1 W=10
.ends

.subckt inverter	VDD	in	out	
M1	out	in	0	0	N_50n	L=1	W=10
M2	out	in	VDD	VDD	P_50n	L=1	W=20
.ends

.subckt	tg	VDD	pg	ng	in	out
M1	out	pg	in	VDD	P_50n L=1 W=20
M2	out	ng	in	0	N_50n L=1 W=10
.ends

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
   

