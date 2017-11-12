*** SPICE Circuit File of MOS_TEST1_LAY  02/27/04 15:59:22

* Start of C:\Lasi7\Mosis\Mos_test1.txt

.option post
vds d s DC 0
vgs g s DC 0

.dc vds 0 1 1m vgs 0 1 0.25

*Important
.options scale=50nm

*ground the source
Vs  s 0 DC 0

* End of C:\Lasi7\Mosis\Mos_test1.txt

* MAIN MOS_TEST1_LAY
M1 d g s 0 N_50n L=1 W=10

.include cmosedu_models.txt

.end
   
* End of C:\Lasi7\Mosis\50nm_models.txt
.END
