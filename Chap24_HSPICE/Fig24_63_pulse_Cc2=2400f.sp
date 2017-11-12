*** Figure 24.63_pulse with Cc2=2400fF CMOS: Circuit Design, Layout, and Simulation ***

.option scale=50n post
.tran .1n 700n 450n UIC

VDD 	VDD	0	DC	1	

Vin	Vin	0	DC	0	PULSE 500m  600m 500n 0 0 100n 1000n

Cc1	n3	n1i	240f
Cc2	vout	vd41	2400f	
cl	vout	0	1000f

Xbias	VDD Vbiasn Vbiasp bbias

M3T1	vd31	n1i	VDD	VDD	P_50n L=1 W=100
M3B1	n1i	n1i	vd31	VDD	P_50n L=1 W=100
M4T1	vd41	n1i	VDD	VDD	P_50n L=1 W=100
M4B1	n1	n1i	vd41	VDD	P_50n L=1 W=100

M3T2	vd32	n3i	VDD	VDD	P_50n L=1 W=100
M3B2	n3i	n3i	vd32	VDD	P_50n L=1 W=100
M4T2	vd42	n3i	VDD	VDD	P_50n L=1 W=100
M4B2	n3	n3i	vd42	VDD	P_50n L=1 W=100

M7T	vd7	n3	VDD	VDD	P_50n L=1 W=100
M7B	vout	n3	vd7	VDD	P_50n L=1 W=100

M11	n1i	vout	vs1	0	N_50n L=2 W=50
M21	n1	vin	vs1	0	N_50n L=2 W=50
M6L1	vs1	vbiasn	0	0	N_50n L=2 W=50
M6R1	vs1	vbiasn	0	0	N_50n L=2 W=50

M12	n3i	n1	vs2	0	N_50n L=2 W=50
M22	n3	n1i	vs2	0	N_50n L=2 W=50
M6L2	vs2	vbiasn	0	0	N_50n L=2 W=50
M6R2	vs2	vbiasn	0	0	N_50n L=2 W=50

M8	vout	vbiasn	0	0	N_50n L=2 W=50

.subckt bbias VDD Vbiasn Vbiasp

MBM1	Vbiasn	Vbiasn	0	0	N_50n L=2 W=50
MBM2	Vreg	Vreg	Vr	0	N_50n L=2 W=200
MBM3	Vbiasn	Vbiasp	VDD	VDD	P_50n L=2 W=100
MBM4	Vreg	Vbiasp	VDD	VDD	P_50n L=2 W=100

Rbias	Vr	0	5.5k

*amplifier 
MA1	Vamp	Vreg	0	0	N_50n L=2 W=50
MA2	Vbiasp	Vbiasn	0	0	N_50n L=2 W=50
MA3	Vamp	Vamp	VDD	VDD	P_50n L=2 W=100
MA4	Vbiasp	Vamp	VDD	VDD	P_50n L=2 W=100

MCP	VDD	Vbiasp	VDD	VDD	P_50n L=100 W=100

*start-up stuff
MSU1	Vsur	Vbiasn	0	0	N_50n L=2   W=50
MSU2	Vsur	Vsur	VDD	VDD	P_50n L=20  W=10
MSU3	Vbiasp	Vsur	Vbiasn	0	N_50n L=1   W=10

.ends

.include cmosedu_models.txt   

.end
   

