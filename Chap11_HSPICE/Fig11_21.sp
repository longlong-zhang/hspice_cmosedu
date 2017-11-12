*** Figure 11.21 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.tran 10p 3n
**.dc vp 0 1 1m

vdd	vdd	0	DC	1
vin	vin	0	DC	0	pulse 0 1 100p 0 0 1n 2n

M1 N001 Vin 0 0 N_50n l=50n w=500n
M2 VDD Vin N001 VDD P_50n l=50n w=1u
M3 N002 N001 0 0 N_50n l=50n w=500n m=8
M4 VDD N001 N002 VDD P_50n l=50n w=1u m=8
M5 N003 N002 0 0 N_50n l=50n w=500n m=64
M6 VDD N002 N003 VDD P_50n l=50n w=1u m=64
M7 N004 N003 0 0 N_50n l=50n w=500n m=512
M8 VDD N003 N004 VDD P_50n l=50n w=1u m=512
M9 Vout N004 0 0 N_50n l=50n w=500n m=4096
M10 VDD N004 Vout VDD P_50n l=50n w=1u m=4096

CL	Vout	0	20p

.include cmosedu_models.txt

.end
   

