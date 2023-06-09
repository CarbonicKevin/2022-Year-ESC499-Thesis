-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\mw_transmitter\mw_transmitter_dut.vhd
-- Created: 2020-12-16 17:01:21
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: mw_transmitter_dut
-- Source Path: mw_transmitter/mw_transmitter_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY mw_transmitter_dut IS
  PORT( Enable                            :   IN    std_logic;  -- ufix1
        Value                             :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
        Valid                             :   OUT   std_logic;  -- ufix1
        Data                              :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
        );
END mw_transmitter_dut;


ARCHITECTURE rtl OF mw_transmitter_dut IS

  -- Component Declarations
  COMPONENT mw_transmitter_src_Transmitter
    PORT( Enable                          :   IN    std_logic;  -- ufix1
          Value                           :   IN    std_logic_vector(31 DOWNTO 0);  -- ufix32
          Valid                           :   OUT   std_logic;  -- ufix1
          Data                            :   OUT   std_logic_vector(127 DOWNTO 0)  -- ufix128
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : mw_transmitter_src_Transmitter
    USE ENTITY work.mw_transmitter_src_Transmitter(rtl);

  -- Signals
  SIGNAL Enable_sig                       : std_logic;  -- ufix1
  SIGNAL Valid_sig                        : std_logic;  -- ufix1
  SIGNAL Data_sig                         : std_logic_vector(127 DOWNTO 0);  -- ufix128

BEGIN
  u_mw_transmitter_src_Transmitter : mw_transmitter_src_Transmitter
    PORT MAP( Enable => Enable_sig,  -- ufix1
              Value => Value,  -- ufix32
              Valid => Valid_sig,  -- ufix1
              Data => Data_sig  -- ufix128
              );

  Enable_sig <= Enable;

  Valid <= Valid_sig;

  Data <= Data_sig;

END rtl;

