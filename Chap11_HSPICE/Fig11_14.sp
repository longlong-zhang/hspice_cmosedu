*** Figure 11.14 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran 1p 2000p UIC
.ic v(osc)=1

vdd	vdd	0	DC	1

X1	osc	n1	vdd	inv
X2	n1	n2	vdd	inv
X3	n2	n3	vdd	inv
X4	n3	n4	vdd	inv
X5	n4	n5	vdd	inv
X6	n5	n6	vdd	inv
X7	n6	n7	vdd	inv
X8	n7	n8	vdd	inv
X9	n8	n9	vdd	inv
X10	n9	n10	vdd	inv
X11	n10	osc	vdd	inv

.subckt inv	vin 	vout	vdd
M1	vout	vin	0	0	N_50n L=1 W=10	
M2	vout	vin	vdd	vdd	P_50n L=1 W=20

.ends

.include cmosedu_models.txt   

.end
   

