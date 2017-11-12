*** Figure 27.27 CMOS: Circuit Design, Layout, and Simulation ***

.option scale=1u post

.DC Vx -1 1 .01 Vy -1 1 .5

E1	 Voplus 8 4 3 1E4
E2	 8 Vominus 4 3 1E4
M1       7 5 4 0 	N_1u	L=2 	W=10
M2       11 6 4 0 	N_1u  	L=2 	W=10
M3       7 6 3 0 	N_1u  	L=2 	W=10
M4       11 5 3 0 	N_1u  	L=2 	W=10
R10	 10 7 20K
R7	 10 11 20K
R8	 9 5 20K
R9	 9 6 20K
Rfn	 Vominus 4 20k
Rfp	 Voplus 3 20k
VCM	 8 0 DC 1.5 AC 0 0
VCMx	 10 0 DC 1.5 AC 0 0
VDCy	 9 0 DC 3.5 AC 0 0
Vx	 7 11 DC 0 AC 1 0
Vy	 5 6 DC 1 AC 0 0

.include cmosedu_models.txt    

.end

