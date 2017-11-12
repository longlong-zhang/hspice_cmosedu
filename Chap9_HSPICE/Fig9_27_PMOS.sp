*** Figure 9.27 (PMOS) CMOS: Circuit Design, Layout, and Simulation ***

*#destroy all
*#run
*#let ID=-VSD#branch
*#let gm=deriv(ID)
*#plot gm
*#plot ID

.option scale=50n
.DC 	VSG	0	1	1m

VSD 	0	VSD	DC	.1
VSG	0	VSG	DC	0

M1	VSD	VSG	0	0	P_50n L=2 W=20

.include cmosedu_models.txt

.end
   
