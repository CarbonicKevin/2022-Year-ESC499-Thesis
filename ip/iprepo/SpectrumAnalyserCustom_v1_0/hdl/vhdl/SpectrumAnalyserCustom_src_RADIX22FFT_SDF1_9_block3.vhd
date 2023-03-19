-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_9_block3.vhd
-- Created: 2023-03-18 17:41:47
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_9_block3
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/FFT and Spectrum Processing/FFT 
-- Core/FFT HDL Optimized 4096/RADIX22FFT_SDF1_
-- Hierarchy Level: 6
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_9_block3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        din_9_1_re_dly                    :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En15
        din_9_1_im_dly                    :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En15
        din_9_vld_dly                     :   IN    std_logic;
        rd_9_Addr                         :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        rd_9_Enb                          :   IN    std_logic;
        twdl_9_1_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_9_1_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        twdl_9_1_vld                      :   IN    std_logic;
        proc_9_enb                        :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dout_9_1_re                       :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
        dout_9_1_im                       :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
        dout_9_1_vld                      :   OUT   std_logic;
        dinXTwdl_9_1_vld                  :   OUT   std_logic
        );
END SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_9_block3;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_RADIX22FFT_SDF1_9_block3 IS

  -- Component Declarations
  COMPONENT SpectrumAnalyserCustom_src_Complex4Multiply_block30
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          din_re                          :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          din_im                          :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          din_9_vld_dly                   :   IN    std_logic;
          twdl_9_1_re                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          twdl_9_1_im                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          softReset                       :   IN    std_logic;
          dinXTwdl_re                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          dinXTwdl_im                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          dinXTwdl_9_1_vld                :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_SDFCommutator9_block3
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          din_9_vld_dly                   :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          xf_im                           :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          dinXTwdlf_im                    :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          btf1_im                         :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          btf2_re                         :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          btf2_im                         :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          btf_vld                         :   IN    std_logic;
          softReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          wrData_im                       :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          wrAddr                          :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix3
          wrEnb                           :   OUT   std_logic;
          dout_9_1_re                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          dout_9_1_im                     :   OUT   std_logic_vector(24 DOWNTO 0);  -- sfix25_En15
          dout_9_1_vld                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyserCustom_src_Complex4Multiply_block30
    USE ENTITY work.SpectrumAnalyserCustom_src_Complex4Multiply_block30(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_SimpleDualPortRAM_generic
    USE ENTITY work.SpectrumAnalyserCustom_src_SimpleDualPortRAM_generic(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_SDFCommutator9_block3
    USE ENTITY work.SpectrumAnalyserCustom_src_SDFCommutator9_block3(rtl);

  -- Signals
  SIGNAL din_9_1_re_dly_signed            : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL din_re                           : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL din_9_1_im_dly_signed            : signed(23 DOWNTO 0);  -- sfix24_En15
  SIGNAL din_im                           : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL dinXTwdl_re                      : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL dinXTwdl_im                      : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL dinXTwdl_9_1_vld_1               : std_logic;
  SIGNAL dinXTwdl_re_signed               : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL dinXTwdl_im_signed               : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL x_vld                            : std_logic;
  SIGNAL btf2_im                          : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL btf2_re                          : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL btf1_im                          : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL btf1_re                          : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL dinXTwdlf_im                     : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL dinXTwdlf_re                     : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL xf_im                            : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL wrData_im                        : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL wrAddr                           : std_logic_vector(2 DOWNTO 0);  -- ufix3
  SIGNAL wrEnb                            : std_logic;
  SIGNAL x_im                             : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL x_im_signed                      : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL wrData_re                        : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL x_re                             : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL x_re_signed                      : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL Radix22ButterflyG1_x_re_dly1     : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_x_im_dly1     : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_x_vld_dly1    : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL Radix22ButterflyG1_btf1_re_reg_next : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_btf1_im_reg_next : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_btf2_re_reg_next : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_btf2_im_reg_next : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_add_cast      : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_add_cast_1    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_sub_cast      : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_sub_cast_1    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_add_cast_2    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_add_cast_3    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_sub_cast_2    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL Radix22ButterflyG1_sub_cast_3    : signed(25 DOWNTO 0);  -- sfix26_En15
  SIGNAL xf_re                            : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf_vld                          : std_logic;
  SIGNAL dout_9_1_re_tmp                  : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL dout_9_1_im_tmp                  : std_logic_vector(24 DOWNTO 0);  -- ufix25

BEGIN
  u_MUL4 : SpectrumAnalyserCustom_src_Complex4Multiply_block30
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              din_re => std_logic_vector(din_re),  -- sfix25_En15
              din_im => std_logic_vector(din_im),  -- sfix25_En15
              din_9_vld_dly => din_9_vld_dly,
              twdl_9_1_re => twdl_9_1_re,  -- sfix16_En14
              twdl_9_1_im => twdl_9_1_im,  -- sfix16_En14
              softReset => softReset,
              dinXTwdl_re => dinXTwdl_re,  -- sfix25_En15
              dinXTwdl_im => dinXTwdl_im,  -- sfix25_En15
              dinXTwdl_9_1_vld => dinXTwdl_9_1_vld_1
              );

  u_dataMEM_im_0_9 : SpectrumAnalyserCustom_src_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 3,
                 DataWidth => 25
                 )
    PORT MAP( clk => clk,
              enb_1_16_0 => enb_1_16_0,
              wr_din => wrData_im,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_9_Addr,
              rd_dout => x_im
              );

  u_dataMEM_re_0_9 : SpectrumAnalyserCustom_src_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 3,
                 DataWidth => 25
                 )
    PORT MAP( clk => clk,
              enb_1_16_0 => enb_1_16_0,
              wr_din => wrData_re,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_9_Addr,
              rd_dout => x_re
              );

  u_SDFCOMMUTATOR_9 : SpectrumAnalyserCustom_src_SDFCommutator9_block3
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              din_9_vld_dly => din_9_vld_dly,
              xf_re => std_logic_vector(xf_re),  -- sfix25_En15
              xf_im => std_logic_vector(xf_im),  -- sfix25_En15
              xf_vld => xf_vld,
              dinXTwdlf_re => std_logic_vector(dinXTwdlf_re),  -- sfix25_En15
              dinXTwdlf_im => std_logic_vector(dinXTwdlf_im),  -- sfix25_En15
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix25_En15
              btf1_im => std_logic_vector(btf1_im),  -- sfix25_En15
              btf2_re => std_logic_vector(btf2_re),  -- sfix25_En15
              btf2_im => std_logic_vector(btf2_im),  -- sfix25_En15
              btf_vld => btf_vld,
              softReset => softReset,
              wrData_re => wrData_re,  -- sfix25_En15
              wrData_im => wrData_im,  -- sfix25_En15
              wrAddr => wrAddr,  -- ufix3
              wrEnb => wrEnb,
              dout_9_1_re => dout_9_1_re_tmp,  -- sfix25_En15
              dout_9_1_im => dout_9_1_im_tmp,  -- sfix25_En15
              dout_9_1_vld => dout_9_1_vld
              );

  din_9_1_re_dly_signed <= signed(din_9_1_re_dly);

  din_re <= resize(din_9_1_re_dly_signed, 25);

  din_9_1_im_dly_signed <= signed(din_9_1_im_dly);

  din_im <= resize(din_9_1_im_dly_signed, 25);

  dinXTwdl_re_signed <= signed(dinXTwdl_re);

  dinXTwdl_im_signed <= signed(dinXTwdl_im);

  intdelay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      x_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        x_vld <= rd_9_Enb;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  x_im_signed <= signed(x_im);

  x_re_signed <= signed(x_re);

  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Radix22ButterflyG1_btf1_re_reg <= to_signed(16#0000000#, 26);
      Radix22ButterflyG1_btf1_im_reg <= to_signed(16#0000000#, 26);
      Radix22ButterflyG1_btf2_re_reg <= to_signed(16#0000000#, 26);
      Radix22ButterflyG1_btf2_im_reg <= to_signed(16#0000000#, 26);
      Radix22ButterflyG1_x_re_dly1 <= to_signed(16#0000000#, 25);
      Radix22ButterflyG1_x_im_dly1 <= to_signed(16#0000000#, 25);
      Radix22ButterflyG1_x_vld_dly1 <= '0';
      xf_re <= to_signed(16#0000000#, 25);
      xf_im <= to_signed(16#0000000#, 25);
      xf_vld <= '0';
      Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#0000000#, 25);
      Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#0000000#, 25);
      Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#0000000#, 25);
      Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#0000000#, 25);
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
        Radix22ButterflyG1_x_re_dly1 <= x_re_signed;
        Radix22ButterflyG1_x_im_dly1 <= x_im_signed;
        Radix22ButterflyG1_x_vld_dly1 <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_9_enb AND dinXTwdl_9_1_vld_1;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_9_enb) AND dinXTwdl_9_1_vld_1;
  Radix22ButterflyG1_add_cast <= resize(Radix22ButterflyG1_x_re_dly1, 26);
  Radix22ButterflyG1_add_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 26);
  Radix22ButterflyG1_btf1_re_reg_next <= Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  Radix22ButterflyG1_sub_cast <= resize(Radix22ButterflyG1_x_re_dly1, 26);
  Radix22ButterflyG1_sub_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 26);
  Radix22ButterflyG1_btf2_re_reg_next <= Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  Radix22ButterflyG1_add_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 26);
  Radix22ButterflyG1_add_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 26);
  Radix22ButterflyG1_btf1_im_reg_next <= Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  Radix22ButterflyG1_sub_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 26);
  Radix22ButterflyG1_sub_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 26);
  Radix22ButterflyG1_btf2_im_reg_next <= Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  dinXTwdlf_re <= dinXTwdl_re_signed;
  dinXTwdlf_im <= dinXTwdl_im_signed;
  btf1_re <= Radix22ButterflyG1_btf1_re_reg(24 DOWNTO 0);
  btf1_im <= Radix22ButterflyG1_btf1_im_reg(24 DOWNTO 0);
  btf2_re <= Radix22ButterflyG1_btf2_re_reg(24 DOWNTO 0);
  btf2_im <= Radix22ButterflyG1_btf2_im_reg(24 DOWNTO 0);

  dout_9_1_re <= dout_9_1_re_tmp;

  dout_9_1_im <= dout_9_1_im_tmp;

  dinXTwdl_9_1_vld <= dinXTwdl_9_1_vld_1;

END rtl;

