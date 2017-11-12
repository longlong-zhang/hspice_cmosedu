*** Figure 23.31 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.dc VDD 0 1.1 1m temp 0 100 25

VDD 	VDD	0	DC	1 

M1	vd1	vbiasp	VDD	VDD	P_50n L=2 W=20
M2	vr	vbiasp	VDD	VDD	P_50n L=2 W=20
M3	vref	vbiasp	VDD	VDD	P_50n L=2 W=20

D1	Vd1	0	PNPDIODE
D2	vd2	0	PNPDIODE 8
.model	PNPDIODE	D	IS=1e-18 n=1	

R1	Vd1	0	489k	TC1=0.002
Rr	Vr	vd2	52k	TC1=0.002
R2	vr	0	489k	TC1=0.002
RL	vref	0	208k	TC1=0.002

Xamp	VDD	vbiasp	vr	vd1	ndiff

.subckt ndiff	VDD	vout	vp	vm
M1	vob	vp	vss	0	N_50n L=2 W=10
M2	vout	vm	vss	0	N_50n L=2 W=10
M3	vss	vob	0	0	N_50n L=2 W=10
M4	vob	vob	VDD	VDD	P_50n L=2 W=20
M5	vout	vob	VDD	VDD	P_50n L=2 W=20
.ends

**start-up circuit
Mpu	vsu	vbiasp	VDD	VDD	P_50n L=2 W=20
Mpd	vsu	vsu	0	0	N_50n L=100 W=10
Ms	vd1	vsu	vbiasp	VDD	P_50n L=1 W=10

.include cmosedu_models.txt   

.end
   

