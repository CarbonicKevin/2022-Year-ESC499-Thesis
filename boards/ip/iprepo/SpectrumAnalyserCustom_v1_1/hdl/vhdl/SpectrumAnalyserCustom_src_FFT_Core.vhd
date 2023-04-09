-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_FFT_Core.vhd
-- Created: 2023-04-04 17:52:56
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_FFT_Core
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Cor
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_FFT_Core IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Data_In_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Data_In_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Valid_In                          :   IN    std_logic;
        Selector                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        Data_Out_re                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En15
        Data_Out_im                       :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En15
        Start                             :   OUT   std_logic;
        End_rsvd                          :   OUT   std_logic;
        Valid_Out                         :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_FFT_Core;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_FFT_Core IS

  -- Component Declarations
  COMPONENT SpectrumAnalyserCustom_src_FFT_HDL_Optimized_8192
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(28 DOWNTO 0);  -- sfix29_En15
          dataOut_im                      :   OUT   std_logic_vector(28 DOWNTO 0);  -- sfix29_En15
          startOut                        :   OUT   std_logic;
          endOut                          :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_FFT_HDL_Optimized_16384
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          dataOut_im                      :   OUT   std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          startOut                        :   OUT   std_logic;
          endOut                          :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_FFT_HDL_Optimized_32768
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          dataOut_im                      :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          startOut                        :   OUT   std_logic;
          endOut                          :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_FFT_HDL_Optimized_65536
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          validIn                         :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En15
          dataOut_im                      :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En15
          startOut                        :   OUT   std_logic;
          endOut                          :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyserCustom_src_FFT_HDL_Optimized_8192
    USE ENTITY work.SpectrumAnalyserCustom_src_FFT_HDL_Optimized_8192(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_FFT_HDL_Optimized_16384
    USE ENTITY work.SpectrumAnalyserCustom_src_FFT_HDL_Optimized_16384(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_FFT_HDL_Optimized_32768
    USE ENTITY work.SpectrumAnalyserCustom_src_FFT_HDL_Optimized_32768(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_FFT_HDL_Optimized_65536
    USE ENTITY work.SpectrumAnalyserCustom_src_FFT_HDL_Optimized_65536(rtl);

  -- Signals
  SIGNAL Selector_unsigned                : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Compare_To_Constant7_out1        : std_logic;
  SIGNAL AND7_out1                        : std_logic;
  SIGNAL FFT_HDL_Optimized_8192_out1_re   : std_logic_vector(28 DOWNTO 0);  -- ufix29
  SIGNAL FFT_HDL_Optimized_8192_out1_im   : std_logic_vector(28 DOWNTO 0);  -- ufix29
  SIGNAL FFT_HDL_Optimized_8192_out2      : std_logic;
  SIGNAL FFT_HDL_Optimized_8192_out3      : std_logic;
  SIGNAL FFT_HDL_Optimized_8192_out4      : std_logic;
  SIGNAL FFT_HDL_Optimized_8192_out1_re_signed : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL FFT_HDL_Optimized_8192_out1_im_signed : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL FFT_HDL_Optimized_8192_out1_dtc_re : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL FFT_HDL_Optimized_8192_out1_dtc_im : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Compare_To_Constant8_out1        : std_logic;
  SIGNAL AND8_out1                        : std_logic;
  SIGNAL FFT_HDL_Optimized_16384_out1_re  : std_logic_vector(29 DOWNTO 0);  -- ufix30
  SIGNAL FFT_HDL_Optimized_16384_out1_im  : std_logic_vector(29 DOWNTO 0);  -- ufix30
  SIGNAL FFT_HDL_Optimized_16384_out2     : std_logic;
  SIGNAL FFT_HDL_Optimized_16384_out3     : std_logic;
  SIGNAL FFT_HDL_Optimized_16384_out4     : std_logic;
  SIGNAL FFT_HDL_Optimized_16384_out1_re_signed : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL FFT_HDL_Optimized_16384_out1_im_signed : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL FFT_HDL_Optimized_16384_out1_dtc_re : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL FFT_HDL_Optimized_16384_out1_dtc_im : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Compare_To_Constant9_out1        : std_logic;
  SIGNAL AND9_out1                        : std_logic;
  SIGNAL FFT_HDL_Optimized_32768_out1_re  : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL FFT_HDL_Optimized_32768_out1_im  : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL FFT_HDL_Optimized_32768_out2     : std_logic;
  SIGNAL FFT_HDL_Optimized_32768_out3     : std_logic;
  SIGNAL FFT_HDL_Optimized_32768_out4     : std_logic;
  SIGNAL FFT_HDL_Optimized_32768_out1_re_signed : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL FFT_HDL_Optimized_32768_out1_im_signed : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL FFT_HDL_Optimized_32768_out1_dtc_re : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL FFT_HDL_Optimized_32768_out1_dtc_im : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Compare_To_Constant10_out1       : std_logic;
  SIGNAL AND10_out1                       : std_logic;
  SIGNAL FFT_HDL_Optimized_65536_out1_re  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL FFT_HDL_Optimized_65536_out1_im  : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL FFT_HDL_Optimized_65536_out2     : std_logic;
  SIGNAL FFT_HDL_Optimized_65536_out3     : std_logic;
  SIGNAL FFT_HDL_Optimized_65536_out4     : std_logic;
  SIGNAL FFT_HDL_Optimized_65536_out1_re_signed : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL FFT_HDL_Optimized_65536_out1_im_signed : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Multiport_Switch_out1_re         : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Multiport_Switch_out1_im         : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Multiport_Switch1_out1           : std_logic;
  SIGNAL Multiport_Switch2_out1           : std_logic;
  SIGNAL Multiport_Switch3_out1           : std_logic;

BEGIN
  u_FFT_HDL_Optimized_8192 : SpectrumAnalyserCustom_src_FFT_HDL_Optimized_8192
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              dataIn_re => Data_In_re,  -- sfix16_En15
              dataIn_im => Data_In_im,  -- sfix16_En15
              validIn => AND7_out1,
              dataOut_re => FFT_HDL_Optimized_8192_out1_re,  -- sfix29_En15
              dataOut_im => FFT_HDL_Optimized_8192_out1_im,  -- sfix29_En15
              startOut => FFT_HDL_Optimized_8192_out2,
              endOut => FFT_HDL_Optimized_8192_out3,
              validOut => FFT_HDL_Optimized_8192_out4
              );

  u_FFT_HDL_Optimized_16384 : SpectrumAnalyserCustom_src_FFT_HDL_Optimized_16384
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              dataIn_re => Data_In_re,  -- sfix16_En15
              dataIn_im => Data_In_im,  -- sfix16_En15
              validIn => AND8_out1,
              dataOut_re => FFT_HDL_Optimized_16384_out1_re,  -- sfix30_En15
              dataOut_im => FFT_HDL_Optimized_16384_out1_im,  -- sfix30_En15
              startOut => FFT_HDL_Optimized_16384_out2,
              endOut => FFT_HDL_Optimized_16384_out3,
              validOut => FFT_HDL_Optimized_16384_out4
              );

  u_FFT_HDL_Optimized_32768 : SpectrumAnalyserCustom_src_FFT_HDL_Optimized_32768
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              dataIn_re => Data_In_re,  -- sfix16_En15
              dataIn_im => Data_In_im,  -- sfix16_En15
              validIn => AND9_out1,
              dataOut_re => FFT_HDL_Optimized_32768_out1_re,  -- sfix31_En15
              dataOut_im => FFT_HDL_Optimized_32768_out1_im,  -- sfix31_En15
              startOut => FFT_HDL_Optimized_32768_out2,
              endOut => FFT_HDL_Optimized_32768_out3,
              validOut => FFT_HDL_Optimized_32768_out4
              );

  u_FFT_HDL_Optimized_65536 : SpectrumAnalyserCustom_src_FFT_HDL_Optimized_65536
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              dataIn_re => Data_In_re,  -- sfix16_En15
              dataIn_im => Data_In_im,  -- sfix16_En15
              validIn => AND10_out1,
              dataOut_re => FFT_HDL_Optimized_65536_out1_re,  -- sfix32_En15
              dataOut_im => FFT_HDL_Optimized_65536_out1_im,  -- sfix32_En15
              startOut => FFT_HDL_Optimized_65536_out2,
              endOut => FFT_HDL_Optimized_65536_out3,
              validOut => FFT_HDL_Optimized_65536_out4
              );

  Selector_unsigned <= unsigned(Selector);

  
  Compare_To_Constant7_out1 <= '1' WHEN Selector_unsigned = to_unsigned(16#00#, 8) ELSE
      '0';

  AND7_out1 <= Valid_In AND Compare_To_Constant7_out1;

  FFT_HDL_Optimized_8192_out1_re_signed <= signed(FFT_HDL_Optimized_8192_out1_re);

  FFT_HDL_Optimized_8192_out1_im_signed <= signed(FFT_HDL_Optimized_8192_out1_im);

  FFT_HDL_Optimized_8192_out1_dtc_re <= resize(FFT_HDL_Optimized_8192_out1_re_signed, 32);
  FFT_HDL_Optimized_8192_out1_dtc_im <= resize(FFT_HDL_Optimized_8192_out1_im_signed, 32);

  
  Compare_To_Constant8_out1 <= '1' WHEN Selector_unsigned = to_unsigned(16#01#, 8) ELSE
      '0';

  AND8_out1 <= Valid_In AND Compare_To_Constant8_out1;

  FFT_HDL_Optimized_16384_out1_re_signed <= signed(FFT_HDL_Optimized_16384_out1_re);

  FFT_HDL_Optimized_16384_out1_im_signed <= signed(FFT_HDL_Optimized_16384_out1_im);

  FFT_HDL_Optimized_16384_out1_dtc_re <= resize(FFT_HDL_Optimized_16384_out1_re_signed, 32);
  FFT_HDL_Optimized_16384_out1_dtc_im <= resize(FFT_HDL_Optimized_16384_out1_im_signed, 32);

  
  Compare_To_Constant9_out1 <= '1' WHEN Selector_unsigned = to_unsigned(16#02#, 8) ELSE
      '0';

  AND9_out1 <= Valid_In AND Compare_To_Constant9_out1;

  FFT_HDL_Optimized_32768_out1_re_signed <= signed(FFT_HDL_Optimized_32768_out1_re);

  FFT_HDL_Optimized_32768_out1_im_signed <= signed(FFT_HDL_Optimized_32768_out1_im);

  FFT_HDL_Optimized_32768_out1_dtc_re <= resize(FFT_HDL_Optimized_32768_out1_re_signed, 32);
  FFT_HDL_Optimized_32768_out1_dtc_im <= resize(FFT_HDL_Optimized_32768_out1_im_signed, 32);

  
  Compare_To_Constant10_out1 <= '1' WHEN Selector_unsigned = to_unsigned(16#03#, 8) ELSE
      '0';

  AND10_out1 <= Valid_In AND Compare_To_Constant10_out1;

  FFT_HDL_Optimized_65536_out1_re_signed <= signed(FFT_HDL_Optimized_65536_out1_re);

  FFT_HDL_Optimized_65536_out1_im_signed <= signed(FFT_HDL_Optimized_65536_out1_im);

  
  Multiport_Switch_out1_re <= FFT_HDL_Optimized_8192_out1_dtc_re WHEN Selector_unsigned = to_unsigned(16#00#, 8) ELSE
      FFT_HDL_Optimized_16384_out1_dtc_re WHEN Selector_unsigned = to_unsigned(16#01#, 8) ELSE
      FFT_HDL_Optimized_32768_out1_dtc_re WHEN Selector_unsigned = to_unsigned(16#02#, 8) ELSE
      FFT_HDL_Optimized_65536_out1_re_signed;
  
  Multiport_Switch_out1_im <= FFT_HDL_Optimized_8192_out1_dtc_im WHEN Selector_unsigned = to_unsigned(16#00#, 8) ELSE
      FFT_HDL_Optimized_16384_out1_dtc_im WHEN Selector_unsigned = to_unsigned(16#01#, 8) ELSE
      FFT_HDL_Optimized_32768_out1_dtc_im WHEN Selector_unsigned = to_unsigned(16#02#, 8) ELSE
      FFT_HDL_Optimized_65536_out1_im_signed;

  Data_Out_re <= std_logic_vector(Multiport_Switch_out1_re);

  Data_Out_im <= std_logic_vector(Multiport_Switch_out1_im);

  
  Multiport_Switch1_out1 <= FFT_HDL_Optimized_8192_out2 WHEN Selector_unsigned = to_unsigned(16#00#, 8) ELSE
      FFT_HDL_Optimized_16384_out2 WHEN Selector_unsigned = to_unsigned(16#01#, 8) ELSE
      FFT_HDL_Optimized_32768_out2 WHEN Selector_unsigned = to_unsigned(16#02#, 8) ELSE
      FFT_HDL_Optimized_65536_out2;

  Start <= Multiport_Switch1_out1;

  
  Multiport_Switch2_out1 <= FFT_HDL_Optimized_8192_out3 WHEN Selector_unsigned = to_unsigned(16#00#, 8) ELSE
      FFT_HDL_Optimized_16384_out3 WHEN Selector_unsigned = to_unsigned(16#01#, 8) ELSE
      FFT_HDL_Optimized_32768_out3 WHEN Selector_unsigned = to_unsigned(16#02#, 8) ELSE
      FFT_HDL_Optimized_65536_out3;

  End_rsvd <= Multiport_Switch2_out1;

  
  Multiport_Switch3_out1 <= FFT_HDL_Optimized_8192_out4 WHEN Selector_unsigned = to_unsigned(16#00#, 8) ELSE
      FFT_HDL_Optimized_16384_out4 WHEN Selector_unsigned = to_unsigned(16#01#, 8) ELSE
      FFT_HDL_Optimized_32768_out4 WHEN Selector_unsigned = to_unsigned(16#02#, 8) ELSE
      FFT_HDL_Optimized_65536_out4;

  Valid_Out <= Multiport_Switch3_out1;

END rtl;

