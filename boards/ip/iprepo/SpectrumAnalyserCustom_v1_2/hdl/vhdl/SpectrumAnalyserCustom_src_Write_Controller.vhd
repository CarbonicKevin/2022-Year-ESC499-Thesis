-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\spectrum_analyser\SpectrumAnalyserCustom_src_Write_Controller.vhd
-- Created: 2023-04-09 17:38:29
-- 
-- Generated by MATLAB 9.8 and HDL Coder 3.16
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SpectrumAnalyserCustom_src_Write_Controller
-- Source Path: spectrum_analyser/Spectrum Analyser/Spectrum Analyser/Direct Memory Access/Direct Memory Access/DDR 
-- Communication/Write Controlle
-- Hierarchy Level: 5
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SpectrumAnalyserCustom_src_Write_Controller IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb_1_16_0                        :   IN    std_logic;
        valid                             :   IN    std_logic;
        count                             :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        length                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        enable                            :   IN    std_logic;
        start                             :   IN    std_logic;
        wr_complete                       :   IN    std_logic;
        wr_ready                          :   IN    std_logic;
        empty                             :   IN    std_logic;
        push                              :   OUT   std_logic;
        pop                               :   OUT   std_logic;
        wr_len                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        buffer_rsvd                       :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        state                             :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
        );
END SpectrumAnalyserCustom_src_Write_Controller;


ARCHITECTURE rtl OF SpectrumAnalyserCustom_src_Write_Controller IS

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL count_unsigned                   : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL length_unsigned                  : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL wr_len_tmp                       : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL buffer_tmp                       : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL state_tmp                        : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL debug_count                      : unsigned(16 DOWNTO 0);  -- ufix17
  SIGNAL burst_count                      : unsigned(16 DOWNTO 0);  -- ufix17
  SIGNAL time_count                       : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL current_state                    : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL buffer_pointer                   : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL burst_count_next                 : unsigned(16 DOWNTO 0);  -- ufix17
  SIGNAL time_count_next                  : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL current_state_next               : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL buffer_pointer_next              : unsigned(1 DOWNTO 0);  -- ufix2

