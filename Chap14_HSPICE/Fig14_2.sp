*** Figure 14.2 CMOS: Circuit Design, Layout, and Simulation *** 

.option scale=50n post
.dc	vgs	-0.1	1	1m

vdd	vdd	0	DC	1
vd	vdd	vd	DC	0
vgs	vgs	0	DC	0

M1	vd	vgs	0	0	N_50n L=1 W=10

.include cmosedu_models.txt

.end
   

