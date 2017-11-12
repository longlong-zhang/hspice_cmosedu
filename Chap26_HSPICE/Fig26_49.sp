* Figure 26.49 CMOS: Circuit Design, Layout, and Simulation *

.options post
.tran 0.1n 20n 0 0.1n UIC

*Clock Signals
Vphi1  phi1  0 DC 0  Pulse 0 	1   0    200p  200p  4n 10n
Vphi1b phi1b 0 DC 0  Pulse 1    0   0    200p  200p  4n 10n
Vphi2  phi2  0 DC 0  Pulse 0 	1   5n   200p  200p  4n 10n
Vphi2b phi2b 0 DC 0  Pulse 1    0   5n   200p  200p  4n 10n
R1 phi1  0 1MEG
R2 phi1b 0 1MEG
R3 phi2  0 1MEG
R4 phi2b 0 1MEG

.end
