-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser8192_src_Direct_Memory_Access.vhd
-- Created: 2023-04-02 00:06:45
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser8192_src_Direct_Memory_Access
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Direct Memory Access/Direct Memory Access
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser8192_src_Direct_Memory_Access IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Length                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Count                             :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_1                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_2                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_3                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Enable_DMA                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Valid_In                          :   IN    std_logic;
        Data_In                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Start_In                          :   IN    std_logic;
        wr_ready_wr_ready                 :   IN    std_logic;
        wr_ready_wr_complete              :   IN    std_logic;
        wr_data                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        wr_m2s_wr_addr                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        wr_m2s_wr_len                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        wr_m2s_wr_valid                   :   OUT   std_logic;
        Buffer_Pointer                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        DMA_Status                        :   OUT   std_logic_vector(5 DOWNTO 0)  -- ufix6
        );
END SpectrumAnalyser8192_src_Direct_Memory_Access;


ARCHITECTURE rtl OF SpectrumAnalyser8192_src_Direct_Memory_Access IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser8192_src_DDR_Communication
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Length                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Count                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Buffer_Address_1                :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Buffer_Address_2                :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Buffer_Address_3                :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Enable                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Valid_Out                       :   IN    std_logic;
          Data_Out                        :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Start_In                        :   IN    std_logic;
          wr_ready_wr_ready               :   IN    std_logic;
          wr_ready_wr_complete            :   IN    std_logic;
          Buffer_Pointer                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          wr_data                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          wr_m2s_wr_addr                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          wr_m2s_wr_len                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          wr_m2s_wr_valid                 :   OUT   std_logic;
          DMA_Status                      :   OUT   std_logic_vector(5 DOWNTO 0)  -- ufix6
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser8192_src_DDR_Communication
    USE ENTITY work.SpectrumAnalyser8192_src_DDR_Communication(rtl);

  -- Signals
  SIGNAL buffer_rsvd                      : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL DDR_Communication_out2           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL DDR_Communication_out3_wr_addr   : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL DDR_Communication_out3_wr_len    : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL DDR_Communication_out3_wr_valid  : std_logic;
  SIGNAL y                                : std_logic_vector(5 DOWNTO 0);  -- ufix6

BEGIN
  u_DDR_Communication : SpectrumAnalyser8192_src_DDR_Communication
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Length => Length,  -- uint32
              Count => Count,  -- uint32
              Buffer_Address_1 => Buffer_Address_1,  -- uint32
              Buffer_Address_2 => Buffer_Address_2,  -- uint32
              Buffer_Address_3 => Buffer_Address_3,  -- uint32
              Enable => Enable_DMA,  -- uint32
              Valid_Out => Valid_In,
              Data_Out => Data_In,  -- uint32
              Start_In => Start_In,
              wr_ready_wr_ready => wr_ready_wr_ready,
              wr_ready_wr_complete => wr_ready_wr_complete,
              Buffer_Pointer => buffer_rsvd,  -- ufix2
              wr_data => DDR_Communication_out2,  -- uint32
              wr_m2s_wr_addr => DDR_Communication_out3_wr_addr,  -- uint32
              wr_m2s_wr_len => DDR_Communication_out3_wr_len,  -- uint32
              wr_m2s_wr_valid => DDR_Communication_out3_wr_valid,
              DMA_Status => y  -- ufix6
              );

  wr_m2s_wr_valid <= DDR_Communication_out3_wr_valid;

  wr_data <= DDR_Communication_out2;

  wr_m2s_wr_addr <= DDR_Communication_out3_wr_addr;

  wr_m2s_wr_len <= DDR_Communication_out3_wr_len;

  Buffer_Pointer <= buffer_rsvd;

  DMA_Status <= y;

END rtl;

