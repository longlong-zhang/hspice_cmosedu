*** Figure 1.15 CMOS: Circuit Design, Layout, and Simulation ***

* View listing file to see transfer function information (Edit LL on menu buttons)
.TF 	V(Vout,0) Vin

Vin	Vin	0	DC	1
Rin	Vin	Vm	1k
Rf	Vout	Vm	3k

X1	Vout	0	vm	Ideal_op_amp

.subckt	Ideal_op_amp	Vout	Vp	Vm
G1	Vout	0	Vm	Vp	1MEG
RL	Vout	0	1
.ends

.end