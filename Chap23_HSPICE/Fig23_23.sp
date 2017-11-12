*** Figure 23.23 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VDD 4 6 1m sweep temp 0 100 25

VDD 	VDD	0	DC	5
Vop	Vop	0	DC	0
Von	VDD	Von	DC 	0
Vmeas1	Vmeas1	0	DC	0
Vmeas2	Vmeas2	0	DC	0

M1B	Vbiasn	Vbiasn	Vd	0	N_1u L=2 W=10
M2B	n2	Vbiasn	Vr	0	N_1u L=2 W=10
M1T	vncas	vncas	vbiasn	0	N_1u L=2 W=10
M2T	vpcas	vncas	n2	0	N_1u L=2 W=10
M3T	n1 	Vbiasp	VDD	VDD	P_1u L=2 W=30
M4T	Vbiasp	Vbiasp	VDD	VDD	P_1u L=2 W=30
M3B	vncas	Vpcas	n1	VDD	P_1u L=2 W=30
M4B	Vpcas	Vpcas	Vbiasp	VDD	P_1u L=2 W=30

Rb	Vr	0	700k	TC1=0.002
D1	VD	0	PNPDIODE
.model	PNPDIODE	D	IS=1e-18 n=1

MSU1	Vsur	Vbiasn	0	0	N_1u L=2   W=10
MSU2	Vsur	Vsur	VDD	VDD	P_1u L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_1u L=1   W=10
                                                                     
.include cmosedu_models.txt   

.end
      
