*** Figure 23.26 CMOS: Circuit Design, Layout, and Simulation ***

.option post
.dc VDD 4 6 1m temp 0 100 25

VDD VDD 0 5
MSU3 N007 N007 0 0 N_1u l=10u w=10u
MSU1 VDD Vbias1 vsuref VDD P_1u l=2u w=30u
M3T VDD Vbias1 N001 VDD P_1u l=2u w=30u
M3B N001 Vbias2 N003 VDD P_1u l=2u w=30u
M4T VDD Vbias1 Vbias1 VDD P_1u l=2u w=30u
M4B Vbias1 Vbias2 Vbias2 VDD P_1u l=2u w=30u
M2B N005 N004 N008 0 N_1u l=2u w=10u
M1B N004 N004 P001 0 N_1u l=2u w=10u
R1 N008 N009 52k TC1=0.002
M2T Vbias2 N003 N005 0 N_1u l=2u w=10u
M1T N003 N003 N004 0 N_1u l=2u w=10u
D1 P001 0 PNPDIODE
MSU2 Vbias2 vsuref N003 VDD P_1u l=1u w=10u
MSU4 N006 N006 N007 0 N_1u l=10u w=10u
MSU5 vsuref vsuref N006 0 N_1u l=10u w=10u
D2 N009 0 PNPDIODE 8
M1 VDD Vbias1 N002 VDD P_1u l=2u w=30u
M2 N002 Vbias2 VREF VDD P_1u l=2u w=30u
R2 VREF 0 2.5MEG TC1=0.002
.model	PNPDIODE	D	IS=1e-18 n=1
                                                                     
.include cmosedu_models.txt   

.end
      
