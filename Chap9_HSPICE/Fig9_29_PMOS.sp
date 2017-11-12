*** Figure 9.29 (PMOS) CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.DC 	VSG	0.8	1.8	1m	TEMP 0 100 25

VSD 	0	VSD	DC	2
VSG	0	VSG	DC	0

M1	VSD	VSG	0	0	P_1u L=2 W=30
                                                                     
.include cmosedu_models.txt 

.end
      
