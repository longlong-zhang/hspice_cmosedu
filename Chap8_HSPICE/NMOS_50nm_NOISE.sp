*** NMOS Noise 50nm CMOS: Circuit Design, Layout, and Simulation ***

.option post
.ac dec 100 1 100MEG
.noise V(VDS) VGS 100

.options scale=50n

VDD	VDD	0	DC	500m

* Use a 1 ohm NOISELESS resistor to see MOSFET's noise current (see Fig. 8.23)

Gin 	VDD	VDS 	VDD 	VDS	1
M1	VDS	VGS	0	0	NMOS L=2 W=50

*Bias the MOSFET at the operating point in Table 9.2 (back inside cover)
VGS	VGS 	0	dc 	350m 	ac 1

.include cmosedu_models.txt

.end
   

