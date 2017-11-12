*** Figure 1.33 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.ac dec 100 1 10k

Vin	Vin	0	DC	1	AC 1
Rin	Vin	vm	1k
Cf	Vout	vm	1u

X1	Vout	0	vm	Ideal_op_amp

.subckt	Ideal_op_amp	Vout	Vp	Vm
G1	Vout	0	Vm	Vp	1MEG
RL	Vout	0	1
.ends

.end