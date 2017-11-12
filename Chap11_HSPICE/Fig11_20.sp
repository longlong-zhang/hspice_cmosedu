*** Figure 11.20 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.tran 10p 3n 
*.dc vp 0 1 1m

vdd	vdd	0	DC	1
vin	vin	0	DC	0	pulse 0 1 100p 0 0 1n 2n

M1 N001 Vin 0 0 N_50n l=50n w=500n
M2 VDD Vin N001 VDD P_50n l=50n w=1u
M3 N002 N001 0 0 N_50n l=50n w=500n m=2.718
M4 VDD N001 N002 VDD P_50n l=50n w=1u m=2.718
M5 N003 N002 0 0 N_50n l=50n w=500n m=7.388
M6 VDD N002 N003 VDD P_50n l=50n w=1u m=7.388
M7 N004 N003 0 0 N_50n l=50n w=500n m=20
M8 VDD N003 N004 VDD P_50n l=50n w=1u m=20
M9 N005 N004 0 0 N_50n l=50n w=500n m=54.6
M10 VDD N004 N005 VDD P_50n l=50n w=1u m=54.6
M11 N006 N005 0 0 N_50n l=50n w=500n m=148.3
M12 VDD N005 N006 VDD P_50n l=50n w=1u m=148.3
M13 N007 N006 0 0 N_50n l=50n w=500n m=403
M14 VDD N006 N007 VDD P_50n l=50n w=1u m=403
M15 N008 N007 0 0 N_50n l=50n w=500n m=1096
M16 VDD N007 N008 VDD P_50n l=50n w=1u m=1096
M17 Vout N008 0 0 N_50n l=50n w=500n m=2978
M18 VDD N008 Vout VDD P_50n l=50n w=1u m=2978

CL	Vout	0	20p

.include cmosedu_models.txt

.end
   

