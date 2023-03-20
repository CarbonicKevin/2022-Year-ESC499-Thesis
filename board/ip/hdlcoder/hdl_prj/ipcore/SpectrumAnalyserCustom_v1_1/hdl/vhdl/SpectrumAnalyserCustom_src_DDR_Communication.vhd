-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_DDR_Communication.vhd
-- Created: 2023-03-18 22:56:27
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_DDR_Communication
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Direct Memory Access/Direct Memory Access/DDR 
-- Communicatio
-- Hierarchy Level: 4
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_DDR_Communication IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Length                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Count                             :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_1                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_2                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Buffer_Address_3                  :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Enable                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Valid_Out                         :   IN    std_logic;
        Data_Out                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Start_In                          :   IN    std_logic;
        wr_ready_wr_ready                 :   IN    std_logic;
        wr_ready_wr_complete              :   IN    std_logic;
        Buffer_Pointer                    :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        wr_data                           :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        wr_m2s_wr_addr                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        wr_m2s_wr_len                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        wr_m2s_wr_valid                   :   OUT   std_logic;
        DMA_Status                        :   OUT   std_logic_vector(5 DOWNTO 0)  -- ufix6
        );
END SpectrumAnalyserCustom_src_DDR_Communication;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_DDR_Communication IS

  -- Component Declarations
  COMPONENT SpectrumAnalyserCustom_src_HDL_FIFO
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          Empty                           :   OUT   std_logic;
          Full                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyserCustom_src_Write_Controller
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          valid                           :   IN    std_logic;
          count                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          length                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          enable                          :   IN    std_logic;
          start                           :   IN    std_logic;
          wr_complete                     :   IN    std_logic;
          wr_ready                        :   IN    std_logic;
          empty                           :   IN    std_logic;
          push                            :   OUT   std_logic;
          pop                             :   OUT   std_logic;
          wr_len                          :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          buffer_rsvd                     :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          state                           :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyserCustom_src_HDL_FIFO
    USE ENTITY work.SpectrumAnalyserCustom_src_HDL_FIFO(rtl);

  FOR ALL : SpectrumAnalyserCustom_src_Write_Controller
    USE ENTITY work.SpectrumAnalyserCustom_src_Write_Controller(rtl);

  -- Signals
  SIGNAL Enable_unsigned                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Enable_DMA_out1                  : std_logic;  -- ufix1
  SIGNAL Cast_To_Boolean_out1             : std_logic;
  SIGNAL wr_complete                      : std_logic;
  SIGNAL wr_ready                         : std_logic;
  SIGNAL HDL_FIFO_out2                    : std_logic;
  SIGNAL NOT_out1                         : std_logic;
  SIGNAL pop                              : std_logic;
  SIGNAL wr_valid                         : std_logic;
  SIGNAL push                             : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL wr_data_tmp                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL HDL_FIFO_out3                    : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL wr_len                           : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL buffer_rsvd                      : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL state                            : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL buffer_unsigned                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Buffer_Address_2_unsigned        : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Buffer_Address_3_unsigned        : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Buffer_Address_1_unsigned        : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL wr_addr                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL wr_addr_1                        : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL wr_len_unsigned                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL wr_len_1                         : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL wr_valid_1                       : std_logic;
  SIGNAL state_unsigned                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL dma_status_1                     : unsigned(5 DOWNTO 0);  -- ufix6

BEGIN
  u_HDL_FIFO : SpectrumAnalyserCustom_src_HDL_FIFO
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              In_rsvd => Data_Out,  -- uint32
              Push => AND_out1,
              Pop => wr_valid,
              Out_rsvd => wr_data_tmp,  -- uint32
              Empty => HDL_FIFO_out2,
              Full => HDL_FIFO_out3
              );

  u_Write_Controller : SpectrumAnalyserCustom_src_Write_Controller
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              valid => Valid_Out,
              count => Count,  -- uint32
              length => Length,  -- uint32
              enable => Cast_To_Boolean_out1,
              start => Start_In,
              wr_complete => wr_complete,
              wr_ready => wr_ready,
              empty => Delay_out1,
              push => push,
              pop => pop,
              wr_len => wr_len,  -- uint32
              buffer_rsvd => buffer_rsvd,  -- ufix2
              state => state  -- ufix4
              );

  Enable_unsigned <= unsigned(Enable);

  Enable_DMA_out1 <= Enable_unsigned(0);

  
  Cast_To_Boolean_out1 <= '1' WHEN Enable_DMA_out1 /= '0' ELSE
      '0';

  wr_complete <= wr_ready_wr_complete;

  wr_ready <= wr_ready_wr_ready;

  NOT_out1 <=  NOT HDL_FIFO_out2;

  wr_valid <= pop AND NOT_out1;

  AND_out1 <= Valid_Out AND push;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay_out1 <= HDL_FIFO_out2;
      END IF;
    END IF;
  END PROCESS Delay_process;


  buffer_unsigned <= unsigned(buffer_rsvd);

  Buffer_Address_2_unsigned <= unsigned(Buffer_Address_2);

  Buffer_Address_3_unsigned <= unsigned(Buffer_Address_3);

  Buffer_Address_1_unsigned <= unsigned(Buffer_Address_1);

  
  wr_addr <= Buffer_Address_2_unsigned WHEN buffer_unsigned = to_unsigned(16#0#, 2) ELSE
      Buffer_Address_3_unsigned WHEN buffer_unsigned = to_unsigned(16#1#, 2) ELSE
      Buffer_Address_1_unsigned;

  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      wr_addr_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        wr_addr_1 <= wr_addr;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  wr_m2s_wr_addr <= std_logic_vector(wr_addr_1);

  wr_len_unsigned <= unsigned(wr_len);

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      wr_len_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        wr_len_1 <= wr_len_unsigned;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  wr_m2s_wr_len <= std_logic_vector(wr_len_1);

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      wr_valid_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        wr_valid_1 <= wr_valid;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  wr_m2s_wr_valid <= wr_valid_1;

  state_unsigned <= unsigned(state);

  dma_status_1 <= HDL_FIFO_out2 & HDL_FIFO_out3 & state_unsigned;

  DMA_Status <= std_logic_vector(dma_status_1);

  Buffer_Pointer <= buffer_rsvd;

  wr_data <= wr_data_tmp;

END rtl;

