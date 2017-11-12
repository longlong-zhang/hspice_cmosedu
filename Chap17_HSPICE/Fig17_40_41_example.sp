*** Figure 17.40 and 17.41 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .25n 1500n 0 .25n UIC

VDD 	VDD	0	DC	1
Vphi1	phi1	0	DC	0	PULSE 0 1 1n 0 0 4n 10n
Vphi2	phi2	0	DC	0	PULSE 0 1 6n 0 0 4n 10n

Vselect	select	0	DC	0	PULSE 1.4 0 1u
Vselb	selectb	0	DC	0	PULSE 0 1.4 1u

Vblack	Vr	0	DC 	650mV
Vinten	Vi	0	DC	600mV

M1A	vr	select	vra	0	N_50n L=1 W=10
M2A	vi	select	via	0	N_50n L=1 W=10
M3A	vr	selectb	via	0	N_50n L=1 W=10
M4A	vi	selectb	vra	0	N_50n L=1 W=10

M1r	Vbuckb	vra	vdr2	0	N_50n L=1  W=10
M2r	Vdr2	vrb	vdr3	0	N_50n L=1  W=10
M3r	Vdr3	phi1	vdr4	0	N_50n L=1  W=10
M4r	Vdr4	phi2	0	0	N_50n L=1  W=10
Mcupr	VDD	vdr4	VDD	VDD	P_50n L=10 W=50

M1i	Vbuck	viaos	vdi2	0	N_50n L=1  W=10

*** ADJUST OFFSET HERE ***
VOS	viaos	via	DC	-40m

M2i	Vdi2	Vib	vdi3	0	N_50n L=1  W=10
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

M1C	Qi	select	DSMout	0	N_50n L=1 W=10
M2C	Q	selectb	DSMout	0	N_50n L=1 W=10
Cdsmout	DSMout	0	50f

M1B	Q	select	vrb	0	N_50n L=1 W=10
M2B	vDD	select	vib	0	N_50n L=1 W=10
M3B	Qi	selectb	vib	0	N_50n L=1 W=10
M4B	vDD	selectb	vrb	0	N_50n L=1 W=10

.subckt NOR VDD	A B ANORB
M1	vd1	A	VDD	VDD	P_50n L=1 W=20
M2	ANORB	B	vd1	VDD	P_50n L=1 W=20
M3	ANORB	A	0	0	N_50n L=1 W=10
M4	ANORB	B	0	0	N_50n L=1 W=10
.ends

.include cmosedu_models.txt

.end
   
