*** Figure 10.23 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post

.tran 10p 15n 5n UIC

vdd	vdd	0	DC	1
Vin	vin	0	DC	0	pulse 0 1 5n 100p 100p 5n 10n

M1	vin	vdd	n1	0	N_1u L=1 W=10	
M2	n1	vdd	n2	0	N_1u L=1 W=10
M3	n2	vdd	n3	0	N_1u L=1 W=10
M4	n3	vdd	n4	0	N_1u L=1 W=10
M5	n4	vdd	n5	0	N_1u L=1 W=10
M6	n5	vdd	n6	0	N_1u L=1 W=10
M7	n6	vdd	n7	0	N_1u L=1 W=10
M8	n7	vdd	n8	0	N_1u L=1 W=10
M9	n8	vdd	n9	0	N_1u L=1 W=10
M10	n9	vdd	vout	0	N_1u L=1 W=10

cl	vout	0	50f

.include cmosedu_models.txt

.end
   