BEGIN
  count_unsigned <= unsigned(count);

  length_unsigned <= unsigned(length);

  slib_spectrum_analyser_c2_Write_Controller_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      burst_count <= to_unsigned(16#00000#, 17);
      time_count <= to_unsigned(0, 32);
      current_state <= to_unsigned(16#0#, 4);
      buffer_pointer <= to_unsigned(16#0#, 2);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_16_0 = '1' THEN
        burst_count <= burst_count_next;
        time_count <= time_count_next;
        current_state <= current_state_next;
        buffer_pointer <= buffer_pointer_next;
      END IF;
    END IF;
  END PROCESS slib_spectrum_analyser_c2_Write_Controller_process;

  slib_spectrum_analyser_c2_Write_Controller_output : PROCESS (buffer_pointer, burst_count, count_unsigned, current_state, empty, enable,
       length_unsigned, start, time_count, valid, wr_complete, wr_ready)
    VARIABLE burst_count_temp : unsigned(16 DOWNTO 0);
    VARIABLE add_temp : unsigned(17 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(17 DOWNTO 0);
    VARIABLE add_temp_1 : unsigned(32 DOWNTO 0);
    VARIABLE add_temp_2 : unsigned(2 DOWNTO 0);
  BEGIN
    add_temp := to_unsigned(16#00000#, 18);
    add_temp_0 := to_unsigned(16#00000#, 18);
    add_temp_1 := to_unsigned(0, 33);
    add_temp_2 := to_unsigned(16#0#, 3);
    burst_count_temp := burst_count;
    time_count_next <= time_count;
    current_state_next <= current_state;
    buffer_pointer_next <= buffer_pointer;
    -- Create persistent variables (registers)
    -- FSM States
    CASE current_state IS
      WHEN "0000" =>
        push <= '0';
        pop <= wr_ready;
        wr_len_tmp <= length_unsigned;
        buffer_tmp <= buffer_pointer;
        state_tmp <= current_state;
        debug_count <= burst_count;
        burst_count_temp := to_unsigned(16#00000#, 17);
        IF (enable AND hdlcoder_to_stdlogic(time_count >= count_unsigned)) = '1' THEN 
          current_state_next <= to_unsigned(16#1#, 4);
          time_count_next <= to_unsigned(0, 32);
        ELSE 
          current_state_next <= to_unsigned(16#0#, 4);
          IF time_count < count_unsigned THEN 
            add_temp_1 := resize(time_count, 33) + to_unsigned(1, 33);
            IF add_temp_1(32) /= '0' THEN 
              time_count_next <= X"FFFFFFFF";
            ELSE 
              time_count_next <= add_temp_1(31 DOWNTO 0);
            END IF;
          END IF;
        END IF;
      WHEN "0001" =>
        pop <= '0';
        wr_len_tmp <= length_unsigned;
        buffer_tmp <= buffer_pointer;
        state_tmp <= current_state;
        debug_count <= burst_count;
        IF ( NOT enable) = '1' THEN 
          push <= '0';
          burst_count_temp := to_unsigned(16#00000#, 17);
          current_state_next <= to_unsigned(16#0#, 4);
        ELSIF (start AND valid) = '1' THEN 
          push <= '1';
          add_temp_0 := resize(burst_count, 18) + to_unsigned(16#00001#, 18);
          IF add_temp_0(17) /= '0' THEN 
            burst_count_temp := "11111111111111111";
          ELSE 
            burst_count_temp := add_temp_0(16 DOWNTO 0);
          END IF;
          current_state_next <= to_unsigned(16#2#, 4);
        ELSE 
          push <= '0';
          burst_count_temp := to_unsigned(16#00000#, 17);
          current_state_next <= to_unsigned(16#1#, 4);
        END IF;
      WHEN "0010" =>
        pop <= '0';
        wr_len_tmp <= length_unsigned;
        buffer_tmp <= buffer_pointer;
        state_tmp <= current_state;
        debug_count <= burst_count;
        IF valid = '1' THEN 
          push <= '1';
          add_temp := resize(burst_count, 18) + to_unsigned(16#00001#, 18);
          IF add_temp(17) /= '0' THEN 
            burst_count_temp := "11111111111111111";
          ELSE 
            burst_count_temp := add_temp(16 DOWNTO 0);
          END IF;
        ELSE 
          push <= '0';
        END IF;
        IF resize(burst_count_temp, 32) >= length_unsigned THEN 
          current_state_next <= to_unsigned(16#4#, 4);
          IF buffer_pointer > to_unsigned(16#1#, 2) THEN 
            buffer_pointer_next <= to_unsigned(16#0#, 2);
          ELSE 
            add_temp_2 := resize(buffer_pointer, 3) + to_unsigned(16#1#, 3);
            IF add_temp_2(2) /= '0' THEN 
              buffer_pointer_next <= "11";
            ELSE 
              buffer_pointer_next <= add_temp_2(1 DOWNTO 0);
            END IF;
          END IF;
        ELSE 
          current_state_next <= to_unsigned(16#2#, 4);
        END IF;
      WHEN "0100" =>
        push <= '0';
        pop <= wr_ready;
        wr_len_tmp <= length_unsigned;
        buffer_tmp <= buffer_pointer;
        state_tmp <= current_state;
        debug_count <= burst_count;
        burst_count_temp := to_unsigned(16#00000#, 17);
        IF (empty AND wr_complete) = '1' THEN 
          current_state_next <= to_unsigned(16#0#, 4);
        ELSE 
          current_state_next <= to_unsigned(16#4#, 4);
        END IF;
      WHEN OTHERS => 
        push <= '0';
        pop <= wr_ready;
        wr_len_tmp <= length_unsigned;
        buffer_tmp <= buffer_pointer;
        state_tmp <= current_state;
        debug_count <= burst_count;
        burst_count_temp := to_unsigned(16#00000#, 17);
        current_state_next <= to_unsigned(16#0#, 4);
    END CASE;
    burst_count_next <= burst_count_temp;
  END PROCESS slib_spectrum_analyser_c2_Write_Controller_output;


  wr_len <= std_logic_vector(wr_len_tmp);

  buffer_rsvd <= std_logic_vector(buffer_tmp);

  state <= std_logic_vector(state_tmp);

END rtl;

