*** Figure 1.18 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.dc Vce 0 5 1m Ib 5u 25u 5u

Vce Vce 0 DC 0
Ib 0 Vb DC 0
Q1 Vce Vb 0 myNPN

.model myNPN NPN

.end
