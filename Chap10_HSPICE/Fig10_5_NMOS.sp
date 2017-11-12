*** Figure 10.5 NMOS CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.dc	vds	0	6	1m	vgs	0	5	1

vds	vds	0	DC	0
vgs	vgs	0	DC	0

M1	vds	vgs	0	0	N_1u L=1 W=10	

.include cmosedu_models.txt

.end
      