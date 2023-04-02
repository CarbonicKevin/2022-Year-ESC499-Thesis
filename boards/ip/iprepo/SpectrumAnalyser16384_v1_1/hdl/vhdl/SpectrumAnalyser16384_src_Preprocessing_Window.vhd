-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyser16384_src_Preprocessing_Window.vhd
-- Created: 2023-04-02 00:02:12
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyser16384_src_Preprocessing_Window
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Spectrum Analyser Core/Preprocessing Window
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyser16384_src_Preprocessing_Window IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        Length                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Address                           :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Enable                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        Valid_Real_In                     :   IN    std_logic;
        Data_Real_In                      :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Last_Real_In                      :   IN    std_logic;
        User_Real_In                      :   IN    std_logic;
        Valid_Imag_In                     :   IN    std_logic;
        Data_Imag_In                      :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        Last_Imag_In                      :   IN    std_logic;
        User_Imag_In                      :   IN    std_logic;
        rd_s2m_rd_aready                  :   IN    std_logic;
        rd_s2m_rd_dvalid                  :   IN    std_logic;
        rd_data                           :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        dma_ready                         :   OUT   std_logic;
        Valid_Real_Out                    :   OUT   std_logic;
        Data_Real_Out                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        Last_Real_Out                     :   OUT   std_logic;
        User_Real_Out                     :   OUT   std_logic;
        Valid_Imag_Out                    :   OUT   std_logic;
        Data_Imag_Out                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        Last_Imag_Out                     :   OUT   std_logic;
        User_Imag_Out                     :   OUT   std_logic;
        rd_m2s_rd_addr                    :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        rd_m2s_rd_len                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        rd_m2s_rd_avalid                  :   OUT   std_logic
        );
END SpectrumAnalyser16384_src_Preprocessing_Window;


ARCHITECTURE rtl OF SpectrumAnalyser16384_src_Preprocessing_Window IS

  -- Component Declarations
  COMPONENT SpectrumAnalyser16384_src_Direct_Memory_Access_block1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          axim_rd_s2m_rd_aready           :   IN    std_logic;
          axim_rd_s2m_rd_dvalid           :   IN    std_logic;
          axim_rd_data                    :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          Length                          :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Address                         :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          Enable_DMA                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          ram_wr_data                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          ram_wr_addr                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          ram_wren                        :   OUT   std_logic;
          dma_read_ready                  :   OUT   std_logic;
          axim_rd_m2s_rd_addr             :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          axim_rd_m2s_rd_len              :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          axim_rd_m2s_rd_avalid           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT SpectrumAnalyser16384_src_DualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_16_0                      :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SpectrumAnalyser16384_src_Direct_Memory_Access_block1
    USE ENTITY work.SpectrumAnalyser16384_src_Direct_Memory_Access_block1(rtl);

  FOR ALL : SpectrumAnalyser16384_src_DualPortRAM_generic
    USE ENTITY work.SpectrumAnalyser16384_src_DualPortRAM_generic(rtl);

  -- Signals
  SIGNAL Direct_Memory_Access_out1        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL count_out                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL valid_out                        : std_logic;
  SIGNAL ready_out                        : std_logic;
  SIGNAL Direct_Memory_Access_out5_rd_addr : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Direct_Memory_Access_out5_rd_len : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Direct_Memory_Access_out5_rd_avalid : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL OR_out1                          : std_logic;
  SIGNAL OR1_out1                         : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Dual_Port_RAM_System_out1        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Dual_Port_RAM_System_out2        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Dual_Port_RAM_System_out2_unsigned : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Data_Type_Conversion2_out1       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Data_Type_Conversion2_out1_1     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Data_Real_In_unsigned            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay2_out1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Data_Type_Conversion_out1        : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Data_Type_Conversion_out1_1      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Product_out1                     : signed(31 DOWNTO 0);  -- sfix32_En29
  SIGNAL Product_out1_1                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Product_out1_2                   : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Data_Type_Conversion3_out1       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Data_Imag_In_unsigned            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay6_out1                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Data_Type_Conversion1_out1       : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Data_Type_Conversion1_out1_1     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Product1_out1                    : signed(31 DOWNTO 0);  -- sfix32_En29
  SIGNAL Product1_out1_1                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Product1_out1_2                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Data_Type_Conversion4_out1       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay5_out1                      : std_logic;
  SIGNAL Delay7_out1                      : std_logic;

  ATTRIBUTE use_dsp : string;

  ATTRIBUTE use_dsp OF Product_out1 : SIGNAL IS "yes";
  ATTRIBUTE use_dsp OF Product1_out1 : SIGNAL IS "yes";

