*** Figure 1.32 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.AC lin 100 400MEG 600MEG

Iin 	Vout 	0 	DC 	0 	AC 	1
R1 	Vout 	0 	1k 
L1 	Vout 	0 	10n
C1 	Vout 	0 	10p

.end

