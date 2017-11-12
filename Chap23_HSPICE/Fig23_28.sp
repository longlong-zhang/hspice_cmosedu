*** Figure 23.28 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc VDD 0 6 1m temp 0 100 25

VDD 	VDD	0	DC	5
Vop	Vop	0	DC	0
Von	VDD	Von	DC 	0
Vmeas1	Vmeas1	0	DC	0
Vmeas2	Vmeas2	0	DC	0

M1B	Vbiasn	Vbiasn	Vd1	0	N_1u L=2 W=10
M2B	n2	Vbiasn	Vr	0	N_1u L=2 W=10
M1T	vncas	vncas	vbiasn	0	N_1u L=2 W=10
M2T	vpcas	vncas	n2	0	N_1u L=2 W=10
M3T	n1 	Vbiasp	VDD	VDD	P_1u L=2 W=30
M4T	Vbiasp	Vbiasp	VDD	VDD	P_1u L=2 W=30
M3B	vncas	Vpcas	n1	VDD	P_1u L=2 W=30
M4B	Vpcas	Vpcas	Vbiasp	VDD	P_1u L=2 W=30

M5T	n3	vbiasp	VDD	VDD	P_1u L=2 W=30
M5B	Vref	vpcas	n3	VDD	P_1u L=2 W=30
RL	Vref	vd3	489k	TC1=0.002

Rb	Vr	vd2	52k	TC1=0.002

D1	Vd1	0	PNPDIODE
D2	vd2	0	PNPDIODE 8
D3	vd3	0	PNPDIODE 8
.model	PNPDIODE	D	IS=1e-18 n=1

** Start-up Circuit
MSU1	Vsur	Vbiasp	VDD	VDD	P_1u L=2   W=30
MSU2	Vncas	Vsur	Vpcas	VDD	P_1u L=2   W=30
MSU3	Vsur	Vsur	ns1	0	N_1u L=10  W=10
MSU4	ns1	ns1	ns2	0	N_1u L=10  W=10
MSU5	ns2	ns2	0	0	N_1u L=10  W=10
                                                                     
.include cmosedu_models.txt   

.end
      
