-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_10_block2.vhd
-- Created: 2023-04-04 17:52:56
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_10_block2
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 8192/RADIX22FFT_CTRL1_1
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_10_block2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        dout_9_1_vld                      :   IN    std_logic;
        dinXTwdl_10_1_vld                 :   IN    std_logic;
        softReset                         :   IN    std_logic;
        rd_10_Addr                        :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
        rd_10_Enb                         :   OUT   std_logic;
        proc_10_enb                       :   OUT   std_logic;
        multiply_10_J                     :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_10_block2;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_RADIX22FFT_CTRL1_10_block2 IS

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
  SIGNAL SDFController_wrCount            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFController_wrState            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdState            : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdAddr_reg         : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFController_procEnb_reg        : std_logic;
  SIGNAL SDFController_multjState         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_multiply_J_reg     : std_logic;
  SIGNAL SDFController_wrCount_next       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFController_wrState_next       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdState_next       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_rdAddr_reg_next    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFController_procEnb_reg_next   : std_logic;
  SIGNAL SDFController_multjState_next    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL SDFController_multiply_J_reg_next : std_logic;
  SIGNAL rd_10_Addr_tmp                   : unsigned(2 DOWNTO 0);  -- ufix3

BEGIN
  -- SDFController
  SDFController_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      SDFController_wrCount <= to_unsigned(16#0#, 3);
      SDFController_rdAddr_reg <= to_unsigned(16#0#, 3);
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
       dinXTwdl_10_1_vld, dout_9_1_vld)
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
        SDFController_rdAddr_reg_next <= to_unsigned(16#0#, 3);
        rd_10_Enb <= '0';
        IF (dout_9_1_vld AND hdlcoder_to_stdlogic(SDFController_wrCount = to_unsigned(16#7#, 3))) = '1' THEN 
          SDFController_rdState_next <= to_unsigned(16#1#, 2);
        END IF;
      WHEN "01" =>
        SDFController_rdState_next <= to_unsigned(16#1#, 2);
        rd_10_Enb <= dinXTwdl_10_1_vld;
        IF dinXTwdl_10_1_vld = '1' THEN 
          IF SDFController_rdAddr_reg = to_unsigned(16#7#, 3) THEN 
            SDFController_rdState_next <= to_unsigned(16#2#, 2);
          END IF;
          SDFController_rdAddr_reg_next <= SDFController_rdAddr_reg + to_unsigned(16#1#, 3);
        END IF;
      WHEN "10" =>
        rd_10_Enb <= '0';
        IF SDFController_rdAddr_reg = to_unsigned(16#7#, 3) THEN 
          IF (dout_9_1_vld AND hdlcoder_to_stdlogic(SDFController_wrCount = to_unsigned(16#7#, 3))) = '1' THEN 
            SDFController_rdState_next <= to_unsigned(16#1#, 2);
          ELSE 
            SDFController_rdState_next <= to_unsigned(16#0#, 2);
          END IF;
        END IF;
        SDFController_rdAddr_reg_next <= SDFController_rdAddr_reg + to_unsigned(16#1#, 3);
      WHEN OTHERS => 
        SDFController_rdState_next <= to_unsigned(16#0#, 2);
        SDFController_rdAddr_reg_next <= to_unsigned(16#0#, 3);
        rd_10_Enb <= '0';
    END CASE;
    CASE SDFController_wrState IS
      WHEN "00" =>
        SDFController_wrState_next <= to_unsigned(16#0#, 2);
        SDFController_wrCount_next <= to_unsigned(16#0#, 3);
        SDFController_procEnb_reg_next <= '0';
        IF dout_9_1_vld = '1' THEN 
          SDFController_wrState_next <= to_unsigned(16#1#, 2);
          SDFController_wrCount_next <= to_unsigned(16#1#, 3);
        END IF;
      WHEN "01" =>
        SDFController_wrState_next <= to_unsigned(16#1#, 2);
        SDFController_procEnb_reg_next <= '0';
        IF dout_9_1_vld = '1' THEN 
          IF SDFController_wrCount = to_unsigned(16#7#, 3) THEN 
            SDFController_wrState_next <= to_unsigned(16#2#, 2);
            SDFController_procEnb_reg_next <= '1';
          ELSE 
            SDFController_wrState_next <= to_unsigned(16#1#, 2);
          END IF;
          SDFController_wrCount_next <= SDFController_wrCount + to_unsigned(16#1#, 3);
        END IF;
      WHEN "10" =>
        SDFController_wrState_next <= to_unsigned(16#2#, 2);
        IF dout_9_1_vld = '1' THEN 
          IF SDFController_wrCount = to_unsigned(16#7#, 3) THEN 
            SDFController_wrState_next <= to_unsigned(16#1#, 2);
            SDFController_procEnb_reg_next <= '0';
          ELSE 
            SDFController_wrState_next <= to_unsigned(16#2#, 2);
            SDFController_procEnb_reg_next <= '1';
          END IF;
          SDFController_wrCount_next <= SDFController_wrCount + to_unsigned(16#1#, 3);
        END IF;
      WHEN OTHERS => 
        SDFController_wrState_next <= to_unsigned(16#0#, 2);
        SDFController_wrCount_next <= to_unsigned(16#7#, 3);
        SDFController_procEnb_reg_next <= '0';
    END CASE;
    rd_10_Addr_tmp <= SDFController_rdAddr_reg;
    proc_10_enb <= SDFController_procEnb_reg;
    multiply_10_J <= SDFController_multiply_J_reg;
  END PROCESS SDFController_output;


  rd_10_Addr <= std_logic_vector(rd_10_Addr_tmp);

END rtl;

