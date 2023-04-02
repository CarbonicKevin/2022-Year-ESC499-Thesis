-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser8192_src_RADIX22FFT_CTRL1_1_block.vhd
-- Created: 2023-04-02 00:06:46
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser8192_src_RADIX22FFT_CTRL1_1_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 8192/RADIX22FFT_CTRL1_
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser8192_src_RADIX22FFT_CTRL1_1_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        dinXTwdl_13_vld                   :   IN    std_logic;
        dinXTwdl_13_vld_1                 :   IN    std_logic;
        softReset                         :   IN    std_logic;
        rd_13_Addr                        :   OUT   std_logic;
        rd_13_Enb                         :   OUT   std_logic;
        proc_13_enb                       :   OUT   std_logic;
        multiply_13_J                     :   OUT   std_logic
        );
END SpectrumAnalyser8192_src_RADIX22FFT_CTRL1_1_block;


ARCHITECTURE rtl OF SpectrumAnalyser8192_src_RADIX22FFT_CTRL1_1_block IS

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL SDFController_wrState            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdState            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdAddr_reg         : std_logic;  -- ufix1
  SIGNAL SDFController_multjState         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_wrState_next       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdState_next       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdAddr_reg_next    : std_logic;  -- ufix1
  SIGNAL SDFController_multjState_next    : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  -- SDFController
  SDFController_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      SDFController_rdAddr_reg <= '0';
      SDFController_wrState <= to_unsigned(16#0#, 2);
      SDFController_rdState <= to_unsigned(16#0#, 2);
      SDFController_multjState <= to_unsigned(16#0#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        SDFController_wrState <= SDFController_wrState_next;
        SDFController_rdState <= SDFController_rdState_next;
        SDFController_rdAddr_reg <= SDFController_rdAddr_reg_next;
        SDFController_multjState <= SDFController_multjState_next;
      END IF;
    END IF;
  END PROCESS SDFController_process;

  SDFController_output : PROCESS (SDFController_multjState, SDFController_rdAddr_reg, SDFController_rdState,
       SDFController_wrState, dinXTwdl_13_vld, dinXTwdl_13_vld_1)
  BEGIN
    SDFController_wrState_next <= SDFController_wrState;
    SDFController_rdState_next <= SDFController_rdState;
    SDFController_rdAddr_reg_next <= SDFController_rdAddr_reg;
    SDFController_multjState_next <= SDFController_multjState;
    CASE SDFController_multjState IS
      WHEN "00" =>
        SDFController_multjState_next <= to_unsigned(16#0#, 2);
        multiply_13_J <= '0';
        IF SDFController_rdState = to_unsigned(16#1#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#1#, 2);
        END IF;
      WHEN "01" =>
        multiply_13_J <= '0';
        IF SDFController_rdState = to_unsigned(16#0#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#2#, 2);
        END IF;
      WHEN "10" =>
        multiply_13_J <= '0';
        SDFController_multjState_next <= to_unsigned(16#3#, 2);
      WHEN "11" =>
        multiply_13_J <= '1';
        SDFController_multjState_next <= to_unsigned(16#0#, 2);
      WHEN OTHERS => 
        SDFController_multjState_next <= to_unsigned(16#0#, 2);
        multiply_13_J <= '0';
    END CASE;
    CASE SDFController_rdState IS
      WHEN "00" =>
        SDFController_rdState_next <= to_unsigned(16#0#, 2);
        SDFController_rdAddr_reg_next <= '0';
        rd_13_Enb <= '0';
        IF (hdlcoder_to_stdlogic(SDFController_wrState = to_unsigned(16#3#, 2)) AND dinXTwdl_13_vld) = '1' THEN 
          SDFController_rdState_next <= to_unsigned(16#1#, 2);
          rd_13_Enb <= dinXTwdl_13_vld_1;
        END IF;
      WHEN "01" =>
        rd_13_Enb <= dinXTwdl_13_vld_1;
        IF dinXTwdl_13_vld_1 = '1' THEN 
          SDFController_rdState_next <= to_unsigned(16#0#, 2);
        END IF;
      WHEN OTHERS => 
        SDFController_rdState_next <= to_unsigned(16#0#, 2);
        SDFController_rdAddr_reg_next <= '0';
        rd_13_Enb <= '0';
    END CASE;
    CASE SDFController_wrState IS
      WHEN "00" =>
        SDFController_wrState_next <= to_unsigned(16#0#, 2);
        proc_13_enb <= '0';
        IF dinXTwdl_13_vld = '1' THEN 
          SDFController_wrState_next <= to_unsigned(16#3#, 2);
        END IF;
      WHEN "11" =>
        SDFController_wrState_next <= to_unsigned(16#3#, 2);
        proc_13_enb <= '0';
        IF dinXTwdl_13_vld = '1' THEN 
          SDFController_wrState_next <= to_unsigned(16#2#, 2);
          proc_13_enb <= '1';
        END IF;
      WHEN "10" =>
        proc_13_enb <= '0';
        SDFController_wrState_next <= to_unsigned(16#2#, 2);
        IF dinXTwdl_13_vld = '1' THEN 
          SDFController_wrState_next <= to_unsigned(16#3#, 2);
        END IF;
      WHEN OTHERS => 
        SDFController_wrState_next <= to_unsigned(16#0#, 2);
        proc_13_enb <= '0';
    END CASE;
    rd_13_Addr <= SDFController_rdAddr_reg;
  END PROCESS SDFController_output;


END rtl;

