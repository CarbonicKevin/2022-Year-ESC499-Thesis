.ALIASES
_    delyiannis_filter(Vin=0 Vo=VFINAL Vsrc+=N10244 Vsrc-=N10256 Voff=N10851 ) CN 
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1)
R_delyiannis_filter_R2          delyiannis_filter.R2(1=delyiannis_filter_N03304 2=VFINAL ) CN
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3286@ANALOG.R.Normal(chips)
C_delyiannis_filter_C1          delyiannis_filter.C1(1=delyiannis_filter_N03272 2=delyiannis_filter_N03304 ) CN
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3344@ANALOG.C.Normal(chips)
R_delyiannis_filter_R3          delyiannis_filter.R3(1=N10851 2=delyiannis_filter_N03272 ) CN
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3448@ANALOG.R.Normal(chips)
C_delyiannis_filter_C2          delyiannis_filter.C2(1=delyiannis_filter_N03272 2=VFINAL ) CN
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3254@ANALOG.C.Normal(chips)
R_delyiannis_filter_R1          delyiannis_filter.R1(1=0 2=delyiannis_filter_N03272 ) CN
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS3328@ANALOG.R.Normal(chips)
X_delyiannis_filter_U1          delyiannis_filter.U1(+=N10851 -=delyiannis_filter_N03304 OUT=VFINAL V+=N10244 V-=N10256 ) CN
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):delyiannis_filter@PRE_ADC_CIRCUIT.Delyiannis Filter(sch_1):INS5579@OPA855.OPA855.Normal(chips)
_    _(delyiannis_filter.Vin=0)
_    _(delyiannis_filter.Vo=VFINAL)
_    _(delyiannis_filter.Voff=N10851)
_    _(delyiannis_filter.Vsrc+=N10244)
_    _(delyiannis_filter.Vsrc-=N10256)
_    unity_amplifier(Vin=N10402 Vsrc-=N10256 Vsrc+=N10244 Vo=N12507 ) CN 
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):unity_amplifier@PRE_ADC_CIRCUIT.Unity Amplifier(sch_1)
X_unity_amplifier_U1          unity_amplifier.U1(+=N10402 -=N12507 OUT=N12507 V+=N10244 V-=N10256 ) CN
+@PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):unity_amplifier@PRE_ADC_CIRCUIT.Unity Amplifier(sch_1):INS4382@OPA855.OPA855.Normal(chips)
_    _(unity_amplifier.Vin=N10402)
_    _(unity_amplifier.Vo=N12507)
_    _(unity_amplifier.Vsrc+=N10244)
_    _(unity_amplifier.Vsrc-=N10256)
V_Vsrc+          Vsrc+(+=N10244 -=0 ) CN @PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):INS8305@SOURCE.VDC.Normal(chips)
V_Vsrc-          Vsrc-(+=0 -=N10256 ) CN @PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):INS8327@SOURCE.VDC.Normal(chips)
V_V1            V1(+=N10402 -=0 ) CN @PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):INS9097@SOURCE.VSIN.Normal(chips)
V_Voff          Voff(+=N10851 -=0 ) CN @PRE_ADC_CIRCUIT.SCHEMATIC1(sch_1):INS10503@SOURCE.VDC.Normal(chips)
_    _(Vfinal=VFINAL)
.ENDALIASES
