*** Figure 12.3 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc	vin	0	5	1m

vdd	vdd	0	DC	5
Vin	vin	0	DC	0

x1	vin	vin	vin	out	vdd	NAND_3

.subckt	NAND_3	A	B	C	out	VDD
M1	n1	A	0	0	N_1u L=1 W=10
M2	n2	B	n1	0	N_1u L=1 W=10
M3	out	C	n2	0	N_1u L=1 W=10
M4	out	A	VDD	VDD	P_1u L=1 W=10
M5	out	B	VDD	VDD	P_1u L=1 W=10
M6	out	C	VDD	VDD	P_1u L=1 W=10
.ends

.include cmosedu_models.txt

.end
      
