*** Figure 1.30 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 100p 8n UIC

Vclk	clk	0	pulse -1 1 2n

Vin	Vin	0	DC	5

GS1 	Vin	Vouts	VCR PWL(1) clk 0 0 100MEG 1m 0.1

R1	Vouts	Vout	1k
C1	Vout	0	1p	IC=2

.end
