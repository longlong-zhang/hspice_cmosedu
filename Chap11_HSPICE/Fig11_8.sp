*** Figure 11.8 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc vin 0 5 1m

vdd	vdd	0	DC	5
Vin	vin	0	DC	0

* Inverter with Bn/Bp = 3
M13	vout3	vin	0	0	N_1u L=1 W=10	
M23	vout3	vin	vdd	vdd	P_1u L=1 W=10

* Inverter with Bn/Bp = 1
M11	vout1	vin	0	0	N_1u L=1 W=10	
M21	vout1	vin	vdd	vdd	P_1u L=1 W=30

* Inverter with Bn/Bp = 1/3 = 
M1333	vout333	vin	0	0	N_1u L=1 W=10	
M2333	vout333	vin	vdd	vdd	P_1u L=1 W=90

.include cmosedu_models.txt

.end
      