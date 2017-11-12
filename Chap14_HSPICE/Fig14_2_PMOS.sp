*** Figure 14.2 (PMOS) CMOS: Circuit Design, Layout, and Simulation *** 

.option scale=50n post
.dc	vsg	-0.1	1	1m

vdd	vdd	0	DC	1
vd	vdd	vd	DC	0
vsg	vdd	vsg	DC	0

M1	0	vsg	vd	vd	P_50n L=1 W=10

.include cmosedu_models.txt

.end
   

