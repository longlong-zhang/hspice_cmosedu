*** Example 8.5 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 1k
.noise V(2) Vin 100

R1	 1 2 10k 
R2	 2 0 1k 
Vin	 1 0	dc 0 ac 1
.end