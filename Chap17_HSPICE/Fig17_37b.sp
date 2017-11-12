*** Figure 17.37b CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .25n 1500n 0 .25n UIC

VDD 	VDD	0	DC	1
Vphi1	phi1	0	DC	0	PULSE 0 1 1n 0 0 4n 10n
Vphi2	phi2	0	DC	0	PULSE 0 1 6n 0 0 4n 10n

Vblack	Vr	0	DC 	650mV
Vinten	Vi	0	DC	600mV

M1r	Vbuckb	vr	vdr2	0	N_50n L=1  W=10
M2r	Vdr2	Q	vdr3	0	N_50n L=1  W=10
M3r	Vdr3	phi1	vdr4	0	N_50n L=1  W=10
M4r	Vdr4	phi2	0	0	N_50n L=1  W=10
Mcupr	VDD	vdr4	VDD	VDD	P_50n L=10 W=50

M1i	Vbuck	vi	vdi2	0	N_50n L=1  W=10
M2i	Vdi2	VDD	vdi3	0	N_50n L=1  W=10
M3i	Vdi3	phi1	vdi4	0	N_50n L=1  W=10
M4i	Vdi4	phi2	0	0	N_50n L=1  W=10
Mcupi	VDD	Vdi4	VDD	VDD	P_50n L=10 W=50

M1p	vbuckb	vbuckb	VDD	VDD	P_50n L=10 W=10
M2p	vbuck	Vbuckb	VDD	VDD	P_50n L=10 W=10
Mbuck	0	Vbuck	0	0	N_50n L=10 W=500
Mbuckb	0	Vbuckb	0	0	N_50n L=10 W=500

MCP1	vp1	Vbuck	VDD	VDD	P_50n L=1 W=20
MCP2	vp2	out	vp1	VDD	P_50n L=1 W=20
MCP3	outb	phi2	vp2	VDD	P_50n L=1 W=20
MCP4	vp3	Vbuckb	VDD	VDD	P_50n L=1 W=20
MCP5	vp4	outb	vp3	VDD	P_50n L=1 W=20
MCP6	out	phi2	vp4	VDD	P_50n L=1 W=20

MCN1	outb	phi2	0	0	N_50n L=1 W=10
MCN2	outb	out	0	0	N_50n L=1 W=10
MCN3	out	outb	0	0	N_50n L=1 W=10
MCN4	out	phi2	0	0	N_50n L=1 W=10

X1	VDD	out	Qi	Q	NOR
X2	VDD	outb	Q	Qi	NOR

.subckt NOR VDD	A B ANORB
M1	vd1	A	VDD	VDD	P_50n L=1 W=20
M2	ANORB	B	vd1	VDD	P_50n L=1 W=20
M3	ANORB	A	0	0	N_50n L=1 W=10
M4	ANORB	B	0	0	N_50n L=1 W=10
.ends

.include cmosedu_models.txt

.end
   
