*** Figure 1.31 CMOS: Circuit Design, Layout, and Simulation ***

*Run HSPICE and then Avanwaves to view signals
.option post
.tran 100p 8n UIC

Vclk	clk	0	pulse -1 1 2n

Vin	Vin	0	DC	5
R1	Vouts	Vout	1k
GS1 	Vin	Vouts	VCR PWL(1) 0 clk 0 100MEG 1m 0.1
R2	Vout	0	1k
L1	Vout	0	10u 	IC=5mA

.end
