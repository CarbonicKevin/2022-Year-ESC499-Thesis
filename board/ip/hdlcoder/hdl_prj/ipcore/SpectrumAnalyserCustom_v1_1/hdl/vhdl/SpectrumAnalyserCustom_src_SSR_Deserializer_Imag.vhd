-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_SSR_Deserializer_Imag.vhd
-- Created: 2023-03-18 22:56:28
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_SSR_Deserializer_Imag
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/SSR Subset Converter/SSR 
-- Deserializer Ima
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.SpectrumAnalyserCustom_src_Spectrum_Analyser_pkg.ALL;

ENTITY SpectrumAnalyserCustom_src_SSR_Deserializer_Imag IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Valid_In                          :   IN    std_logic;
        Data_In                           :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
        SoF_In                            :   IN    std_logic;
        EoF_In                            :   IN    std_logic;
        Valid_Out                         :   OUT   std_logic;
        Data_Out                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        SoF_Out                           :   OUT   std_logic;
        EoL_Out                           :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_SSR_Deserializer_Imag;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_SSR_Deserializer_Imag IS

  -- Component Declarations
  COMPONENT SpectrumAnalyserCustom_src_Subsystem
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Set                             :   IN    std_logic;
          Reset_1                         :   IN    std_logic;
          Latch                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_HDL_FIFO_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          Empty                           :   OUT   std_logic;
          Full                            :   OUT   std_logic;
          Num                             :   OUT   std_logic_vector(10 DOWNTO 0)  -- ufix11
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_Subsystem1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Set                             :   IN    std_logic;
          Reset_1                         :   IN    std_logic;
          Latch                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_SSR_to_Vector
    PORT( SSR                             :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          Vector                          :   OUT   vector_of_std_logic_vector16(0 TO 7)  -- uint16 [8]
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_HDL_FIFO1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic_vector(1 DOWNTO 0)  -- ufix2
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyserCustom_src_Subsystem
    USE ENTITY work.SpectrumAnalyserCustom_src_Subsystem(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_HDL_FIFO_block
    USE ENTITY work.SpectrumAnalyserCustom_src_HDL_FIFO_block(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_Subsystem1
    USE ENTITY work.SpectrumAnalyserCustom_src_Subsystem1(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_SSR_to_Vector
    USE ENTITY work.SpectrumAnalyserCustom_src_SSR_to_Vector(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_HDL_FIFO1
    USE ENTITY work.SpectrumAnalyserCustom_src_HDL_FIFO1(rtl);

  -- Signals
  SIGNAL HDL_Counter_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL AND2_out1                        : std_logic;
  SIGNAL Subsystem_out1                   : std_logic;
  SIGNAL AND3_out1                        : std_logic;
  SIGNAL HDL_FIFO_out3                    : std_logic;
  SIGNAL NOT_out1                         : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL HDL_FIFO_out1                    : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL HDL_FIFO_out2                    : std_logic;
  SIGNAL HDL_FIFO_out4                    : std_logic_vector(10 DOWNTO 0);  -- ufix11
  SIGNAL NOT1_out1                        : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL Subsystem1_out1                  : std_logic;
  SIGNAL SSR_to_Vector_out1               : vector_of_std_logic_vector16(0 TO 7);  -- ufix16 [8]
  SIGNAL SSR_to_Vector_out1_unsigned      : vector_of_unsigned16(0 TO 7);  -- uint16 [8]
  SIGNAL Selector_out1                    : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Bit_Concat_out1                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL HDL_FIFO1_out1                   : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL HDL_FIFO1_out1_unsigned          : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Bit_Slice1_out1                  : std_logic;  -- ufix1
  SIGNAL Compare_To_Constant3_out1        : std_logic;
  SIGNAL AND5_out1                        : std_logic;
  SIGNAL AND6_out1                        : std_logic;
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL Compare_To_Constant2_out1        : std_logic;
  SIGNAL AND4_out1                        : std_logic;
  SIGNAL AND7_out1                        : std_logic;

BEGIN
  u_Subsystem : SpectrumAnalyserCustom_src_Subsystem
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Set => AND2_out1,
              Reset_1 => EoF_In,
              Latch => Subsystem_out1
              );

  u_HDL_FIFO : SpectrumAnalyserCustom_src_HDL_FIFO_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              In_rsvd => Data_In,  -- ufix128
              Push => AND_out1,
              Pop => AND1_out1,
              Out_rsvd => HDL_FIFO_out1,  -- ufix128
              Empty => HDL_FIFO_out2,
              Full => HDL_FIFO_out3,
              Num => HDL_FIFO_out4  -- ufix11
              );

  u_Subsystem1 : SpectrumAnalyserCustom_src_Subsystem1
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Set => Delay_out1,
              Reset_1 => Compare_To_Constant_out1,
              Latch => Subsystem1_out1
              );

  u_SSR_to_Vector : SpectrumAnalyserCustom_src_SSR_to_Vector
    PORT MAP( SSR => HDL_FIFO_out1,  -- ufix128
              Vector => SSR_to_Vector_out1  -- uint16 [8]
              );

  u_HDL_FIFO1 : SpectrumAnalyserCustom_src_HDL_FIFO1
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              In_rsvd => std_logic_vector(Bit_Concat_out1),  -- ufix2
              Push => AND_out1,
              Pop => AND1_out1,
              Out_rsvd => HDL_FIFO1_out1  -- ufix2
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 7
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#00#, 8);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        IF HDL_Counter_out1 >= to_unsigned(16#07#, 8) THEN 
          HDL_Counter_out1 <= to_unsigned(16#00#, 8);
        ELSE 
          HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#01#, 8);
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  Compare_To_Constant_out1 <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#07#, 8) ELSE
      '0';

  AND2_out1 <= Valid_In AND SoF_In;

  AND3_out1 <= Valid_In AND Subsystem_out1;

  NOT_out1 <=  NOT HDL_FIFO_out3;

  AND_out1 <= AND3_out1 AND NOT_out1;

  NOT1_out1 <=  NOT HDL_FIFO_out2;

  AND1_out1 <= Compare_To_Constant_out1 AND NOT1_out1;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay_out1 <= AND1_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Valid_Out <= Subsystem1_out1;

  outputgen: FOR k IN 0 TO 7 GENERATE
    SSR_to_Vector_out1_unsigned(k) <= unsigned(SSR_to_Vector_out1(k));
  END GENERATE;

  
  Selector_out1 <= SSR_to_Vector_out1_unsigned(0) WHEN HDL_Counter_out1 = to_unsigned(16#00#, 8) ELSE
      SSR_to_Vector_out1_unsigned(1) WHEN HDL_Counter_out1 = to_unsigned(16#01#, 8) ELSE
      SSR_to_Vector_out1_unsigned(2) WHEN HDL_Counter_out1 = to_unsigned(16#02#, 8) ELSE
      SSR_to_Vector_out1_unsigned(3) WHEN HDL_Counter_out1 = to_unsigned(16#03#, 8) ELSE
      SSR_to_Vector_out1_unsigned(4) WHEN HDL_Counter_out1 = to_unsigned(16#04#, 8) ELSE
      SSR_to_Vector_out1_unsigned(5) WHEN HDL_Counter_out1 = to_unsigned(16#05#, 8) ELSE
      SSR_to_Vector_out1_unsigned(6) WHEN HDL_Counter_out1 = to_unsigned(16#06#, 8) ELSE
      SSR_to_Vector_out1_unsigned(7);

  Data_Out <= std_logic_vector(Selector_out1);

  Bit_Concat_out1 <= unsigned'(AND2_out1 & EoF_In);

  HDL_FIFO1_out1_unsigned <= unsigned(HDL_FIFO1_out1);

  Bit_Slice1_out1 <= HDL_FIFO1_out1_unsigned(1);

  
  Compare_To_Constant3_out1 <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#00#, 8) ELSE
      '0';

  AND5_out1 <= Bit_Slice1_out1 AND Compare_To_Constant3_out1;

  AND6_out1 <= AND5_out1 AND Subsystem1_out1;

  SoF_Out <= AND6_out1;

  Bit_Slice_out1 <= HDL_FIFO1_out1_unsigned(0);

  
  Compare_To_Constant2_out1 <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#07#, 8) ELSE
      '0';

  AND4_out1 <= Bit_Slice_out1 AND Compare_To_Constant2_out1;

  AND7_out1 <= AND4_out1 AND Subsystem1_out1;

  EoL_Out <= AND7_out1;

END rtl;

