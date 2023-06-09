-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_transmitter\mw_transmitter.vhd
-- Created: 2020-12-16 17:01:21
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_transmitter
-- Source Path: mw_transmitter
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_transmitter IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        AXI4_Stream_Master_TREADY         :   IN    std_logic;  -- ufix1
        AXI4_Lite_ACLK                    :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARESETN                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_AWADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_AWVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_WDATA                   :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_WSTRB                   :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        AXI4_Lite_WVALID                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_BREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Lite_ARADDR                  :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        AXI4_Lite_ARVALID                 :   IN    std_logic;  -- ufix1
        AXI4_Lite_RREADY                  :   IN    std_logic;  -- ufix1
        AXI4_Stream_Master_TDATA          :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
        AXI4_Stream_Master_TVALID         :   OUT   std_logic;  -- ufix1
        AXI4_Stream_Master_TLAST          :   OUT   std_logic;  -- ufix1
        AXI4_Lite_AWREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_WREADY                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_BRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_BVALID                  :   OUT   std_logic;  -- ufix1
        AXI4_Lite_ARREADY                 :   OUT   std_logic;  -- ufix1
        AXI4_Lite_RDATA                   :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        AXI4_Lite_RRESP                   :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        AXI4_Lite_RVALID                  :   OUT   std_logic  -- ufix1
        );
END mw_transmitter;


