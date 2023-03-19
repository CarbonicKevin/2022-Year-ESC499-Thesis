-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_transmitter\mw_transmitter_addr_decoder.vhd
-- Created: 2020-12-16 17:01:21
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_transmitter_addr_decoder
-- Source Path: mw_transmitter/mw_transmitter_axi_lite/mw_transmitter_addr_decoder
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_transmitter_addr_decoder IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_write                        :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        addr_sel                          :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14
        wr_enb                            :   IN    std_logic;  -- ufix1
        rd_enb                            :   IN    std_logic;  -- ufix1
        read_ip_timestamp                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        data_read                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_packet_size_axi4_stream_master :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        write_Enable                      :   OUT   std_logic;  -- ufix1
        write_Value                       :   OUT   std_logic_vector(31 DOWNTO 0)  -- ufix32
        );
END mw_transmitter_addr_decoder;


ARCHITECTURE rtl OF mw_transmitter_addr_decoder IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL addr_sel_unsigned                : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL decode_sel_Value_1_1             : std_logic;  -- ufix1
  SIGNAL decode_sel_Enable_1_1            : std_logic;  -- ufix1
  SIGNAL decode_sel_ip_timestamp_1_1      : std_logic;  -- ufix1
  SIGNAL decode_sel_packet_size_axi4_stream_master_1_1 : std_logic;  -- ufix1
  SIGNAL const_0                          : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_packet_size_axi4_stream_master_1_1 : std_logic;  -- ufix1
  SIGNAL data_write_unsigned              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL const_1_1                        : std_logic;  -- ufix1
  SIGNAL data_reg_packet_size_axi4_stream_master_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_ip_timestamp_unsigned       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_packet_size_axi4_stream_master_1_1 : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL read_reg_ip_timestamp            : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_ip_timestamp_1_1       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Enable_1_1               : std_logic;  -- ufix1
  SIGNAL data_in_Enable                   : std_logic;  -- ufix1
  SIGNAL data_reg_Enable_1_1              : std_logic;  -- ufix1
  SIGNAL write_concats_Enable_1           : std_logic;  -- ufix1
  SIGNAL data_slice_Enable_1              : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Enable_1_1             : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reg_enb_Value_1_1                : std_logic;  -- ufix1
  SIGNAL data_reg_Value_1_1               : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL decode_rd_Value_1_1              : unsigned(31 DOWNTO 0);  -- ufix32

BEGIN
  addr_sel_unsigned <= unsigned(addr_sel);

  
  decode_sel_Value_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0041#, 14) ELSE
      '0';

  
  decode_sel_Enable_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0040#, 14) ELSE
      '0';

  
  decode_sel_ip_timestamp_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0003#, 14) ELSE
      '0';

  
  decode_sel_packet_size_axi4_stream_master_1_1 <= '1' WHEN addr_sel_unsigned = to_unsigned(16#0002#, 14) ELSE
      '0';

  const_0 <= to_unsigned(0, 32);

  reg_enb_packet_size_axi4_stream_master_1_1 <= decode_sel_packet_size_axi4_stream_master_1_1 AND wr_enb;

  data_write_unsigned <= unsigned(data_write);

  const_1_1 <= '1';

  enb <= const_1_1;

  reg_packet_size_axi4_stream_master_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_packet_size_axi4_stream_master_1_1 <= to_unsigned(1024, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_packet_size_axi4_stream_master_1_1 = '1' THEN
        data_reg_packet_size_axi4_stream_master_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_packet_size_axi4_stream_master_1_1_process;


  read_ip_timestamp_unsigned <= unsigned(read_ip_timestamp);

  
  decode_rd_packet_size_axi4_stream_master_1_1 <= const_0 WHEN decode_sel_packet_size_axi4_stream_master_1_1 = '0' ELSE
      data_reg_packet_size_axi4_stream_master_1_1;

  reg_ip_timestamp_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      read_reg_ip_timestamp <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        read_reg_ip_timestamp <= read_ip_timestamp_unsigned;
      END IF;
    END IF;
  END PROCESS reg_ip_timestamp_process;


  
  decode_rd_ip_timestamp_1_1 <= decode_rd_packet_size_axi4_stream_master_1_1 WHEN decode_sel_ip_timestamp_1_1 = '0' ELSE
      read_reg_ip_timestamp;

  reg_enb_Enable_1_1 <= decode_sel_Enable_1_1 AND wr_enb;

  data_in_Enable <= data_write_unsigned(0);

  reg_Enable_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Enable_1_1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Enable_1_1 = '1' THEN
        data_reg_Enable_1_1 <= data_in_Enable;
      END IF;
    END IF;
  END PROCESS reg_Enable_1_1_process;


  write_concats_Enable_1 <= data_reg_Enable_1_1;

  data_slice_Enable_1 <= '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & write_concats_Enable_1;

  
  decode_rd_Enable_1_1 <= decode_rd_ip_timestamp_1_1 WHEN decode_sel_Enable_1_1 = '0' ELSE
      data_slice_Enable_1;

  reg_enb_Value_1_1 <= decode_sel_Value_1_1 AND wr_enb;

  reg_Value_1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      data_reg_Value_1_1 <= to_unsigned(0, 32);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND reg_enb_Value_1_1 = '1' THEN
        data_reg_Value_1_1 <= data_write_unsigned;
      END IF;
    END IF;
  END PROCESS reg_Value_1_1_process;


  
  decode_rd_Value_1_1 <= decode_rd_Enable_1_1 WHEN decode_sel_Value_1_1 = '0' ELSE
      data_reg_Value_1_1;

  data_read <= std_logic_vector(decode_rd_Value_1_1);

  write_packet_size_axi4_stream_master <= std_logic_vector(data_reg_packet_size_axi4_stream_master_1_1);

  write_Enable <= write_concats_Enable_1;

  write_Value <= std_logic_vector(data_reg_Value_1_1);

END rtl;

