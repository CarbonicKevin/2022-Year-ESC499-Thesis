-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser8192_src_Direct_Memory_Access_block.vhd
-- Created: 2023-04-02 00:06:45
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser8192_src_Direct_Memory_Access_block
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Direct Memory Access
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser8192_src_Direct_Memory_Access_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Length                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_1                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_2                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_3                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Enable                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Count                             :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        s_axis_tvalid                     :   IN    std_logic;
        s_axis_tdata                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        s_axis_tuser                      :   IN    std_logic;
        axim_wr_s2m_wr_ready              :   IN    std_logic;
        axim_wr_s2m_wr_complete           :   IN    std_logic;
        Buffer_Pointer                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        DMA_Status                        :   OUT   std_logic_vector(5 DOWNTO 0);  -- ufix6
        axim_wr_m2s_wr_addr               :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        axim_wr_m2s_wr_len                :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        axim_wr_m2s_wr_valid              :   OUT   std_logic;
        axim_wr_data                      :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
        );
END SpectrumAnalyser8192_src_Direct_Memory_Access_block;


ARCHITECTURE rtl OF SpectrumAnalyser8192_src_Direct_Memory_Access_block IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser8192_src_Direct_Memory_Access
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          Length                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Count                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Buffer_Address_1                :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Buffer_Address_2                :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Buffer_Address_3                :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Enable_DMA                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Valid_In                        :   IN    std_logic;
          Data_In                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Start_In                        :   IN    std_logic;
          wr_ready_wr_ready               :   IN    std_logic;
          wr_ready_wr_complete            :   IN    std_logic;
          wr_data                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          wr_m2s_wr_addr                  :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          wr_m2s_wr_len                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          wr_m2s_wr_valid                 :   OUT   std_logic;
          Buffer_Pointer                  :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          DMA_Status                      :   OUT   std_logic_vector(5 DOWNTO 0)  -- ufix6
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser8192_src_Direct_Memory_Access
    USE ENTITY work.SpectrumAnalyser8192_src_Direct_Memory_Access(rtl);

  -- Signals
  SIGNAL Direct_Memory_Access_out1        : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Direct_Memory_Access_out2_wr_addr : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Direct_Memory_Access_out2_wr_len : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Direct_Memory_Access_out2_wr_valid : std_logic;
  SIGNAL buffer_rsvd                      : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL y                                : std_logic_vector(5 DOWNTO 0);  -- ufix6

BEGIN
  u_Direct_Memory_Access : SpectrumAnalyser8192_src_Direct_Memory_Access
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              Length => Length,  -- uint32
              Count => Count,  -- uint32
              Buffer_Address_1 => Buffer_Address_1,  -- uint32
              Buffer_Address_2 => Buffer_Address_2,  -- uint32
              Buffer_Address_3 => Buffer_Address_3,  -- uint32
              Enable_DMA => Enable,  -- uint32
              Valid_In => s_axis_tvalid,
              Data_In => s_axis_tdata,  -- uint32
              Start_In => s_axis_tuser,
              wr_ready_wr_ready => axim_wr_s2m_wr_ready,
              wr_ready_wr_complete => axim_wr_s2m_wr_complete,
              wr_data => Direct_Memory_Access_out1,  -- uint32
              wr_m2s_wr_addr => Direct_Memory_Access_out2_wr_addr,  -- uint32
              wr_m2s_wr_len => Direct_Memory_Access_out2_wr_len,  -- uint32
              wr_m2s_wr_valid => Direct_Memory_Access_out2_wr_valid,
              Buffer_Pointer => buffer_rsvd,  -- ufix2
              DMA_Status => y  -- ufix6
              );

  axim_wr_m2s_wr_valid <= Direct_Memory_Access_out2_wr_valid;

  Buffer_Pointer <= buffer_rsvd;

  DMA_Status <= y;

  axim_wr_m2s_wr_addr <= Direct_Memory_Access_out2_wr_addr;

  axim_wr_m2s_wr_len <= Direct_Memory_Access_out2_wr_len;

  axim_wr_data <= Direct_Memory_Access_out1;

END rtl;

