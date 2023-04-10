-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_SSR_Packet_Generator_Imag.vhd
-- Created: 2023-04-09 17:38:33
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_SSR_Packet_Generator_Imag
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Packet Generator Ima
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_SSR_Packet_Generator_Imag IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Frame_Drop                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        Valid_In                          :   IN    std_logic;
        Data_In                           :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        Packet_Size                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Valid_Out                         :   OUT   std_logic;
        Data_Out                          :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        SoF_Out                           :   OUT   std_logic;
        EoF_Out                           :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_SSR_Packet_Generator_Imag;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_SSR_Packet_Generator_Imag IS

  -- Component Declarations
  COMPONENT SpectrumAnalyserCustom_src_TLAST_Generator
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Valid_In                        :   IN    std_logic;
          Data_In                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Packet_Size                     :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Valid_Out                       :   OUT   std_logic;
          Data_Out                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          SoF_Out                         :   OUT   std_logic;
          EoF_Out                         :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_Frame_Dropper
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Valid_In                        :   IN    std_logic;
          Data_In                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          SoF_In                          :   IN    std_logic;
          EoF_In                          :   IN    std_logic;
          Frame_Drop                      :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          Valid_Out                       :   OUT   std_logic;
          Data_Out                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          SoF_Out                         :   OUT   std_logic;
          EoF_Out                         :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyserCustom_src_TLAST_Generator
    USE ENTITY work.SpectrumAnalyserCustom_src_TLAST_Generator(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_Frame_Dropper
    USE ENTITY work.SpectrumAnalyserCustom_src_Frame_Dropper(rtl);

  -- Signals
  SIGNAL TLAST_Generator_out1             : std_logic;
  SIGNAL y                                : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL TLAST_Generator_out3             : std_logic;
  SIGNAL TLAST_Generator_out4             : std_logic;
  SIGNAL Frame_Dropper_out1               : std_logic;
  SIGNAL y_1                              : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL Frame_Dropper_out3               : std_logic;
  SIGNAL Frame_Dropper_out4               : std_logic;

BEGIN
  u_TLAST_Generator : SpectrumAnalyserCustom_src_TLAST_Generator
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Valid_In => Valid_In,
              Data_In => Data_In,  -- ufix128
              Packet_Size => Packet_Size,  -- uint32
              Valid_Out => TLAST_Generator_out1,
              Data_Out => y,  -- ufix128
              SoF_Out => TLAST_Generator_out3,
              EoF_Out => TLAST_Generator_out4
              );

  u_Frame_Dropper : SpectrumAnalyserCustom_src_Frame_Dropper
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Valid_In => TLAST_Generator_out1,
              Data_In => y,  -- ufix128
              SoF_In => TLAST_Generator_out3,
              EoF_In => TLAST_Generator_out4,
              Frame_Drop => Frame_Drop,  -- ufix4
              Valid_Out => Frame_Dropper_out1,
              Data_Out => y_1,  -- ufix128
              SoF_Out => Frame_Dropper_out3,
              EoF_Out => Frame_Dropper_out4
              );

  Valid_Out <= Frame_Dropper_out1;

  SoF_Out <= Frame_Dropper_out3;

  EoF_Out <= Frame_Dropper_out4;

  Data_Out <= y_1;

END rtl;

