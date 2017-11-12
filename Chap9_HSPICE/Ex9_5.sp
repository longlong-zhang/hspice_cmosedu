*** Example 9.5 CMOS: Circuit Design, Layout, and Simulation ***


.option scale=1u post
.op	
**.ac dec 100 1 10k
**.tran 1u 300u

VDD 	VDD	0	DC	5
VG1	VG1	0	DC	2.5	AC	1m 	SIN 2.5 1m 10k
VG2	VG2	0	Dc	2.5
Ibias	VS12	0	DC	40u

M1	VD13	VG1	VS12	0	N_1u L=2 W=10
M2	VD24	VG2	VS12	0	N_1u L=2 W=10
M3	VD13	VD13	VDD	VDD	P_1u L=2 W=30
M4	VD24	0	VDD	VDD	P_1u L=2 W=30

.include cmosedu_models.txt

.end
      