-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_15_block.vhd
-- Created: 2023-03-18 22:56:28
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_15_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 65536/RADIX22FFT_SDF1_1
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_15_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        din_15_1_re_dly                   :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
        din_15_1_im_dly                   :   IN    std_logic_vector(29 DOWNTO 0);  -- sfix30_En15
        din_15_vld_dly                    :   IN    std_logic;
        rd_15_Addr                        :   IN    std_logic;  -- ufix1
        rd_15_Enb                         :   IN    std_logic;
        twdl_15_1_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_15_1_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_15_1_vld                     :   IN    std_logic;
        proc_15_enb                       :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_15_1_re                      :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
        dout_15_1_im                      :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
        dout_15_1_vld                     :   OUT   std_logic;
        dinXTwdl_15_1_vld                 :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_15_block;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_15_block IS

  -- Component Declarations
  COMPONENT SpectrumAnalyserCustom_src_Complex4Multiply_block23
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          din_re                          :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          din_im                          :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          din_15_vld_dly                  :   IN    std_logic;
          twdl_15_1_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          twdl_15_1_im                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          softReset                       :   IN    std_logic;
          dinXTwdl_re                     :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          dinXTwdl_im                     :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          dinXTwdl_15_1_vld               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_SDFCommutator15_block
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          din_15_vld_dly                  :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          xf_im                           :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          dinXTwdlf_im                    :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          btf1_im                         :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          btf2_re                         :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          btf2_im                         :   IN    std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          btf_vld                         :   IN    std_logic;
          softReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          wrData_im                       :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          wrAddr                          :   OUT   std_logic;  -- ufix1
          wrEnb                           :   OUT   std_logic;
          dout_15_1_re                    :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          dout_15_1_im                    :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En15
          dout_15_1_vld                   :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyserCustom_src_Complex4Multiply_block23
    USE ENTITY work.SpectrumAnalyserCustom_src_Complex4Multiply_block23(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_SDFCommutator15_block
    USE ENTITY work.SpectrumAnalyserCustom_src_SDFCommutator15_block(rtl);

  -- Signals
  SIGNAL din_15_1_re_dly_signed           : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL din_re                           : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL din_15_1_im_dly_signed           : signed(29 DOWNTO 0);  -- sfix30_En15
  SIGNAL din_im                           : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL dinXTwdl_re                      : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL dinXTwdl_im                      : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL dinXTwdl_15_1_vld_1              : std_logic;
  SIGNAL dinXTwdl_re_signed               : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL dinXTwdl_im_signed               : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL x_vld                            : std_logic;
  SIGNAL btf2_im                          : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL btf2_re                          : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL btf1_im                          : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL btf1_re                          : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL dinXTwdlf_im                     : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL dinXTwdlf_re                     : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL xf_im                            : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL wrData_im                        : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL wrData_im_signed                 : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL wrData_re                        : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL wrData_re_signed                 : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL wrAddr                           : std_logic;  -- ufix1
  SIGNAL wrEnb                            : std_logic;
  SIGNAL twoLocationReg_0_MEM_re_0        : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL twoLocationReg_0_MEM_im_0        : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL twoLocationReg_0_MEM_re_1        : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL twoLocationReg_0_MEM_im_1        : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL twoLocationReg_0_dout_re_reg     : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL twoLocationReg_0_dout_im_reg     : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL twoLocationReg_0_MEM_re_0_next   : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL twoLocationReg_0_MEM_im_0_next   : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL twoLocationReg_0_MEM_re_1_next   : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL twoLocationReg_0_MEM_im_1_next   : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL twoLocationReg_0_dout_re_reg_next : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL twoLocationReg_0_dout_im_reg_next : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL x_re                             : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL x_im                             : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Radix22ButterflyG1_x_re_dly1     : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG1_x_im_dly1     : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG1_x_vld_dly1    : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(30 DOWNTO 0);  -- sfix31
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL Radix22ButterflyG1_btf1_re_reg_next : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_btf1_im_reg_next : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_btf2_re_reg_next : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_btf2_im_reg_next : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_add_cast      : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_add_cast_1    : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_sub_cast      : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_sub_cast_1    : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_add_cast_2    : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_add_cast_3    : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_sub_cast_2    : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL Radix22ButterflyG1_sub_cast_3    : signed(31 DOWNTO 0);  -- sfix32_En15
  SIGNAL xf_re                            : signed(30 DOWNTO 0);  -- sfix31_En15
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf_vld                          : std_logic;
  SIGNAL dout_15_1_re_tmp                 : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL dout_15_1_im_tmp                 : std_logic_vector(30 DOWNTO 0);  -- ufix31

BEGIN
  u_MUL4 : SpectrumAnalyserCustom_src_Complex4Multiply_block23
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              din_re => std_logic_vector(din_re),  -- sfix31_En15
              din_im => std_logic_vector(din_im),  -- sfix31_En15
              din_15_vld_dly => din_15_vld_dly,
              twdl_15_1_re => twdl_15_1_re,  -- sfix16_En14
              twdl_15_1_im => twdl_15_1_im,  -- sfix16_En14
              softReset => softReset,
              dinXTwdl_re => dinXTwdl_re,  -- sfix31_En15
              dinXTwdl_im => dinXTwdl_im,  -- sfix31_En15
              dinXTwdl_15_1_vld => dinXTwdl_15_1_vld_1
              );

  u_SDFCOMMUTATOR_15 : SpectrumAnalyserCustom_src_SDFCommutator15_block
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              din_15_vld_dly => din_15_vld_dly,
              xf_re => std_logic_vector(xf_re),  -- sfix31_En15
              xf_im => std_logic_vector(xf_im),  -- sfix31_En15
              xf_vld => xf_vld,
              dinXTwdlf_re => std_logic_vector(dinXTwdlf_re),  -- sfix31_En15
              dinXTwdlf_im => std_logic_vector(dinXTwdlf_im),  -- sfix31_En15
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix31_En15
              btf1_im => std_logic_vector(btf1_im),  -- sfix31_En15
              btf2_re => std_logic_vector(btf2_re),  -- sfix31_En15
              btf2_im => std_logic_vector(btf2_im),  -- sfix31_En15
              btf_vld => btf_vld,
              softReset => softReset,
              wrData_re => wrData_re,  -- sfix31_En15
              wrData_im => wrData_im,  -- sfix31_En15
              wrAddr => wrAddr,  -- ufix1
              wrEnb => wrEnb,
              dout_15_1_re => dout_15_1_re_tmp,  -- sfix31_En15
              dout_15_1_im => dout_15_1_im_tmp,  -- sfix31_En15
              dout_15_1_vld => dout_15_1_vld
              );

  din_15_1_re_dly_signed <= signed(din_15_1_re_dly);

  din_re <= resize(din_15_1_re_dly_signed, 31);

  din_15_1_im_dly_signed <= signed(din_15_1_im_dly);

  din_im <= resize(din_15_1_im_dly_signed, 31);

  dinXTwdl_re_signed <= signed(dinXTwdl_re);

  dinXTwdl_im_signed <= signed(dinXTwdl_im);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        x_vld <= rd_15_Enb;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  wrData_im_signed <= signed(wrData_im);

  wrData_re_signed <= signed(wrData_re);

  -- twoLocationReg_0
  twoLocationReg_0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      twoLocationReg_0_MEM_re_0 <= to_signed(16#00000000#, 31);
      twoLocationReg_0_MEM_im_0 <= to_signed(16#00000000#, 31);
      twoLocationReg_0_MEM_re_1 <= to_signed(16#00000000#, 31);
      twoLocationReg_0_MEM_im_1 <= to_signed(16#00000000#, 31);
      twoLocationReg_0_dout_re_reg <= to_signed(16#00000000#, 31);
      twoLocationReg_0_dout_im_reg <= to_signed(16#00000000#, 31);
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

  twoLocationReg_0_output : PROCESS (rd_15_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
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
    IF rd_15_Addr = '1' THEN 
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


  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG1_btf1_re_reg <= to_signed(0, 32);
      Radix22ButterflyG1_btf1_im_reg <= to_signed(0, 32);
      Radix22ButterflyG1_btf2_re_reg <= to_signed(0, 32);
      Radix22ButterflyG1_btf2_im_reg <= to_signed(0, 32);
      Radix22ButterflyG1_x_re_dly1 <= to_signed(16#00000000#, 31);
      Radix22ButterflyG1_x_im_dly1 <= to_signed(16#00000000#, 31);
      Radix22ButterflyG1_x_vld_dly1 <= '0';
      xf_re <= to_signed(16#00000000#, 31);
      xf_im <= to_signed(16#00000000#, 31);
      xf_vld <= '0';
      Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#00000000#, 31);
      Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#00000000#, 31);
      Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#00000000#, 31);
      Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#00000000#, 31);
      Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
      Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
      btf_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
        Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
        Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
        Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
        xf_re <= Radix22ButterflyG1_x_re_dly1;
        xf_im <= Radix22ButterflyG1_x_im_dly1;
        xf_vld <= Radix22ButterflyG1_x_vld_dly1;
        btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re_signed;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im_signed;
        Radix22ButterflyG1_x_re_dly1 <= x_re;
        Radix22ButterflyG1_x_im_dly1 <= x_im;
        Radix22ButterflyG1_x_vld_dly1 <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_15_enb AND dinXTwdl_15_1_vld_1;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_15_enb) AND dinXTwdl_15_1_vld_1;
  Radix22ButterflyG1_add_cast <= resize(Radix22ButterflyG1_x_re_dly1, 32);
  Radix22ButterflyG1_add_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 32);
  Radix22ButterflyG1_btf1_re_reg_next <= Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  Radix22ButterflyG1_sub_cast <= resize(Radix22ButterflyG1_x_re_dly1, 32);
  Radix22ButterflyG1_sub_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 32);
  Radix22ButterflyG1_btf2_re_reg_next <= Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  Radix22ButterflyG1_add_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 32);
  Radix22ButterflyG1_add_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 32);
  Radix22ButterflyG1_btf1_im_reg_next <= Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  Radix22ButterflyG1_sub_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 32);
  Radix22ButterflyG1_sub_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 32);
  Radix22ButterflyG1_btf2_im_reg_next <= Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  dinXTwdlf_re <= dinXTwdl_re_signed;
  dinXTwdlf_im <= dinXTwdl_im_signed;
  btf1_re <= Radix22ButterflyG1_btf1_re_reg(30 DOWNTO 0);
  btf1_im <= Radix22ButterflyG1_btf1_im_reg(30 DOWNTO 0);
  btf2_re <= Radix22ButterflyG1_btf2_re_reg(30 DOWNTO 0);
  btf2_im <= Radix22ButterflyG1_btf2_im_reg(30 DOWNTO 0);

  dout_15_1_re <= dout_15_1_re_tmp;

  dout_15_1_im <= dout_15_1_im_tmp;

  dinXTwdl_15_1_vld <= dinXTwdl_15_1_vld_1;

END rtl;

