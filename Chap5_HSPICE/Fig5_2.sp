*** Figure 5.2 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.dc Vr 0.9 1.1 1m temp 0 100 25

vr	vr	0	DC	0

r1	vr	0	rmod	L=100 W=5

.model rmod R R=500 TC1=0.0024	

.end