ARCHITECTURE rtl OF mw_transmitter IS

  -- Component Declarations
  COMPONENT mw_transmitter_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT mw_transmitter_axi_lite
    PORT( reset                           :   IN    std_logic;
          AXI4_Lite_ACLK                  :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARESETN               :   IN    std_logic;  -- ufix1
          AXI4_Lite_AWADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_AWVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_WDATA                 :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_WSTRB                 :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          AXI4_Lite_WVALID                :   IN    std_logic;  -- ufix1
          AXI4_Lite_BREADY                :   IN    std_logic;  -- ufix1
          AXI4_Lite_ARADDR                :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
          AXI4_Lite_ARVALID               :   IN    std_logic;  -- ufix1
          AXI4_Lite_RREADY                :   IN    std_logic;  -- ufix1
          read_ip_timestamp               :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_AWREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_WREADY                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_BRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_BVALID                :   OUT   std_logic;  -- ufix1
          AXI4_Lite_ARREADY               :   OUT   std_logic;  -- ufix1
          AXI4_Lite_RDATA                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Lite_RRESP                 :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          AXI4_Lite_RVALID                :   OUT   std_logic;  -- ufix1
          write_packet_size_axi4_stream_master :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          write_Enable                    :   OUT   std_logic;  -- ufix1
          write_Value                     :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          reset_internal                  :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  COMPONENT mw_transmitter_dut
    PORT( Enable                          :   IN    std_logic;  -- ufix1
          Value                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Valid                           :   OUT   std_logic;  -- ufix1
          Data                            :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
          );
  END COMPONENT;

  COMPONENT mw_transmitter_axi4_stream_master
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset                           :   IN    std_logic;
          enb                             :   IN    std_logic;
          AXI4_Stream_Master_TREADY       :   IN    std_logic;  -- ufix1
          user_data                       :   IN    std_logic_vector(127 DOWNTO 0);  -- ufix128
          user_valid                      :   IN    std_logic;  -- ufix1
          write_packet_size_axi4_stream_master :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          AXI4_Stream_Master_TDATA        :   OUT   std_logic_vector(127 DOWNTO 0);  -- ufix128
          AXI4_Stream_Master_TVALID       :   OUT   std_logic;  -- ufix1
          AXI4_Stream_Master_TLAST        :   OUT   std_logic;  -- ufix1
          auto_ready                      :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : mw_transmitter_reset_sync
    USE ENTITY work.mw_transmitter_reset_sync(rtl);

  FOR ALL : mw_transmitter_axi_lite
    USE ENTITY work.mw_transmitter_axi_lite(rtl);

  FOR ALL : mw_transmitter_dut
    USE ENTITY work.mw_transmitter_dut(rtl);

  FOR ALL : mw_transmitter_axi4_stream_master
    USE ENTITY work.mw_transmitter_axi4_stream_master(rtl);

  -- Signals
  SIGNAL reset                            : std_logic;
  SIGNAL ip_timestamp                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL reset_internal                   : std_logic;  -- ufix1
  SIGNAL reset_before_sync                : std_logic;  -- ufix1
  SIGNAL AXI4_Lite_BRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL AXI4_Lite_RDATA_tmp              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL AXI4_Lite_RRESP_tmp              : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL write_packet_size_axi4_stream_master : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL write_Enable                     : std_logic;  -- ufix1
  SIGNAL write_Value                      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Valid_sig                        : std_logic;  -- ufix1
  SIGNAL Data_sig                         : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL const_1_1                        : std_logic;  -- ufix1
  SIGNAL AXI4_Stream_Master_TDATA_tmp     : std_logic_vector(127 DOWNTO 0);  -- ufix128
  SIGNAL auto_ready_axi4_stream_master    : std_logic;  -- ufix1

BEGIN
  u_mw_transmitter_reset_sync_inst : mw_transmitter_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_before_sync,  -- ufix1
              reset_out => reset
              );

  u_mw_transmitter_axi_lite_inst : mw_transmitter_axi_lite
    PORT MAP( reset => reset,
              AXI4_Lite_ACLK => AXI4_Lite_ACLK,  -- ufix1
              AXI4_Lite_ARESETN => AXI4_Lite_ARESETN,  -- ufix1
              AXI4_Lite_AWADDR => AXI4_Lite_AWADDR,  -- ufix16
              AXI4_Lite_AWVALID => AXI4_Lite_AWVALID,  -- ufix1
              AXI4_Lite_WDATA => AXI4_Lite_WDATA,  -- ufix32
              AXI4_Lite_WSTRB => AXI4_Lite_WSTRB,  -- ufix4
              AXI4_Lite_WVALID => AXI4_Lite_WVALID,  -- ufix1
              AXI4_Lite_BREADY => AXI4_Lite_BREADY,  -- ufix1
              AXI4_Lite_ARADDR => AXI4_Lite_ARADDR,  -- ufix16
              AXI4_Lite_ARVALID => AXI4_Lite_ARVALID,  -- ufix1
              AXI4_Lite_RREADY => AXI4_Lite_RREADY,  -- ufix1
              read_ip_timestamp => std_logic_vector(ip_timestamp),  -- ufix32
              AXI4_Lite_AWREADY => AXI4_Lite_AWREADY,  -- ufix1
              AXI4_Lite_WREADY => AXI4_Lite_WREADY,  -- ufix1
              AXI4_Lite_BRESP => AXI4_Lite_BRESP_tmp,  -- ufix2
              AXI4_Lite_BVALID => AXI4_Lite_BVALID,  -- ufix1
              AXI4_Lite_ARREADY => AXI4_Lite_ARREADY,  -- ufix1
              AXI4_Lite_RDATA => AXI4_Lite_RDATA_tmp,  -- ufix32
              AXI4_Lite_RRESP => AXI4_Lite_RRESP_tmp,  -- ufix2
              AXI4_Lite_RVALID => AXI4_Lite_RVALID,  -- ufix1
              write_packet_size_axi4_stream_master => write_packet_size_axi4_stream_master,  -- ufix32
              write_Enable => write_Enable,  -- ufix1
              write_Value => write_Value,  -- ufix32
              reset_internal => reset_internal  -- ufix1
              );

  u_mw_transmitter_dut_inst : mw_transmitter_dut
    PORT MAP( Enable => write_Enable,  -- ufix1
              Value => write_Value,  -- ufix32
              Valid => Valid_sig,  -- ufix1
              Data => Data_sig  -- ufix128
              );

  u_mw_transmitter_axi4_stream_master_inst : mw_transmitter_axi4_stream_master
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset => reset,
              enb => const_1_1,
              AXI4_Stream_Master_TREADY => AXI4_Stream_Master_TREADY,  -- ufix1
              user_data => Data_sig,  -- ufix128
              user_valid => Valid_sig,  -- ufix1
              write_packet_size_axi4_stream_master => write_packet_size_axi4_stream_master,  -- ufix32
              AXI4_Stream_Master_TDATA => AXI4_Stream_Master_TDATA_tmp,  -- ufix128
              AXI4_Stream_Master_TVALID => AXI4_Stream_Master_TVALID,  -- ufix1
              AXI4_Stream_Master_TLAST => AXI4_Stream_Master_TLAST,  -- ufix1
              auto_ready => auto_ready_axi4_stream_master  -- ufix1
              );

  ip_timestamp <= to_unsigned(2012161701, 32);

  reset_cm <=  NOT IPCORE_RESETN;

  reset_before_sync <= reset_cm OR reset_internal;

  const_1_1 <= '1';

  AXI4_Stream_Master_TDATA <= AXI4_Stream_Master_TDATA_tmp;

  AXI4_Lite_BRESP <= AXI4_Lite_BRESP_tmp;

  AXI4_Lite_RDATA <= AXI4_Lite_RDATA_tmp;

  AXI4_Lite_RRESP <= AXI4_Lite_RRESP_tmp;

END rtl;

