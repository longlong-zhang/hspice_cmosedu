*** Figure 13.34 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 1p 1n UIC

vdd	vdd	0	DC	1
vin	d	0	DC	0	pulse 0 1 500p 0 0 300p 600p

M1	d	vdd	a	0	N_50n L=1 W=10
M2	d	0	a	vdd	P_50n L=1 W=20

M3	a	0	n2	0	N_50n L=1 W=10
M4	a	vdd	n2	vdd	P_50n L=1 W=20

M5	b	0	n1	0	N_50n L=1 W=10
M6	b	vdd	n1	vdd	P_50n L=1 W=20

M7	b	a	0	0	N_50n L=1 W=10
M8	b	a	vdd	vdd	P_50n L=1 W=20

M9	n2	b	0	0	N_50n L=1 W=10
M10	n2	b	vdd	vdd	P_50n L=1 W=20

.include cmosedu_models.txt

.end
   

