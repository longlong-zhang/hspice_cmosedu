
** 
** Complete 400MHz/25MHz PLL circuit based on RJ Baker components.
**

.option scale=50n 
.option post accurate
.include "PLLlib.sp"    $ subcircuits and models

.param phase=0.0 


*------------------------------------------------------------
* PLL circuit: 25 MHz reference, VCO locks at 400 MHz
*
VDD     VDD     0       DC      1.0  $ 1 Volt circuit components

*
* Reference signal is 25 MHz buffered sinusoid, phase adjustable
*
vref    refIn    0     DC      0       sin(0.5  0.5 25.0MEG  0.0 0.0 phase )
Xrefinv VDD     refIn    ref   inverter

*
* PFD and charge pump 
*
XPD     VDD     ref    divOut   up      down    pfd
XCP     VDD     up     down     invco           CP

*
* Loop Filter
*
R1      invco      vrc     20k
C1      vrc        0       10p 
C2      invco      0       1p 

*
* VCO (400 MHz @ vin=0.5V) and divider
*
Xvco	VDD	invco	VCOout 	VCO5stage
Xdiv	VDD	VCOout	divOut	dby16


**------------------------------------------------------------
** Transient Test Bench
**
** .option sim_accuracy=10  $ use for HSPICE RF

.ic v(xvco.out1)=1.0 v(VCOout)=0.5 v(refIn)=0.5
.tran 100p 2.0u   UIC
.probe v(ref) v(divOut) v(invco) v(up) v(down) v(VCOout)
.print v(ref) v(divOut) v(invco) v(up) v(down) v(VCOout)


.end
   

