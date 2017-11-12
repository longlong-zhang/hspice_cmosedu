*** Figure 23.20 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.tran 1m 1 sweep temp 25 29 1

ID	0	VD	DC	1u

D1	VD	0	PNPDIODE

.MODEL 	PNPDIODE	D	is=1e-18	n=1

.end
   

