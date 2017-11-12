*** Figure 10.5 NMOS CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc	vsd	0	6	1m	vsg	0	5	1

vsd	0	vsd	DC	0
vsg	0	vsg	DC	0

M1	vsd	vsg	0	0	P_1u L=1 W=10	

.include cmosedu_models.txt

.end
      