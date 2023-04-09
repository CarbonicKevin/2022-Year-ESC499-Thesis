-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_TLAST_Generator.vhd
-- Created: 2023-04-04 17:52:58
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_TLAST_Generator
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Packet Generator Imag/TLAST Generato
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_TLAST_Generator IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Valid_In                          :   IN    std_logic;
        Data_In                           :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        Packet_Size                       :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Valid_Out                         :   OUT   std_logic;
        Data_Out                          :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        SoF_Out                           :   OUT   std_logic;
        EoF_Out                           :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_TLAST_Generator;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_TLAST_Generator IS

  -- Signals
  SIGNAL Packet_Size_unsigned             : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Relational_Operator_relop1       : std_logic;
  SIGNAL Compare_To_Zero_out1             : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL AND3_out1                        : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous_ectrl : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL AND2_out1                        : std_logic;
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL AND_out1                         : std_logic;

BEGIN
  Packet_Size_unsigned <= unsigned(Packet_Size);

  AND1_out1 <= Compare_To_Zero_out1 AND (Relational_Operator_relop1 AND Valid_In);

  -- Free running, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(1, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        IF AND1_out1 = '1' THEN 
          HDL_Counter_out1 <= to_unsigned(1, 32);
        ELSIF Valid_In = '1' THEN 
          HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(1, 32);
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  Relational_Operator_relop1 <= '1' WHEN Unit_Delay_Enabled_Synchronous_out1 <= HDL_Counter_out1 ELSE
      '0';

  AND3_out1 <= Valid_In AND Relational_Operator_relop1;

  
  Unit_Delay_Enabled_Synchronous_ectrl <= Unit_Delay_Enabled_Synchronous_out1 WHEN AND3_out1 = '0' ELSE
      Packet_Size_unsigned;

  Unit_Delay_Enabled_Synchronous_lowered_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Unit_Delay_Enabled_Synchronous_out1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= Unit_Delay_Enabled_Synchronous_ectrl;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_lowered_process;


  
  Compare_To_Zero_out1 <= '1' WHEN Unit_Delay_Enabled_Synchronous_out1 /= to_unsigned(0, 32) ELSE
      '0';

  AND2_out1 <= Compare_To_Zero_out1 AND Valid_In;

  Valid_Out <= AND2_out1;

  
  Compare_To_Constant_out1 <= '1' WHEN HDL_Counter_out1 = to_unsigned(1, 32) ELSE
      '0';

  AND_out1 <= Compare_To_Zero_out1 AND (Compare_To_Constant_out1 AND Valid_In);

  SoF_Out <= AND_out1;

  EoF_Out <= AND1_out1;

  Data_Out <= Data_In;

END rtl;

