*** Figure 18.40a CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran	10p 30n 

VDD	VDD	0	DC	1
Vin 	in 	0 	DC	0	PULSE(1 0 0 10p 10p 5ns 10ns)

Mpd 	out 	in 	0 	0 	N_50n 	l=1 	w=10
Mc 	out 	boot 	out 	0 	N_50n 	l=10 	w=10
Mpu 	VDD 	boot 	out 	0 	N_50n 	l=4 	w=10
Md 	VDD 	VDD 	boot 	0 	N_50n 	l=1 	w=10

Cload	out	0	10f  	IC=0

.include cmosedu_models.txt 

.end
   
   
