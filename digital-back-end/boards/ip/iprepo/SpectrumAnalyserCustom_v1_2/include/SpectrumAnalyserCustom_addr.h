/*
 * File Name:         hdl_prj\ipcore\SpectrumAnalyserCustom_v1_2\include\SpectrumAnalyserCustom_addr.h
 * Description:       C Header File
 * Created:           2023-04-09 17:38:48
*/

#ifndef SPECTRUMANALYSERCUSTOM_H_
#define SPECTRUMANALYSERCUSTOM_H_

#define  IPCore_Reset_SpectrumAnalyserCustom              0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_SpectrumAnalyserCustom             0x4  //enabled (by default) when bit 0 is 0x1
#define  AXI4_Master_Rd_BaseAddr_SpectrumAnalyserCustom   0x8  //Base Address offset for AXI4 Master Read
#define  AXI4_Master_Wr_BaseAddr_SpectrumAnalyserCustom   0xC  //Base Address offset for AXI4 Master Write
#define  IPCore_Timestamp_SpectrumAnalyserCustom          0x10  //contains unique IP timestamp (yymmddHHMM): 2304091738
#define  Packet_Size_Data_SpectrumAnalyserCustom          0x104  //data register for Inport Packet Size
#define  SSR_Mode_Data_SpectrumAnalyserCustom             0x108  //data register for Inport SSR Mode
#define  Units_Data_SpectrumAnalyserCustom                0x10C  //data register for Inport Units
#define  Type_Data_SpectrumAnalyserCustom                 0x110  //data register for Inport Type
#define  Vrms_Data_SpectrumAnalyserCustom                 0x114  //data register for Inport Vrms
#define  Type_Scale_Data_SpectrumAnalyserCustom           0x118  //data register for Inport Type Scale
#define  Power_Scale_Data_SpectrumAnalyserCustom          0x11C  //data register for Inport Power Scale
#define  Selector_Data_SpectrumAnalyserCustom             0x120  //data register for Inport Selector
#define  WLength_Data_SpectrumAnalyserCustom              0x124  //data register for Inport WLength
#define  WAddress_Data_SpectrumAnalyserCustom             0x128  //data register for Inport WAddress
#define  WEnable_Data_SpectrumAnalyserCustom              0x12C  //data register for Inport WEnable
#define  Length_Data_SpectrumAnalyserCustom               0x130  //data register for Inport Length
#define  Buffer_Address_1_Data_SpectrumAnalyserCustom     0x134  //data register for Inport Buffer Address 1
#define  Buffer_Address_2_Data_SpectrumAnalyserCustom     0x138  //data register for Inport Buffer Address 2
#define  Buffer_Address_3_Data_SpectrumAnalyserCustom     0x13C  //data register for Inport Buffer Address 3
#define  Enable_Data_SpectrumAnalyserCustom               0x140  //data register for Inport Enable
#define  Count_Data_SpectrumAnalyserCustom                0x144  //data register for Inport Count
#define  WReady_Data_SpectrumAnalyserCustom               0x148  //data register for Outport WReady
#define  Buffer_Pointer_Data_SpectrumAnalyserCustom       0x14C  //data register for Outport Buffer Pointer
#define  DMA_Status_Data_SpectrumAnalyserCustom           0x150  //data register for Outport DMA Status

#endif /* SPECTRUMANALYSERCUSTOM_H_ */
