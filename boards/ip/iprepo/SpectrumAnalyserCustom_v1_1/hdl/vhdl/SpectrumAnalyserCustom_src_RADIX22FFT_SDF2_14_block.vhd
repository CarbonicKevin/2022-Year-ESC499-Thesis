-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_RADIX22FFT_SDF2_14_block.vhd
-- Created: 2023-04-04 17:52:55
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_RADIX22FFT_SDF2_14_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 32768/RADIX22FFT_SDF2_1
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_RADIX22FFT_SDF2_14_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        dout_13_1_re                      :   IN    std_logic_vector(28 DOWNTO 0);  -- sfix29_En15
        dout_13_1_im                      :   IN    std_logic_vector(28 DOWNTO 0);  -- sfix29_En15
        dout_13_1_vld                     :   IN    std_logic;
        rd_14_Addr                        :   IN    std_logic;  -- ufix1
        rd_14_Enb                         :   IN    std_logic;
        proc_14_enb                       :   IN    std_logic;
        multiply_14_J                     :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_14_1_re                      :   OUT   std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
        dout_14_1_im                      :   OUT   std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
        dout_14_1_vld                     :   OUT   std_logic;
        dinXTwdl_14_1_vld                 :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_RADIX22FFT_SDF2_14_block;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_RADIX22FFT_SDF2_14_block IS

  -- Component Declarations
  COMPONENT SpectrumAnalyserCustom_src_SDFCommutator14_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          dout_13_1_vld                   :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          xf_im                           :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          xf_vld                          :   IN    std_logic;
          dinf_re                         :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          dinf_im                         :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          dinf_vld                        :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          btf1_im                         :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          btf2_re                         :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          btf2_im                         :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          btfout_vld                      :   IN    std_logic;
          softReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          wrData_im                       :   OUT   std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          wrAddr                          :   OUT   std_logic;  -- ufix1
          wrEnb                           :   OUT   std_logic;
          dout_14_1_re                    :   OUT   std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          dout_14_1_im                    :   OUT   std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
          dout_14_1_vld                   :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyserCustom_src_SDFCommutator14_block
    USE ENTITY work.SpectrumAnalyserCustom_src_SDFCommutator14_block(rtl);

  -- Signals
  SIGNAL dout_13_1_re_signed              : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL din_re                           : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL dout_13_1_im_signed              : signed(28 DOWNTO 0);  -- sfix29_En15
  SIGNAL din_im                           : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL saveEnb                          : std_logic;
  SIGNAL dinVld                           : std_logic;
  SIGNAL din_re_dly1                      : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL btfin_re                         : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL din_im_dly1                      : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL btfin_im                         : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL mulIn_vld                        : std_logic;
  SIGNAL procEnb_dly1                     : std_logic;
  SIGNAL btfin_vld                        : std_logic;
  SIGNAL x_vld                            : std_logic;
  SIGNAL x_vld_dly                        : std_logic;
  SIGNAL btf2_im                          : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL btf2_re                          : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL btf1_im                          : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL btf1_re                          : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL dinf_im                          : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL dinf_re                          : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL xf_im                            : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL x_im                             : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL x_im_dly                         : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL wrData_im                        : std_logic_vector(29 DOWNTO 0);  -- ufix30
  SIGNAL wrData_im_signed                 : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL wrData_re                        : std_logic_vector(29 DOWNTO 0);  -- ufix30
  SIGNAL wrData_re_signed                 : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL wrAddr                           : std_logic;  -- ufix1
  SIGNAL wrEnb                            : std_logic;
  SIGNAL twoLocationReg_0_MEM_re_0        : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL twoLocationReg_0_MEM_im_0        : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL twoLocationReg_0_MEM_re_1        : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL twoLocationReg_0_MEM_im_1        : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL twoLocationReg_0_dout_re_reg     : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL twoLocationReg_0_dout_im_reg     : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL twoLocationReg_0_MEM_re_0_next   : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL twoLocationReg_0_MEM_im_0_next   : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL twoLocationReg_0_MEM_re_1_next   : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL twoLocationReg_0_MEM_im_1_next   : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL twoLocationReg_0_dout_re_reg_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL twoLocationReg_0_dout_im_reg_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL x_re                             : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL x_re_dly                         : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_procEnb_dly   : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly1  : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly2  : std_logic;
  SIGNAL Radix22ButterflyG2_btf1_re_reg   : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG2_btf1_im_reg   : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG2_btf2_re_reg   : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG2_btf2_im_reg   : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG2_din_re_dly    : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL Radix22ButterflyG2_din_im_dly    : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL Radix22ButterflyG2_din_vld_dly   : std_logic;
  SIGNAL Radix22ButterflyG2_x_re_dly      : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL Radix22ButterflyG2_x_im_dly      : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL Radix22ButterflyG2_x_vld_dly     : std_logic;
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly1 : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly1 : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly2 : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly2 : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL Radix22ButterflyG2_multiply_J_dly1 : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly1_next : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly2_next : std_logic;
  SIGNAL Radix22ButterflyG2_btf1_re_reg_next : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL Radix22ButterflyG2_btf1_im_reg_next : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL Radix22ButterflyG2_btf2_re_reg_next : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL Radix22ButterflyG2_btf2_im_reg_next : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL Radix22ButterflyG2_din_re_dly_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_din_im_dly_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_din_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_x_re_dly_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_x_im_dly_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_x_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly1_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly1_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly2_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly2_next : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL Radix22ButterflyG2_multiply_J_dly1_next : std_logic;
  SIGNAL xf_re                            : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinf_vld                         : std_logic;
  SIGNAL btfout_vld                       : std_logic;
  SIGNAL dout_14_1_re_tmp                 : std_logic_vector(29 DOWNTO 0);  -- ufix30
  SIGNAL dout_14_1_im_tmp                 : std_logic_vector(29 DOWNTO 0);  -- ufix30

