*** Figure 9.29 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post
.DC 	VGS	0.8	1.6	1m 	TEMP	0 100 25

VDS 	VDS	0	DC	2
VGS	VGS	0	DC	0

M1	VDS	VGS	0	0	N_1u L=2 W=10
                                                                     
.include cmosedu_models.txt

.end
      
