*** Figure 20.26 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post 
.tran 1m 1 sweep temp 0 100 25

VDD	VDD	0 	DC 	1

R1	VD1	0	65k	TC1=0.002
M1	VD1	VD1	VDD	VDD	P_50n L=2 W=100

.include cmosedu_models.txt  

.end
   

