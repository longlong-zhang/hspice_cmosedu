*** Figure 1.34 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 10u 10m UIC

.ic v(vout)=1

Vin	Vin	0	DC	1	pulse -1 1 0 1u 1u 2m 4m
Rin	Vin	vm	1k
Cf	Vout	vm	1u

X1	Vout	0	vm	Ideal_op_amp

.subckt	Ideal_op_amp	Vout	Vp	Vm
G1	Vout	0	Vm	Vp	1MEG
RL	Vout	0	1
.ends

.end