BEGIN
  u_SDFCOMMUTATOR_14 : SpectrumAnalyserCustom_src_SDFCommutator14_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              dout_13_1_vld => dout_13_1_vld,
              xf_re => std_logic_vector(xf_re),  -- sfix30_En15
              xf_im => std_logic_vector(xf_im),  -- sfix30_En15
              xf_vld => xf_vld,
              dinf_re => std_logic_vector(dinf_re),  -- sfix30_En15
              dinf_im => std_logic_vector(dinf_im),  -- sfix30_En15
              dinf_vld => dinf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix30_En15
              btf1_im => std_logic_vector(btf1_im),  -- sfix30_En15
              btf2_re => std_logic_vector(btf2_re),  -- sfix30_En15
              btf2_im => std_logic_vector(btf2_im),  -- sfix30_En15
              btfout_vld => btfout_vld,
              softReset => softReset,
              wrData_re => wrData_re,  -- sfix30_En15
              wrData_im => wrData_im,  -- sfix30_En15
              wrAddr => wrAddr,  -- ufix1
              wrEnb => wrEnb,
              dout_14_1_re => dout_14_1_re_tmp,  -- sfix30_En15
              dout_14_1_im => dout_14_1_im_tmp,  -- sfix30_En15
              dout_14_1_vld => dout_14_1_vld
              );

  dout_13_1_re_signed <= signed(dout_13_1_re);

  din_re <= resize(dout_13_1_re_signed, 30);

  dout_13_1_im_signed <= signed(dout_13_1_im);

  din_im <= resize(dout_13_1_im_signed, 30);

  saveEnb <=  NOT proc_14_enb;

  dinVld <= dout_13_1_vld AND saveEnb;

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_re_dly1 <= to_signed(16#00000000#, 30);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        din_re_dly1 <= din_re;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      btfin_re <= to_signed(16#00000000#, 30);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        btfin_re <= din_re_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_im_dly1 <= to_signed(16#00000000#, 30);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        din_im_dly1 <= din_im;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      btfin_im <= to_signed(16#00000000#, 30);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        btfin_im <= din_im_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  mulIn_vld <= dout_13_1_vld AND proc_14_enb;

  intdelay_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      procEnb_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        procEnb_dly1 <= mulIn_vld;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      btfin_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        btfin_vld <= procEnb_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        x_vld <= rd_14_Enb;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld_dly <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        x_vld_dly <= x_vld;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  intdelay_8_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_im_dly <= to_signed(16#00000000#, 30);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        x_im_dly <= x_im;
      END IF;
    END IF;
  END PROCESS intdelay_8_process;


  wrData_im_signed <= signed(wrData_im);

  wrData_re_signed <= signed(wrData_re);

  -- twoLocationReg_0
  twoLocationReg_0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twoLocationReg_0_MEM_re_0 <= to_signed(16#00000000#, 30);
      twoLocationReg_0_MEM_im_0 <= to_signed(16#00000000#, 30);
      twoLocationReg_0_MEM_re_1 <= to_signed(16#00000000#, 30);
      twoLocationReg_0_MEM_im_1 <= to_signed(16#00000000#, 30);
      twoLocationReg_0_dout_re_reg <= to_signed(16#00000000#, 30);
      twoLocationReg_0_dout_im_reg <= to_signed(16#00000000#, 30);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
        twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
        twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
        twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
        twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
        twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
      END IF;
    END IF;
  END PROCESS twoLocationReg_0_process;

  twoLocationReg_0_output : PROCESS (rd_14_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im_signed, wrData_re_signed, wrEnb)
  BEGIN
    twoLocationReg_0_MEM_re_0_next <= twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next <= twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next <= twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next <= twoLocationReg_0_MEM_im_1;
    twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_dout_re_reg;
    twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_dout_im_reg;
    IF rd_14_Addr = '1' THEN 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_1;
    ELSE 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_0;
    END IF;
    IF wrEnb = '1' THEN 
      IF wrAddr = '1' THEN 
        twoLocationReg_0_MEM_re_1_next <= wrData_re_signed;
        twoLocationReg_0_MEM_im_1_next <= wrData_im_signed;
      ELSE 
        twoLocationReg_0_MEM_re_0_next <= wrData_re_signed;
        twoLocationReg_0_MEM_im_0_next <= wrData_im_signed;
      END IF;
    END IF;
    x_re <= twoLocationReg_0_dout_re_reg;
    x_im <= twoLocationReg_0_dout_im_reg;
  END PROCESS twoLocationReg_0_output;


  intdelay_9_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_re_dly <= to_signed(16#00000000#, 30);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        x_re_dly <= x_re;
      END IF;
    END IF;
  END PROCESS intdelay_9_process;


  -- Radix22ButterflyG2
  Radix22ButterflyG2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG2_procEnb_dly <= '0';
      Radix22ButterflyG2_procEnb_dly1 <= '0';
      Radix22ButterflyG2_procEnb_dly2 <= '0';
      Radix22ButterflyG2_btf1_re_reg <= to_signed(16#00000000#, 31);
      Radix22ButterflyG2_btf1_im_reg <= to_signed(16#00000000#, 31);
      Radix22ButterflyG2_btf2_re_reg <= to_signed(16#00000000#, 31);
      Radix22ButterflyG2_btf2_im_reg <= to_signed(16#00000000#, 31);
      Radix22ButterflyG2_din_re_dly <= to_signed(16#00000000#, 30);
      Radix22ButterflyG2_din_im_dly <= to_signed(16#00000000#, 30);
      Radix22ButterflyG2_din_vld_dly <= '0';
      Radix22ButterflyG2_x_re_dly <= to_signed(16#00000000#, 30);
      Radix22ButterflyG2_x_im_dly <= to_signed(16#00000000#, 30);
      Radix22ButterflyG2_x_vld_dly <= '0';
      Radix22ButterflyG2_dinXTwdl_re_dly1 <= to_signed(16#00000000#, 30);
      Radix22ButterflyG2_dinXTwdl_im_dly1 <= to_signed(16#00000000#, 30);
      Radix22ButterflyG2_dinXTwdl_re_dly2 <= to_signed(16#00000000#, 30);
      Radix22ButterflyG2_dinXTwdl_im_dly2 <= to_signed(16#00000000#, 30);
      Radix22ButterflyG2_multiply_J_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Radix22ButterflyG2_procEnb_dly <= Radix22ButterflyG2_procEnb_dly_next;
        Radix22ButterflyG2_procEnb_dly1 <= Radix22ButterflyG2_procEnb_dly1_next;
        Radix22ButterflyG2_procEnb_dly2 <= Radix22ButterflyG2_procEnb_dly2_next;
        Radix22ButterflyG2_btf1_re_reg <= Radix22ButterflyG2_btf1_re_reg_next;
        Radix22ButterflyG2_btf1_im_reg <= Radix22ButterflyG2_btf1_im_reg_next;
        Radix22ButterflyG2_btf2_re_reg <= Radix22ButterflyG2_btf2_re_reg_next;
        Radix22ButterflyG2_btf2_im_reg <= Radix22ButterflyG2_btf2_im_reg_next;
        Radix22ButterflyG2_din_re_dly <= Radix22ButterflyG2_din_re_dly_next;
        Radix22ButterflyG2_din_im_dly <= Radix22ButterflyG2_din_im_dly_next;
        Radix22ButterflyG2_din_vld_dly <= Radix22ButterflyG2_din_vld_dly_next;
        Radix22ButterflyG2_x_re_dly <= Radix22ButterflyG2_x_re_dly_next;
        Radix22ButterflyG2_x_im_dly <= Radix22ButterflyG2_x_im_dly_next;
        Radix22ButterflyG2_x_vld_dly <= Radix22ButterflyG2_x_vld_dly_next;
        Radix22ButterflyG2_dinXTwdl_re_dly1 <= Radix22ButterflyG2_dinXTwdl_re_dly1_next;
        Radix22ButterflyG2_dinXTwdl_im_dly1 <= Radix22ButterflyG2_dinXTwdl_im_dly1_next;
        Radix22ButterflyG2_dinXTwdl_re_dly2 <= Radix22ButterflyG2_dinXTwdl_re_dly2_next;
        Radix22ButterflyG2_dinXTwdl_im_dly2 <= Radix22ButterflyG2_dinXTwdl_im_dly2_next;
        Radix22ButterflyG2_multiply_J_dly1 <= Radix22ButterflyG2_multiply_J_dly1_next;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG2_process;

  Radix22ButterflyG2_output : PROCESS (Radix22ButterflyG2_btf1_im_reg, Radix22ButterflyG2_btf1_re_reg,
       Radix22ButterflyG2_btf2_im_reg, Radix22ButterflyG2_btf2_re_reg,
       Radix22ButterflyG2_dinXTwdl_im_dly1, Radix22ButterflyG2_dinXTwdl_im_dly2,
       Radix22ButterflyG2_dinXTwdl_re_dly1, Radix22ButterflyG2_dinXTwdl_re_dly2,
       Radix22ButterflyG2_din_im_dly, Radix22ButterflyG2_din_re_dly,
       Radix22ButterflyG2_din_vld_dly, Radix22ButterflyG2_multiply_J_dly1,
       Radix22ButterflyG2_procEnb_dly, Radix22ButterflyG2_procEnb_dly1,
       Radix22ButterflyG2_procEnb_dly2, Radix22ButterflyG2_x_im_dly,
       Radix22ButterflyG2_x_re_dly, Radix22ButterflyG2_x_vld_dly, btfin_im,
       btfin_re, btfin_vld, dinVld, din_im, din_re, multiply_14_J, x_im_dly,
       x_re_dly, x_vld_dly)
    VARIABLE add_cast : signed(30 DOWNTO 0);
    VARIABLE add_cast_0 : signed(30 DOWNTO 0);
    VARIABLE add_cast_1 : signed(30 DOWNTO 0);
    VARIABLE add_cast_2 : signed(30 DOWNTO 0);
    VARIABLE sub_cast : signed(30 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(30 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(30 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(30 DOWNTO 0);
    VARIABLE add_cast_3 : signed(30 DOWNTO 0);
    VARIABLE add_cast_4 : signed(30 DOWNTO 0);
    VARIABLE add_cast_5 : signed(30 DOWNTO 0);
    VARIABLE add_cast_6 : signed(30 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(30 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(30 DOWNTO 0);
    VARIABLE sub_cast_5 : signed(30 DOWNTO 0);
    VARIABLE sub_cast_6 : signed(30 DOWNTO 0);
  BEGIN
    add_cast := to_signed(16#00000000#, 31);
    add_cast_0 := to_signed(16#00000000#, 31);
    add_cast_1 := to_signed(16#00000000#, 31);
    add_cast_2 := to_signed(16#00000000#, 31);
    sub_cast := to_signed(16#00000000#, 31);
    sub_cast_0 := to_signed(16#00000000#, 31);
    sub_cast_1 := to_signed(16#00000000#, 31);
    sub_cast_2 := to_signed(16#00000000#, 31);
    add_cast_3 := to_signed(16#00000000#, 31);
    add_cast_4 := to_signed(16#00000000#, 31);
    add_cast_5 := to_signed(16#00000000#, 31);
    add_cast_6 := to_signed(16#00000000#, 31);
    sub_cast_3 := to_signed(16#00000000#, 31);
    sub_cast_4 := to_signed(16#00000000#, 31);
    sub_cast_5 := to_signed(16#00000000#, 31);
    sub_cast_6 := to_signed(16#00000000#, 31);
    Radix22ButterflyG2_btf1_re_reg_next <= Radix22ButterflyG2_btf1_re_reg;
    Radix22ButterflyG2_btf1_im_reg_next <= Radix22ButterflyG2_btf1_im_reg;
    Radix22ButterflyG2_btf2_re_reg_next <= Radix22ButterflyG2_btf2_re_reg;
    Radix22ButterflyG2_btf2_im_reg_next <= Radix22ButterflyG2_btf2_im_reg;
    Radix22ButterflyG2_x_re_dly_next <= x_re_dly;
    Radix22ButterflyG2_x_im_dly_next <= x_im_dly;
    Radix22ButterflyG2_x_vld_dly_next <= x_vld_dly;
    Radix22ButterflyG2_din_re_dly_next <= din_re;
    Radix22ButterflyG2_din_im_dly_next <= din_im;
    Radix22ButterflyG2_din_vld_dly_next <= dinVld;
    Radix22ButterflyG2_procEnb_dly2_next <= Radix22ButterflyG2_procEnb_dly1;
    Radix22ButterflyG2_procEnb_dly1_next <= Radix22ButterflyG2_procEnb_dly;
    Radix22ButterflyG2_procEnb_dly_next <= btfin_vld;
    IF Radix22ButterflyG2_multiply_J_dly1 = '1' THEN 
      add_cast_1 := resize(x_re_dly, 31);
      add_cast_2 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 31);
      Radix22ButterflyG2_btf1_re_reg_next <= add_cast_1 + add_cast_2;
      sub_cast_1 := resize(x_re_dly, 31);
      sub_cast_2 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 31);
      Radix22ButterflyG2_btf2_re_reg_next <= sub_cast_1 - sub_cast_2;
      add_cast_5 := resize(x_im_dly, 31);
      add_cast_6 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 31);
      Radix22ButterflyG2_btf2_im_reg_next <= add_cast_5 + add_cast_6;
      sub_cast_5 := resize(x_im_dly, 31);
      sub_cast_6 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 31);
      Radix22ButterflyG2_btf1_im_reg_next <= sub_cast_5 - sub_cast_6;
    ELSE 
      add_cast := resize(x_re_dly, 31);
      add_cast_0 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 31);
      Radix22ButterflyG2_btf1_re_reg_next <= add_cast + add_cast_0;
      sub_cast := resize(x_re_dly, 31);
      sub_cast_0 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 31);
      Radix22ButterflyG2_btf2_re_reg_next <= sub_cast - sub_cast_0;
      add_cast_3 := resize(x_im_dly, 31);
      add_cast_4 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 31);
      Radix22ButterflyG2_btf1_im_reg_next <= add_cast_3 + add_cast_4;
      sub_cast_3 := resize(x_im_dly, 31);
      sub_cast_4 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 31);
      Radix22ButterflyG2_btf2_im_reg_next <= sub_cast_3 - sub_cast_4;
    END IF;
    Radix22ButterflyG2_dinXTwdl_re_dly2_next <= Radix22ButterflyG2_dinXTwdl_re_dly1;
    Radix22ButterflyG2_dinXTwdl_im_dly2_next <= Radix22ButterflyG2_dinXTwdl_im_dly1;
    Radix22ButterflyG2_dinXTwdl_re_dly1_next <= btfin_re;
    Radix22ButterflyG2_dinXTwdl_im_dly1_next <= btfin_im;
    Radix22ButterflyG2_multiply_J_dly1_next <= multiply_14_J;
    xf_re <= Radix22ButterflyG2_x_re_dly;
    xf_im <= Radix22ButterflyG2_x_im_dly;
    xf_vld <= Radix22ButterflyG2_x_vld_dly;
    dinf_re <= Radix22ButterflyG2_din_re_dly;
    dinf_im <= Radix22ButterflyG2_din_im_dly;
    dinf_vld <= Radix22ButterflyG2_din_vld_dly;
    btf1_re <= Radix22ButterflyG2_btf1_re_reg(29 DOWNTO 0);
    btf1_im <= Radix22ButterflyG2_btf1_im_reg(29 DOWNTO 0);
    btf2_re <= Radix22ButterflyG2_btf2_re_reg(29 DOWNTO 0);
    btf2_im <= Radix22ButterflyG2_btf2_im_reg(29 DOWNTO 0);
    btfout_vld <= Radix22ButterflyG2_procEnb_dly2;
  END PROCESS Radix22ButterflyG2_output;


  dinXTwdl_14_1_vld <= btfin_vld;

  dout_14_1_re <= dout_14_1_re_tmp;

  dout_14_1_im <= dout_14_1_im_tmp;

END rtl;

