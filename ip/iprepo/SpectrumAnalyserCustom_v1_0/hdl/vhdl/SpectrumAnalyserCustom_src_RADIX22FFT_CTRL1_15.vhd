-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_15.vhd
-- Created: 2023-03-18 17:41:48
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_15
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 65536/RADIX22FFT_CTRL1_1
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_15 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        dinXTwdl_15_1_vld                 :   IN    std_logic;
        dinXTwdl_15_1_vld_1               :   IN    std_logic;
        softReset                         :   IN    std_logic;
        rd_15_Addr                        :   OUT   std_logic;  -- ufix1
        rd_15_Enb                         :   OUT   std_logic;
        proc_15_enb                       :   OUT   std_logic;
        multiply_15_J                     :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_15;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_15 IS

  -- Signals
  SIGNAL SDFController_wrCount            : std_logic;  -- ufix1
  SIGNAL SDFController_wrState            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdState            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdAddr_reg         : std_logic;  -- ufix1
  SIGNAL SDFController_procEnb_reg        : std_logic;
  SIGNAL SDFController_multjState         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_multiply_J_reg     : std_logic;
  SIGNAL SDFController_wrCount_next       : std_logic;  -- ufix1
  SIGNAL SDFController_wrState_next       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdState_next       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdAddr_reg_next    : std_logic;  -- ufix1
  SIGNAL SDFController_procEnb_reg_next   : std_logic;
  SIGNAL SDFController_multjState_next    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_multiply_J_reg_next : std_logic;

