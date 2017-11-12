*** Figure 9.34 (PMOS) CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.AC	DEC 100	10MEG 10G

VSD 	0	VSD	DC	1
VSG	0	VSG	DC	350m	AC	1

M1	VSD	VSG	0	0	P_50n L=2 W=100

.include cmosedu_models.txt 

.end
   
