-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Wed Sep 29 12:28:17 2021"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ZHANG_SEPTEMBER1_4A_Latches IS 
	PORT
	(
		ZHANG_PRN :  IN  STD_LOGIC;
		ZHANG_D :  IN  STD_LOGIC;
		ZHANG_CLK :  IN  STD_LOGIC;
		ZHANG_CLRN :  IN  STD_LOGIC;
		ZHANG_output :  OUT  STD_LOGIC
	);
END ZHANG_SEPTEMBER1_4A_Latches;

ARCHITECTURE bdf_type OF ZHANG_SEPTEMBER1_4A_Latches IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;


BEGIN 



PROCESS(ZHANG_CLRN,ZHANG_PRN,SYNTHESIZED_WIRE_0,ZHANG_D)
BEGIN
IF (ZHANG_CLRN = '0') THEN
	SYNTHESIZED_WIRE_1 <= '0';
ELSIF (ZHANG_PRN = '0') THEN
	SYNTHESIZED_WIRE_1 <= '1';
ELSIF (SYNTHESIZED_WIRE_0 = '1') THEN
	SYNTHESIZED_WIRE_1 <= ZHANG_D;
END IF;
END PROCESS;


PROCESS(ZHANG_CLRN,ZHANG_PRN,ZHANG_CLK,SYNTHESIZED_WIRE_1)
BEGIN
IF (ZHANG_CLRN = '0') THEN
	ZHANG_output <= '0';
ELSIF (ZHANG_PRN = '0') THEN
	ZHANG_output <= '1';
ELSIF (ZHANG_CLK = '1') THEN
	ZHANG_output <= SYNTHESIZED_WIRE_1;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_0 <= NOT(ZHANG_CLK);



END bdf_type;