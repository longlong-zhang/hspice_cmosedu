*** Figure 9.10 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc 	Iinject	-1u 	1u 	10n	

VDD 	VDD	0	DC	5
Ibias	VDD	VG3	DC	1u
Iinject	0	VD2m	DC	0
vmeas 	VD2 	Vd2m 	DC 	0

M1	VG1	VG1	0	0	N_1u L=1 W=10
M2	VD2m	VG1	0	0	N_1u L=1 W=10
M3	VG3	VG3	VG1	0	N_1u L=1 W=10
M4	VDD	VG3	VD2	0	N_1u L=1 W=10

.include cmosedu_models.txt

.end
      