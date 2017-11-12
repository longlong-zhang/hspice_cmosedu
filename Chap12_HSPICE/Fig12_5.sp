*** Figure 12.5 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc	vin	0	5	1m

vdd	vdd	0	DC	5
Vin	vin	0	DC	0

x1	vin	vin	vin	out	vdd	NOR_3

.subckt	NOR_3	A	B	C	out	VDD
M1	out	A	0	0	N_1u L=1 W=10
M2	out	B	0	0	N_1u L=1 W=10
M3	out	C	0	0	N_1u L=1 W=10
M4	n1	A	VDD	VDD	P_1u L=1 W=10
M5	n2	B	n1	VDD	P_1u L=1 W=10
M6	out	C	n2	VDD	P_1u L=1 W=10
.ends

.include cmosedu_models.txt

.end
      
