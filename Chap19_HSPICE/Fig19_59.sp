*** Figure 19.59 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc vindel 300m 800m 1m VDD 900m 1.1 50m

VDD 	VDD	0	DC	1	
Vref	Vref	0	DC	0.5
Vindel	vindel	0	DC	0

X1	VDD	vref	vrbias	vpbias	vindel	dbias

.subckt dbias 	VDD	vref	vrbias	vpbias	vindel
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

.include cmosedu_models.txt    

.end
   

