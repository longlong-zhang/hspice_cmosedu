*** PMOS Noise 50nm CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 100MEG
.noise V(VSD) VSG 100

.options scale=50n

VDD	VDD	0	DC	500m

* Use a 1 ohm NOISELESS resistor to see MOSFET's noise current (see Fig. 8.23)

Gin 	VSD 	0	VSD	0	1
M1	VSD	VSG	VDD	VDD	PMOS L=2 W=100

*Bias the MOSFET at the operating point in Table 9.2 (back inside cover)
VSG	VDD	VSG	dc 	350m 	ac 	1

.include cmosedu_models.txt

.end
   

