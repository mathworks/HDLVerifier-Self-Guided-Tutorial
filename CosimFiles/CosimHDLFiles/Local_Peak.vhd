-- Copyright 2025 The MathWorks, Inc.
-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\pulse_detector_v4\Local_Peak.vhd
-- Created: 2023-08-06 22:37:36
-- 
-- Generated by MATLAB 9.13 and HDL Coder 4.0
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Local_Peak
-- Source Path: pulse_detector_v4/Pulse Detector/Local Peak
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Pulse_Detector_pkg.ALL;

ENTITY Local_Peak IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En11
        data_out                          :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En11
        detected                          :   OUT   std_logic
        );
END Local_Peak;


ARCHITECTURE rtl OF Local_Peak IS

  -- Component Declarations
  COMPONENT MATLAB_Function
    PORT( threshold                       :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En11
          DataBuff                        :   IN    vector_of_std_logic_vector18(0 TO 10);  -- sfix18_En11 [11]
          MidSample                       :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En11
          detected                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : MATLAB_Function
    USE ENTITY work.MATLAB_Function(rtl);

  -- Signals
  SIGNAL data_in_signed                   : signed(17 DOWNTO 0);  -- sfix18_En11
  SIGNAL Constant_out1                    : signed(17 DOWNTO 0);  -- sfix18_En11
  SIGNAL Tapped_Delay_out1                : vector_of_signed18(0 TO 10);  -- sfix18_En11 [11]
  SIGNAL Tapped_Delay_out1_1              : vector_of_std_logic_vector18(0 TO 10);  -- ufix18 [11]
  SIGNAL MidSample                        : std_logic_vector(17 DOWNTO 0);  -- ufix18

BEGIN
  -- Use hdlfimath (floor & wrap) when possible
  -- to reduce hardware resource usage
  -- (Toolbar > Edit Data > Ports & Data Manager) 
  u_MATLAB_Function : MATLAB_Function
    PORT MAP( threshold => std_logic_vector(Constant_out1),  -- sfix18_En11
              DataBuff => Tapped_Delay_out1_1,  -- sfix18_En11 [11]
              MidSample => MidSample,  -- sfix18_En11
              detected => detected
              );

  data_in_signed <= signed(data_in);

  -- Back-propagate sample time
  -- from downstream (set to -1)
  Constant_out1 <= to_signed(16#0003D#, 18);

  Tapped_Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset = '1' THEN
        Tapped_Delay_out1 <= (OTHERS => to_signed(16#00000#, 18));
      ELSIF enb = '1' THEN
        Tapped_Delay_out1(10) <= data_in_signed;
        Tapped_Delay_out1(0 TO 9) <= Tapped_Delay_out1(1 TO 10);
      END IF;
    END IF;
  END PROCESS Tapped_Delay_process;


  outputgen: FOR k IN 0 TO 10 GENERATE
    Tapped_Delay_out1_1(k) <= std_logic_vector(Tapped_Delay_out1(k));
  END GENERATE;

  data_out <= MidSample;

END rtl;

