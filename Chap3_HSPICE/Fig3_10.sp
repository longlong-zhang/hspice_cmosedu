*** Figure 3.10 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.tran 10p 5n UIC

vmetal2	vmetal2	0	DC	0	pulse 0 1 2n 1n

C12	vmetal2 vmetal1 209e-18
C1sub	vmetal1	0	164e-18

.end
