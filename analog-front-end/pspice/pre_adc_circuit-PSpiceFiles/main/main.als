.ALIASES
_    delyiannis_filter(Vin=N43000 Vo=N42996 Vsrc+=N10244 Vsrc-=N10256 Voff=0 ) CN 
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1)
R_delyiannis_filter_R2          delyiannis_filter.R2(1=delyiannis_filter_N03304 2=N42996 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3286@ANALOG.R.Normal(chips)
C_delyiannis_filter_C1          delyiannis_filter.C1(1=delyiannis_filter_N03272 2=delyiannis_filter_N03304 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3344@ANALOG.C.Normal(chips)
R_delyiannis_filter_R3          delyiannis_filter.R3(1=0 2=delyiannis_filter_N03272 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3448@ANALOG.R.Normal(chips)
C_delyiannis_filter_C2          delyiannis_filter.C2(1=delyiannis_filter_N03272 2=N42996 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3254@ANALOG.C.Normal(chips)
R_delyiannis_filter_R1          delyiannis_filter.R1(1=N43000 2=delyiannis_filter_N03272 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3328@ANALOG.R.Normal(chips)
X_delyiannis_filter_U1          delyiannis_filter.U1(+=0 -=delyiannis_filter_N03304 OUT=N42996 V+=N10244 V-=N10256 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS5579@OPA855.OPA855.Normal(chips)
_    _(delyiannis_filter.Vin=N43000)
_    _(delyiannis_filter.Vo=N42996)
_    _(delyiannis_filter.Voff=0)
_    _(delyiannis_filter.Vsrc+=N10244)
_    _(delyiannis_filter.Vsrc-=N10256)
_    unity_amplifier(Vin=N42920 Vsrc-=N10256 Vsrc+=N10244 Vo=N43000 ) CN 
+@PRE_ADC_CIRCUIT.main(sch_1):unity_amplifier@PRE_ADC_CIRCUIT.Unity Amplifier(sch_1)
X_unity_amplifier_U1          unity_amplifier.U1(+=N42920 -=N43000 OUT=N43000 V+=N10244 V-=N10256 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):unity_amplifier@PRE_ADC_CIRCUIT.Unity Amplifier(sch_1):INS4382@OPA855.OPA855.Normal(chips)
_    _(unity_amplifier.Vin=N42920)
_    _(unity_amplifier.Vo=N43000)
_    _(unity_amplifier.Vsrc+=N10244)
_    _(unity_amplifier.Vsrc-=N10256)
V_Vsrc+          Vsrc+(+=N10244 -=0 ) CN @PRE_ADC_CIRCUIT.main(sch_1):INS8305@SOURCE.VDC.Normal(chips)
V_Vsrc-          Vsrc-(+=0 -=N10256 ) CN @PRE_ADC_CIRCUIT.main(sch_1):INS8327@SOURCE.VDC.Normal(chips)
V_Vin           Vin(+=N42920 -=0 ) CN @PRE_ADC_CIRCUIT.main(sch_1):INS9097@SOURCE.VSIN.Normal(chips)
_    delyiannis_filter1(Vin=N42996 Vo=N19213 Vsrc+=N10244 Vsrc-=N10256 Voff=0 ) CN 
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter1@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1)
C_delyiannis_filter1_C2          delyiannis_filter1.C2(1=delyiannis_filter1_N03272 2=N19213 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter1@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3254@ANALOG.C.Normal(chips)
X_delyiannis_filter1_U1          delyiannis_filter1.U1(+=0 -=delyiannis_filter1_N03304 OUT=N19213 V+=N10244 V-=N10256 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter1@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS5579@OPA855.OPA855.Normal(chips)
C_delyiannis_filter1_C1          delyiannis_filter1.C1(1=delyiannis_filter1_N03272 2=delyiannis_filter1_N03304 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter1@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3344@ANALOG.C.Normal(chips)
R_delyiannis_filter1_R1          delyiannis_filter1.R1(1=N42996 2=delyiannis_filter1_N03272 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter1@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3328@ANALOG.R.Normal(chips)
R_delyiannis_filter1_R3          delyiannis_filter1.R3(1=0 2=delyiannis_filter1_N03272 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter1@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3448@ANALOG.R.Normal(chips)
R_delyiannis_filter1_R2          delyiannis_filter1.R2(1=delyiannis_filter1_N03304 2=N19213 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter1@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3286@ANALOG.R.Normal(chips)
_    _(delyiannis_filter1.Vin=N42996)
_    _(delyiannis_filter1.Vo=N19213)
_    _(delyiannis_filter1.Voff=0)
_    _(delyiannis_filter1.Vsrc+=N10244)
_    _(delyiannis_filter1.Vsrc-=N10256)
_    delyiannis_filter2(Vin=N19213 Vo=N43560 Vsrc+=N10244 Vsrc-=N10256 Voff=0 ) CN 
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter2@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1)
C_delyiannis_filter2_C2          delyiannis_filter2.C2(1=delyiannis_filter2_N03272 2=N43560 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter2@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3254@ANALOG.C.Normal(chips)
X_delyiannis_filter2_U1          delyiannis_filter2.U1(+=0 -=delyiannis_filter2_N03304 OUT=N43560 V+=N10244 V-=N10256 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter2@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS5579@OPA855.OPA855.Normal(chips)
C_delyiannis_filter2_C1          delyiannis_filter2.C1(1=delyiannis_filter2_N03272 2=delyiannis_filter2_N03304 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter2@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3344@ANALOG.C.Normal(chips)
R_delyiannis_filter2_R1          delyiannis_filter2.R1(1=N19213 2=delyiannis_filter2_N03272 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter2@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3328@ANALOG.R.Normal(chips)
R_delyiannis_filter2_R3          delyiannis_filter2.R3(1=0 2=delyiannis_filter2_N03272 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter2@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3448@ANALOG.R.Normal(chips)
R_delyiannis_filter2_R2          delyiannis_filter2.R2(1=delyiannis_filter2_N03304 2=N43560 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):delyiannis_filter2@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3286@ANALOG.R.Normal(chips)
_    _(delyiannis_filter2.Vin=N19213)
_    _(delyiannis_filter2.Vo=N43560)
_    _(delyiannis_filter2.Voff=0)
_    _(delyiannis_filter2.Vsrc+=N10244)
_    _(delyiannis_filter2.Vsrc-=N10256)
_    level_shifter(Vin=N43560 Vsrc+=N10244 Vsrc-=N10256 Vo=N41004 Voff=N39588 ) CN 
+@PRE_ADC_CIRCUIT.main(sch_1):level_shifter@PRE_ADC_CIRCUIT.Level Shifter(sch_1)
X_level_shifter_U1          level_shifter.U1(+=level_shifter_N01603 -=level_shifter_N00293 OUT=N41004 V+=N10244 V-=N10256 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):level_shifter@PRE_ADC_CIRCUIT.Level Shifter(sch_1):INS172@OPA855.OPA855.Normal(chips)
R_level_shifter_R2_          level_shifter.R2_(1=level_shifter_N01603 2=N39588 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):level_shifter@PRE_ADC_CIRCUIT.Level Shifter(sch_1):INS608@ANALOG.R.Normal(chips)
R_level_shifter_R1          level_shifter.R1(1=0 2=level_shifter_N00293 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):level_shifter@PRE_ADC_CIRCUIT.Level Shifter(sch_1):INS261@ANALOG.R.Normal(chips)
R_level_shifter_R2          level_shifter.R2(1=level_shifter_N00293 2=N41004 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):level_shifter@PRE_ADC_CIRCUIT.Level Shifter(sch_1):INS277@ANALOG.R.Normal(chips)
R_level_shifter_R1_          level_shifter.R1_(1=N43560 2=level_shifter_N01603 ) CN
+@PRE_ADC_CIRCUIT.main(sch_1):level_shifter@PRE_ADC_CIRCUIT.Level Shifter(sch_1):INS582@ANALOG.R.Normal(chips)
_    _(level_shifter.Vin=N43560)
_    _(level_shifter.Vo=N41004)
_    _(level_shifter.Voff=N39588)
_    _(level_shifter.Vsrc+=N10244)
_    _(level_shifter.Vsrc-=N10256)
V_Voff1          Voff1(+=N39588 -=0 ) CN @PRE_ADC_CIRCUIT.main(sch_1):INS39901@SOURCE.VDC.Normal(chips)
.ENDALIASES