BEGIN
  -- SDFController
  SDFController_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      SDFController_wrCount <= '0';
      SDFController_rdAddr_reg <= '0';
      SDFController_wrState <= to_unsigned(16#0#, 2);
      SDFController_rdState <= to_unsigned(16#0#, 2);
      SDFController_multjState <= to_unsigned(16#0#, 2);
      SDFController_procEnb_reg <= '0';
      SDFController_multiply_J_reg <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        SDFController_wrCount <= SDFController_wrCount_next;
        SDFController_wrState <= SDFController_wrState_next;
        SDFController_rdState <= SDFController_rdState_next;
        SDFController_rdAddr_reg <= SDFController_rdAddr_reg_next;
        SDFController_procEnb_reg <= SDFController_procEnb_reg_next;
        SDFController_multjState <= SDFController_multjState_next;
        SDFController_multiply_J_reg <= SDFController_multiply_J_reg_next;
      END IF;
    END IF;
  END PROCESS SDFController_process;

  SDFController_output : PROCESS (SDFController_multiply_J_reg, SDFController_multjState,
       SDFController_procEnb_reg, SDFController_rdAddr_reg,
       SDFController_rdState, SDFController_wrCount, SDFController_wrState,
       dinXTwdl_15_1_vld, dinXTwdl_15_1_vld_1)
  BEGIN
    SDFController_wrCount_next <= SDFController_wrCount;
    SDFController_wrState_next <= SDFController_wrState;
    SDFController_rdState_next <= SDFController_rdState;
    SDFController_rdAddr_reg_next <= SDFController_rdAddr_reg;
    SDFController_procEnb_reg_next <= SDFController_procEnb_reg;
    SDFController_multjState_next <= SDFController_multjState;
    SDFController_multiply_J_reg_next <= SDFController_multiply_J_reg;
    CASE SDFController_multjState IS
      WHEN "00" =>
        SDFController_multjState_next <= to_unsigned(16#0#, 2);
        SDFController_multiply_J_reg_next <= '0';
        IF SDFController_rdState = to_unsigned(16#1#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#1#, 2);
        END IF;
      WHEN "01" =>
        SDFController_multiply_J_reg_next <= '0';
        IF SDFController_rdState = to_unsigned(16#2#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#2#, 2);
        END IF;
      WHEN "10" =>
        SDFController_multiply_J_reg_next <= '0';
        IF SDFController_rdState = to_unsigned(16#1#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#3#, 2);
          SDFController_multiply_J_reg_next <= '1';
        END IF;
      WHEN "11" =>
        IF SDFController_rdState = to_unsigned(16#1#, 2) THEN 
          SDFController_multjState_next <= to_unsigned(16#3#, 2);
          SDFController_multiply_J_reg_next <= '1';
        ELSE 
          SDFController_multiply_J_reg_next <= '0';
          SDFController_multjState_next <= to_unsigned(16#0#, 2);
        END IF;
      WHEN OTHERS => 
        SDFController_multjState_next <= to_unsigned(16#0#, 2);
        SDFController_multiply_J_reg_next <= '0';
    END CASE;
    CASE SDFController_rdState IS
      WHEN "00" =>
        SDFController_rdState_next <= to_unsigned(16#0#, 2);
        SDFController_rdAddr_reg_next <= '0';
        rd_15_Enb <= '0';
        IF SDFController_procEnb_reg = '1' THEN 
          SDFController_rdState_next <= to_unsigned(16#1#, 2);
          rd_15_Enb <= dinXTwdl_15_1_vld_1;
          IF dinXTwdl_15_1_vld_1 = '1' THEN 
            SDFController_rdAddr_reg_next <= '1';
          END IF;
        END IF;
      WHEN "01" =>
        SDFController_rdState_next <= to_unsigned(16#1#, 2);
        rd_15_Enb <= dinXTwdl_15_1_vld_1;
        IF dinXTwdl_15_1_vld_1 = '1' THEN 
          IF SDFController_rdAddr_reg = '1' THEN 
            SDFController_rdState_next <= to_unsigned(16#2#, 2);
            SDFController_rdAddr_reg_next <= '0';
          ELSE 
            SDFController_rdAddr_reg_next <= '1';
          END IF;
        END IF;
      WHEN "10" =>
        rd_15_Enb <= '0';
        IF SDFController_rdAddr_reg = '1' THEN 
          SDFController_rdAddr_reg_next <= '0';
          IF SDFController_procEnb_reg = '1' THEN 
            SDFController_rdState_next <= to_unsigned(16#1#, 2);
          ELSE 
            SDFController_rdState_next <= to_unsigned(16#0#, 2);
          END IF;
        ELSE 
          SDFController_rdAddr_reg_next <= '1';
        END IF;
      WHEN OTHERS => 
        SDFController_rdState_next <= to_unsigned(16#0#, 2);
        SDFController_rdAddr_reg_next <= '0';
        rd_15_Enb <= '0';
    END CASE;
    CASE SDFController_wrState IS
      WHEN "00" =>
        SDFController_wrState_next <= to_unsigned(16#0#, 2);
        SDFController_wrCount_next <= '0';
        SDFController_procEnb_reg_next <= '0';
        IF dinXTwdl_15_1_vld = '1' THEN 
          SDFController_wrState_next <= to_unsigned(16#1#, 2);
          SDFController_wrCount_next <= '1';
        END IF;
      WHEN "01" =>
        SDFController_wrState_next <= to_unsigned(16#1#, 2);
        SDFController_procEnb_reg_next <= '0';
        IF dinXTwdl_15_1_vld = '1' THEN 
          SDFController_wrState_next <= to_unsigned(16#2#, 2);
          SDFController_procEnb_reg_next <= '1';
          SDFController_wrCount_next <= '0';
        END IF;
      WHEN "10" =>
        SDFController_wrState_next <= to_unsigned(16#2#, 2);
        SDFController_procEnb_reg_next <= '1';
        IF dinXTwdl_15_1_vld = '1' THEN 
          IF SDFController_wrCount = '1' THEN 
            SDFController_wrState_next <= to_unsigned(16#0#, 2);
            SDFController_procEnb_reg_next <= '0';
            SDFController_wrCount_next <= '0';
          ELSE 
            SDFController_wrCount_next <= '1';
          END IF;
        END IF;
      WHEN OTHERS => 
        SDFController_wrState_next <= to_unsigned(16#0#, 2);
        SDFController_wrCount_next <= '0';
        SDFController_procEnb_reg_next <= '0';
    END CASE;
    rd_15_Addr <= SDFController_rdAddr_reg;
    proc_15_enb <= SDFController_procEnb_reg;
    multiply_15_J <= SDFController_multiply_J_reg;
  END PROCESS SDFController_output;


END rtl;

