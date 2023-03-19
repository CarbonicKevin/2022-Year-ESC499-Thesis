-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser_src_Complex4Multiply_block21.vhd
-- Created: 2021-03-09 14:00:47
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser_src_Complex4Multiply_block21
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 512/RADIX22FFT_SDF1_7/Complex4Multipl
-- Hierarchy Level: 7
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser_src_Complex4Multiply_block21 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        din_re                            :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
        din_im                            :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
        din_7_vld_dly                     :   IN    std_logic;
        twdl_7_1_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_7_1_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        softReset                         :   IN    std_logic;
        dinXTwdl_re                       :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
        dinXTwdl_im                       :   OUT   std_logic_vector(22 DOWNTO 0);  -- sfix23_En15
        dinXTwdl_7_1_vld                  :   OUT   std_logic
        );
END SpectrumAnalyser_src_Complex4Multiply_block21;


ARCHITECTURE rtl OF SpectrumAnalyser_src_Complex4Multiply_block21 IS

  -- Signals
  SIGNAL din_re_signed                    : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL din_re_reg                       : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL din_im_signed                    : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL din_im_reg                       : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL twdl_7_1_re_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdl_re_reg                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdl_7_1_im_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL twdl_im_reg                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Complex4Multiply_din1_re_pipe1   : signed(22 DOWNTO 0) := to_signed(16#000000#, 23);  -- sfix23
  SIGNAL Complex4Multiply_din1_im_pipe1   : signed(22 DOWNTO 0) := to_signed(16#000000#, 23);  -- sfix23
  SIGNAL Complex4Multiply_mult1_re_pipe1  : signed(38 DOWNTO 0) := to_signed(0, 39);  -- sfix39
  SIGNAL Complex4Multiply_mult2_re_pipe1  : signed(38 DOWNTO 0) := to_signed(0, 39);  -- sfix39
  SIGNAL Complex4Multiply_mult1_im_pipe1  : signed(38 DOWNTO 0) := to_signed(0, 39);  -- sfix39
  SIGNAL Complex4Multiply_mult2_im_pipe1  : signed(38 DOWNTO 0) := to_signed(0, 39);  -- sfix39
  SIGNAL Complex4Multiply_twiddle_re_pipe1 : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL Complex4Multiply_twiddle_im_pipe1 : signed(15 DOWNTO 0) := to_signed(16#0000#, 16);  -- sfix16
  SIGNAL prod1_re                         : signed(38 DOWNTO 0) := to_signed(0, 39);  -- sfix39_En29
  SIGNAL prod1_im                         : signed(38 DOWNTO 0) := to_signed(0, 39);  -- sfix39_En29
  SIGNAL prod2_re                         : signed(38 DOWNTO 0) := to_signed(0, 39);  -- sfix39_En29
  SIGNAL prod2_im                         : signed(38 DOWNTO 0) := to_signed(0, 39);  -- sfix39_En29
  SIGNAL din_vld_dly1                     : std_logic;
  SIGNAL din_vld_dly2                     : std_logic;
  SIGNAL din_vld_dly3                     : std_logic;
  SIGNAL prod_vld                         : std_logic;
  SIGNAL Complex4Add_multRes_re_reg       : signed(39 DOWNTO 0);  -- sfix40
  SIGNAL Complex4Add_multRes_im_reg       : signed(39 DOWNTO 0);  -- sfix40
  SIGNAL Complex4Add_prod_vld_reg1        : std_logic;
  SIGNAL Complex4Add_prod1_re_reg         : signed(38 DOWNTO 0);  -- sfix39
  SIGNAL Complex4Add_prod1_im_reg         : signed(38 DOWNTO 0);  -- sfix39
  SIGNAL Complex4Add_prod2_re_reg         : signed(38 DOWNTO 0);  -- sfix39
  SIGNAL Complex4Add_prod2_im_reg         : signed(38 DOWNTO 0);  -- sfix39
  SIGNAL Complex4Add_multRes_re_reg_next  : signed(39 DOWNTO 0);  -- sfix40_En29
  SIGNAL Complex4Add_multRes_im_reg_next  : signed(39 DOWNTO 0);  -- sfix40_En29
  SIGNAL Complex4Add_sub_cast             : signed(39 DOWNTO 0);  -- sfix40_En29
  SIGNAL Complex4Add_sub_cast_1           : signed(39 DOWNTO 0);  -- sfix40_En29
  SIGNAL Complex4Add_add_cast             : signed(39 DOWNTO 0);  -- sfix40_En29
  SIGNAL Complex4Add_add_cast_1           : signed(39 DOWNTO 0);  -- sfix40_En29
  SIGNAL mulResFP_re                      : signed(39 DOWNTO 0);  -- sfix40_En29
  SIGNAL mulResFP_im                      : signed(39 DOWNTO 0);  -- sfix40_En29
  SIGNAL dinXTwdl_re_tmp                  : signed(22 DOWNTO 0);  -- sfix23_En15
  SIGNAL dinXTwdl_im_tmp                  : signed(22 DOWNTO 0);  -- sfix23_En15

BEGIN
  din_re_signed <= signed(din_re);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_re_reg <= to_signed(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        din_re_reg <= din_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  din_im_signed <= signed(din_im);

  intdelay_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_im_reg <= to_signed(16#000000#, 23);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        din_im_reg <= din_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  twdl_7_1_re_signed <= signed(twdl_7_1_re);

  intdelay_2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl_re_reg <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twdl_re_reg <= twdl_7_1_re_signed;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  twdl_7_1_im_signed <= signed(twdl_7_1_im);

  intdelay_3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twdl_im_reg <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        twdl_im_reg <= twdl_7_1_im_signed;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  -- Complex4Multiply
  Complex4Multiply_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        prod1_re <= Complex4Multiply_mult1_re_pipe1;
        prod2_re <= Complex4Multiply_mult2_re_pipe1;
        prod1_im <= Complex4Multiply_mult1_im_pipe1;
        prod2_im <= Complex4Multiply_mult2_im_pipe1;
        Complex4Multiply_mult1_re_pipe1 <= Complex4Multiply_din1_re_pipe1 * Complex4Multiply_twiddle_re_pipe1;
        Complex4Multiply_mult2_re_pipe1 <= Complex4Multiply_din1_im_pipe1 * Complex4Multiply_twiddle_im_pipe1;
        Complex4Multiply_mult1_im_pipe1 <= Complex4Multiply_din1_re_pipe1 * Complex4Multiply_twiddle_im_pipe1;
        Complex4Multiply_mult2_im_pipe1 <= Complex4Multiply_din1_im_pipe1 * Complex4Multiply_twiddle_re_pipe1;
        Complex4Multiply_twiddle_re_pipe1 <= twdl_re_reg;
        Complex4Multiply_twiddle_im_pipe1 <= twdl_im_reg;
        Complex4Multiply_din1_re_pipe1 <= din_re_reg;
        Complex4Multiply_din1_im_pipe1 <= din_im_reg;
      END IF;
    END IF;
  END PROCESS Complex4Multiply_process;


  intdelay_4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        din_vld_dly1 <= din_7_vld_dly;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly2 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        din_vld_dly2 <= din_vld_dly1;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      din_vld_dly3 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        din_vld_dly3 <= din_vld_dly2;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      prod_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        prod_vld <= din_vld_dly3;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  -- Complex4Add
  Complex4Add_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Complex4Add_multRes_re_reg <= to_signed(0, 40);
      Complex4Add_multRes_im_reg <= to_signed(0, 40);
      Complex4Add_prod1_re_reg <= to_signed(0, 39);
      Complex4Add_prod1_im_reg <= to_signed(0, 39);
      Complex4Add_prod2_re_reg <= to_signed(0, 39);
      Complex4Add_prod2_im_reg <= to_signed(0, 39);
      Complex4Add_prod_vld_reg1 <= '0';
      dinXTwdl_7_1_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Complex4Add_multRes_re_reg <= Complex4Add_multRes_re_reg_next;
        Complex4Add_multRes_im_reg <= Complex4Add_multRes_im_reg_next;
        Complex4Add_prod1_re_reg <= prod1_re;
        Complex4Add_prod1_im_reg <= prod1_im;
        Complex4Add_prod2_re_reg <= prod2_re;
        Complex4Add_prod2_im_reg <= prod2_im;
        dinXTwdl_7_1_vld <= Complex4Add_prod_vld_reg1;
        Complex4Add_prod_vld_reg1 <= prod_vld;
      END IF;
    END IF;
  END PROCESS Complex4Add_process;

  Complex4Add_sub_cast <= resize(Complex4Add_prod1_re_reg, 40);
  Complex4Add_sub_cast_1 <= resize(Complex4Add_prod2_re_reg, 40);
  Complex4Add_multRes_re_reg_next <= Complex4Add_sub_cast - Complex4Add_sub_cast_1;
  Complex4Add_add_cast <= resize(Complex4Add_prod1_im_reg, 40);
  Complex4Add_add_cast_1 <= resize(Complex4Add_prod2_im_reg, 40);
  Complex4Add_multRes_im_reg_next <= Complex4Add_add_cast + Complex4Add_add_cast_1;
  mulResFP_re <= Complex4Add_multRes_re_reg;
  mulResFP_im <= Complex4Add_multRes_im_reg;

  dinXTwdl_re_tmp <= mulResFP_re(36 DOWNTO 14) + ('0' & (mulResFP_re(13) AND (( NOT mulResFP_re(39)) OR (mulResFP_re(12) OR mulResFP_re(11) OR mulResFP_re(10) OR mulResFP_re(9) OR mulResFP_re(8) OR mulResFP_re(7) OR mulResFP_re(6) OR mulResFP_re(5) OR mulResFP_re(4) OR mulResFP_re(3) OR mulResFP_re(2) OR mulResFP_re(1) OR mulResFP_re(0)))));

  dinXTwdl_re <= std_logic_vector(dinXTwdl_re_tmp);

  dinXTwdl_im_tmp <= mulResFP_im(36 DOWNTO 14) + ('0' & (mulResFP_im(13) AND (( NOT mulResFP_im(39)) OR (mulResFP_im(12) OR mulResFP_im(11) OR mulResFP_im(10) OR mulResFP_im(9) OR mulResFP_im(8) OR mulResFP_im(7) OR mulResFP_im(6) OR mulResFP_im(5) OR mulResFP_im(4) OR mulResFP_im(3) OR mulResFP_im(2) OR mulResFP_im(1) OR mulResFP_im(0)))));

  dinXTwdl_im <= std_logic_vector(dinXTwdl_im_tmp);

END rtl;