BEGIN
  u_Direct_Memory_Access : SpectrumAnalyser16384_src_Direct_Memory_Access_block1
    PORT MAP( clk => clk,
              reset => reset,
              enb_1_16_0 => enb_1_16_0,
              axim_rd_s2m_rd_aready => rd_s2m_rd_aready,
              axim_rd_s2m_rd_dvalid => rd_s2m_rd_dvalid,
              axim_rd_data => rd_data,  -- uint16
              Length => Length,  -- uint32
              Address => Address,  -- uint32
              Enable_DMA => Enable,  -- uint32
              ram_wr_data => Direct_Memory_Access_out1,  -- uint16
              ram_wr_addr => count_out,  -- uint16
              ram_wren => valid_out,
              dma_read_ready => ready_out,
              axim_rd_m2s_rd_addr => Direct_Memory_Access_out5_rd_addr,  -- uint32
              axim_rd_m2s_rd_len => Direct_Memory_Access_out5_rd_len,  -- uint16
              axim_rd_m2s_rd_avalid => Direct_Memory_Access_out5_rd_avalid
              );

  u_Dual_Port_RAM_System : SpectrumAnalyser16384_src_DualPortRAM_generic
    GENERIC MAP( AddrWidth => 16,
                 DataWidth => 16
                 )
    PORT MAP( clk => clk,
              enb_1_16_0 => enb_1_16_0,
              wr_din => Direct_Memory_Access_out1,
              wr_addr => count_out,
              wr_en => valid_out,
              rd_addr => std_logic_vector(HDL_Counter_out1),
              wr_dout => Dual_Port_RAM_System_out1,
              rd_dout => Dual_Port_RAM_System_out2
              );

  dma_ready <= ready_out;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay_out1 <= Valid_Real_In;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Valid_Real_Out <= Delay_out1;

  OR_out1 <= Last_Real_In OR Last_Imag_In;

  OR1_out1 <= Valid_Real_In OR Valid_Imag_In;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 65535
  HDL_Counter_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        IF OR_out1 = '1' THEN 
          HDL_Counter_out1 <= to_unsigned(16#0000#, 16);
        ELSIF OR1_out1 = '1' THEN 
          HDL_Counter_out1 <= HDL_Counter_out1 + to_unsigned(16#0001#, 16);
        END IF;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Dual_Port_RAM_System_out2_unsigned <= unsigned(Dual_Port_RAM_System_out2);

  Data_Type_Conversion2_out1 <= signed(Dual_Port_RAM_System_out2_unsigned);

  reduced_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Data_Type_Conversion2_out1_1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Data_Type_Conversion2_out1_1 <= Data_Type_Conversion2_out1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  Data_Real_In_unsigned <= unsigned(Data_Real_In);

  Delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay2_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay2_out1 <= Data_Real_In_unsigned;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Data_Type_Conversion_out1 <= signed(Delay2_out1);

  Product_in_pipe1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Data_Type_Conversion_out1_1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Data_Type_Conversion_out1_1 <= Data_Type_Conversion_out1;
      END IF;
    END IF;
  END PROCESS Product_in_pipe1_process;


  Product_out1 <= Data_Type_Conversion2_out1_1 * Data_Type_Conversion_out1_1;

  
  Product_out1_1 <= X"7FFF" WHEN ((Product_out1(31) = '0') AND (Product_out1(30 DOWNTO 29) /= "00")) OR ((Product_out1(31) = '0') AND (Product_out1(29 DOWNTO 14) = X"7FFF")) ELSE
      X"8000" WHEN (Product_out1(31) = '1') AND (Product_out1(30 DOWNTO 29) /= "11") ELSE
      Product_out1(29 DOWNTO 14) + ('0' & (Product_out1(13) AND (( NOT Product_out1(31)) OR (Product_out1(12) OR Product_out1(11) OR Product_out1(10) OR Product_out1(9) OR Product_out1(8) OR Product_out1(7) OR Product_out1(6) OR Product_out1(5) OR Product_out1(4) OR Product_out1(3) OR Product_out1(2) OR Product_out1(1) OR Product_out1(0)))));

  Product_out_pipe_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product_out1_2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Product_out1_2 <= Product_out1_1;
      END IF;
    END IF;
  END PROCESS Product_out_pipe_process;


  Data_Type_Conversion3_out1 <= unsigned(Product_out1_2);

  Data_Real_Out <= std_logic_vector(Data_Type_Conversion3_out1);

  Delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay1_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay1_out1 <= Last_Real_In;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Last_Real_Out <= Delay1_out1;

  Delay3_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay3_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay3_out1 <= User_Real_In;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  User_Real_Out <= Delay3_out1;

  Delay4_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay4_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay4_out1 <= Valid_Imag_In;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Valid_Imag_Out <= Delay4_out1;

  Data_Imag_In_unsigned <= unsigned(Data_Imag_In);

  Delay6_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay6_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay6_out1 <= Data_Imag_In_unsigned;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Data_Type_Conversion1_out1 <= signed(Delay6_out1);

  Product1_in_pipe1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Data_Type_Conversion1_out1_1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Data_Type_Conversion1_out1_1 <= Data_Type_Conversion1_out1;
      END IF;
    END IF;
  END PROCESS Product1_in_pipe1_process;


  Product1_out1 <= Data_Type_Conversion2_out1_1 * Data_Type_Conversion1_out1_1;

  
  Product1_out1_1 <= X"7FFF" WHEN ((Product1_out1(31) = '0') AND (Product1_out1(30 DOWNTO 29) /= "00")) OR ((Product1_out1(31) = '0') AND (Product1_out1(29 DOWNTO 14) = X"7FFF")) ELSE
      X"8000" WHEN (Product1_out1(31) = '1') AND (Product1_out1(30 DOWNTO 29) /= "11") ELSE
      Product1_out1(29 DOWNTO 14) + ('0' & (Product1_out1(13) AND (( NOT Product1_out1(31)) OR (Product1_out1(12) OR Product1_out1(11) OR Product1_out1(10) OR Product1_out1(9) OR Product1_out1(8) OR Product1_out1(7) OR Product1_out1(6) OR Product1_out1(5) OR Product1_out1(4) OR Product1_out1(3) OR Product1_out1(2) OR Product1_out1(1) OR Product1_out1(0)))));

  Product1_out_pipe_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Product1_out1_2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Product1_out1_2 <= Product1_out1_1;
      END IF;
    END IF;
  END PROCESS Product1_out_pipe_process;


  Data_Type_Conversion4_out1 <= unsigned(Product1_out1_2);

  Data_Imag_Out <= std_logic_vector(Data_Type_Conversion4_out1);

  Delay5_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay5_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay5_out1 <= Last_Imag_In;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Last_Imag_Out <= Delay5_out1;

  Delay7_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay7_out1 <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        Delay7_out1 <= User_Imag_In;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  User_Imag_Out <= Delay7_out1;

  rd_m2s_rd_avalid <= Direct_Memory_Access_out5_rd_avalid;

  rd_m2s_rd_addr <= Direct_Memory_Access_out5_rd_addr;

  rd_m2s_rd_len <= Direct_Memory_Access_out5_rd_len;

END rtl;

