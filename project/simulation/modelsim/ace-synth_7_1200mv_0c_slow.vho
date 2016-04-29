-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "04/29/2016 17:39:49"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	\ace-top\ IS
    PORT (
	sram_we_n : OUT std_logic;
	clock_50 : IN std_logic;
	key : IN std_logic_vector(3 DOWNTO 0);
	sram_dq : INOUT std_logic_vector(15 DOWNTO 0);
	sw : IN std_logic_vector(9 DOWNTO 0);
	sram_oe_n : OUT std_logic;
	sram_ub_n : OUT std_logic;
	sram_lb_n : OUT std_logic;
	sram_ce_n : OUT std_logic;
	hex0 : OUT std_logic_vector(6 DOWNTO 0);
	hex1 : OUT std_logic_vector(6 DOWNTO 0);
	hex2 : OUT std_logic_vector(6 DOWNTO 0);
	hex3 : OUT std_logic_vector(6 DOWNTO 0);
	hex4 : OUT std_logic_vector(6 DOWNTO 0);
	hex5 : OUT std_logic_vector(6 DOWNTO 0);
	hex6 : OUT std_logic_vector(6 DOWNTO 0);
	hex7 : OUT std_logic_vector(6 DOWNTO 0);
	ledg : OUT std_logic_vector(8 DOWNTO 0);
	ledr : OUT std_logic_vector(17 DOWNTO 0);
	sram_addr : OUT std_logic_vector(19 DOWNTO 0)
	);
END \ace-top\;

-- Design Ports Information
-- sram_we_n	=>  Location: PIN_AE8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- key[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- key[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[9]	=>  Location: PIN_AB25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[8]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[7]	=>  Location: PIN_AB26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[6]	=>  Location: PIN_AD26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[5]	=>  Location: PIN_AC26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[4]	=>  Location: PIN_AB27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sw[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sram_oe_n	=>  Location: PIN_AD5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_ub_n	=>  Location: PIN_AC4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_lb_n	=>  Location: PIN_AD4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_ce_n	=>  Location: PIN_AF8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[6]	=>  Location: PIN_Y19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex3[5]	=>  Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex3[4]	=>  Location: PIN_AD24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex3[3]	=>  Location: PIN_AA21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex3[2]	=>  Location: PIN_AB20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hex4[6]	=>  Location: PIN_AE18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex4[5]	=>  Location: PIN_AF19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex4[4]	=>  Location: PIN_AE19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex4[3]	=>  Location: PIN_AH21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex4[2]	=>  Location: PIN_AG21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex4[1]	=>  Location: PIN_AA19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex4[0]	=>  Location: PIN_AB19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex5[6]	=>  Location: PIN_AH18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex5[5]	=>  Location: PIN_AF18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex5[4]	=>  Location: PIN_AG19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex5[3]	=>  Location: PIN_AH19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex5[2]	=>  Location: PIN_AB18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex5[1]	=>  Location: PIN_AC18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex5[0]	=>  Location: PIN_AD18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex6[6]	=>  Location: PIN_AC17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex6[5]	=>  Location: PIN_AA15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex6[4]	=>  Location: PIN_AB15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex6[3]	=>  Location: PIN_AB17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex6[2]	=>  Location: PIN_AA16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex6[1]	=>  Location: PIN_AB16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex6[0]	=>  Location: PIN_AA17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex7[6]	=>  Location: PIN_AA14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex7[5]	=>  Location: PIN_AG18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex7[4]	=>  Location: PIN_AF17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex7[3]	=>  Location: PIN_AH17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex7[2]	=>  Location: PIN_AG17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex7[1]	=>  Location: PIN_AE17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hex7[0]	=>  Location: PIN_AD17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- ledg[8]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledg[7]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledg[6]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledg[5]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledg[4]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledg[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledg[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledg[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledg[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[17]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[16]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[15]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[14]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[13]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[12]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[11]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[10]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[9]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[8]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ledr[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sram_addr[19]	=>  Location: PIN_T8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[18]	=>  Location: PIN_AB8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[17]	=>  Location: PIN_AB9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[16]	=>  Location: PIN_AC11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[15]	=>  Location: PIN_AB11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[14]	=>  Location: PIN_AA4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[13]	=>  Location: PIN_AC3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[12]	=>  Location: PIN_AB4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[11]	=>  Location: PIN_AD3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[10]	=>  Location: PIN_AF2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[9]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[8]	=>  Location: PIN_AF5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[7]	=>  Location: PIN_AC5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[6]	=>  Location: PIN_AB5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[5]	=>  Location: PIN_AE6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[4]	=>  Location: PIN_AB6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[3]	=>  Location: PIN_AC7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[2]	=>  Location: PIN_AE7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[1]	=>  Location: PIN_AD7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_addr[0]	=>  Location: PIN_AB7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[15]	=>  Location: PIN_AG3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[14]	=>  Location: PIN_AF3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[13]	=>  Location: PIN_AE4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[12]	=>  Location: PIN_AE3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[11]	=>  Location: PIN_AE1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[10]	=>  Location: PIN_AE2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[9]	=>  Location: PIN_AD2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[8]	=>  Location: PIN_AD1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[7]	=>  Location: PIN_AF7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[6]	=>  Location: PIN_AH6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[5]	=>  Location: PIN_AG6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[4]	=>  Location: PIN_AF6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[3]	=>  Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[2]	=>  Location: PIN_AG4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[1]	=>  Location: PIN_AF4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- sram_dq[0]	=>  Location: PIN_AH3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- clock_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF \ace-top\ IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_sram_we_n : std_logic;
SIGNAL ww_clock_50 : std_logic;
SIGNAL ww_key : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sw : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_sram_oe_n : std_logic;
SIGNAL ww_sram_ub_n : std_logic;
SIGNAL ww_sram_lb_n : std_logic;
SIGNAL ww_sram_ce_n : std_logic;
SIGNAL ww_hex0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_hex7 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_ledg : std_logic_vector(8 DOWNTO 0);
SIGNAL ww_ledr : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_sram_addr : std_logic_vector(19 DOWNTO 0);
SIGNAL \clock_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|timer|Add0~6_combout\ : std_logic;
SIGNAL \inst|timer|Add0~10_combout\ : std_logic;
SIGNAL \inst|timer|Add0~32_combout\ : std_logic;
SIGNAL \inst|timer|Add0~38_combout\ : std_logic;
SIGNAL \inst|timer|Add0~58_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~2_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~8_combout\ : std_logic;
SIGNAL \inst|timer|count~4_combout\ : std_logic;
SIGNAL \inst|timer|count~6_combout\ : std_logic;
SIGNAL \key[3]~input_o\ : std_logic;
SIGNAL \key[2]~input_o\ : std_logic;
SIGNAL \key[1]~input_o\ : std_logic;
SIGNAL \key[0]~input_o\ : std_logic;
SIGNAL \sw[9]~input_o\ : std_logic;
SIGNAL \sw[8]~input_o\ : std_logic;
SIGNAL \sw[7]~input_o\ : std_logic;
SIGNAL \sw[6]~input_o\ : std_logic;
SIGNAL \sw[5]~input_o\ : std_logic;
SIGNAL \sw[4]~input_o\ : std_logic;
SIGNAL \sw[3]~input_o\ : std_logic;
SIGNAL \sw[2]~input_o\ : std_logic;
SIGNAL \sw[1]~input_o\ : std_logic;
SIGNAL \sw[0]~input_o\ : std_logic;
SIGNAL \sram_dq[15]~input_o\ : std_logic;
SIGNAL \sram_dq[14]~input_o\ : std_logic;
SIGNAL \sram_dq[13]~input_o\ : std_logic;
SIGNAL \sram_dq[12]~input_o\ : std_logic;
SIGNAL \sram_dq[11]~input_o\ : std_logic;
SIGNAL \sram_dq[10]~input_o\ : std_logic;
SIGNAL \sram_dq[9]~input_o\ : std_logic;
SIGNAL \sram_dq[8]~input_o\ : std_logic;
SIGNAL \sram_dq[7]~input_o\ : std_logic;
SIGNAL \sram_dq[6]~input_o\ : std_logic;
SIGNAL \sram_dq[5]~input_o\ : std_logic;
SIGNAL \sram_dq[4]~input_o\ : std_logic;
SIGNAL \sram_dq[3]~input_o\ : std_logic;
SIGNAL \sram_dq[2]~input_o\ : std_logic;
SIGNAL \sram_dq[1]~input_o\ : std_logic;
SIGNAL \sram_dq[0]~input_o\ : std_logic;
SIGNAL \sram_dq[15]~output_o\ : std_logic;
SIGNAL \sram_dq[14]~output_o\ : std_logic;
SIGNAL \sram_dq[13]~output_o\ : std_logic;
SIGNAL \sram_dq[12]~output_o\ : std_logic;
SIGNAL \sram_dq[11]~output_o\ : std_logic;
SIGNAL \sram_dq[10]~output_o\ : std_logic;
SIGNAL \sram_dq[9]~output_o\ : std_logic;
SIGNAL \sram_dq[8]~output_o\ : std_logic;
SIGNAL \sram_dq[7]~output_o\ : std_logic;
SIGNAL \sram_dq[6]~output_o\ : std_logic;
SIGNAL \sram_dq[5]~output_o\ : std_logic;
SIGNAL \sram_dq[4]~output_o\ : std_logic;
SIGNAL \sram_dq[3]~output_o\ : std_logic;
SIGNAL \sram_dq[2]~output_o\ : std_logic;
SIGNAL \sram_dq[1]~output_o\ : std_logic;
SIGNAL \sram_dq[0]~output_o\ : std_logic;
SIGNAL \sram_we_n~output_o\ : std_logic;
SIGNAL \sram_oe_n~output_o\ : std_logic;
SIGNAL \sram_ub_n~output_o\ : std_logic;
SIGNAL \sram_lb_n~output_o\ : std_logic;
SIGNAL \sram_ce_n~output_o\ : std_logic;
SIGNAL \hex0[6]~output_o\ : std_logic;
SIGNAL \hex0[5]~output_o\ : std_logic;
SIGNAL \hex0[4]~output_o\ : std_logic;
SIGNAL \hex0[3]~output_o\ : std_logic;
SIGNAL \hex0[2]~output_o\ : std_logic;
SIGNAL \hex0[1]~output_o\ : std_logic;
SIGNAL \hex0[0]~output_o\ : std_logic;
SIGNAL \hex1[6]~output_o\ : std_logic;
SIGNAL \hex1[5]~output_o\ : std_logic;
SIGNAL \hex1[4]~output_o\ : std_logic;
SIGNAL \hex1[3]~output_o\ : std_logic;
SIGNAL \hex1[2]~output_o\ : std_logic;
SIGNAL \hex1[1]~output_o\ : std_logic;
SIGNAL \hex1[0]~output_o\ : std_logic;
SIGNAL \hex2[6]~output_o\ : std_logic;
SIGNAL \hex2[5]~output_o\ : std_logic;
SIGNAL \hex2[4]~output_o\ : std_logic;
SIGNAL \hex2[3]~output_o\ : std_logic;
SIGNAL \hex2[2]~output_o\ : std_logic;
SIGNAL \hex2[1]~output_o\ : std_logic;
SIGNAL \hex2[0]~output_o\ : std_logic;
SIGNAL \hex3[6]~output_o\ : std_logic;
SIGNAL \hex3[5]~output_o\ : std_logic;
SIGNAL \hex3[4]~output_o\ : std_logic;
SIGNAL \hex3[3]~output_o\ : std_logic;
SIGNAL \hex3[2]~output_o\ : std_logic;
SIGNAL \hex3[1]~output_o\ : std_logic;
SIGNAL \hex3[0]~output_o\ : std_logic;
SIGNAL \hex4[6]~output_o\ : std_logic;
SIGNAL \hex4[5]~output_o\ : std_logic;
SIGNAL \hex4[4]~output_o\ : std_logic;
SIGNAL \hex4[3]~output_o\ : std_logic;
SIGNAL \hex4[2]~output_o\ : std_logic;
SIGNAL \hex4[1]~output_o\ : std_logic;
SIGNAL \hex4[0]~output_o\ : std_logic;
SIGNAL \hex5[6]~output_o\ : std_logic;
SIGNAL \hex5[5]~output_o\ : std_logic;
SIGNAL \hex5[4]~output_o\ : std_logic;
SIGNAL \hex5[3]~output_o\ : std_logic;
SIGNAL \hex5[2]~output_o\ : std_logic;
SIGNAL \hex5[1]~output_o\ : std_logic;
SIGNAL \hex5[0]~output_o\ : std_logic;
SIGNAL \hex6[6]~output_o\ : std_logic;
SIGNAL \hex6[5]~output_o\ : std_logic;
SIGNAL \hex6[4]~output_o\ : std_logic;
SIGNAL \hex6[3]~output_o\ : std_logic;
SIGNAL \hex6[2]~output_o\ : std_logic;
SIGNAL \hex6[1]~output_o\ : std_logic;
SIGNAL \hex6[0]~output_o\ : std_logic;
SIGNAL \hex7[6]~output_o\ : std_logic;
SIGNAL \hex7[5]~output_o\ : std_logic;
SIGNAL \hex7[4]~output_o\ : std_logic;
SIGNAL \hex7[3]~output_o\ : std_logic;
SIGNAL \hex7[2]~output_o\ : std_logic;
SIGNAL \hex7[1]~output_o\ : std_logic;
SIGNAL \hex7[0]~output_o\ : std_logic;
SIGNAL \ledg[8]~output_o\ : std_logic;
SIGNAL \ledg[7]~output_o\ : std_logic;
SIGNAL \ledg[6]~output_o\ : std_logic;
SIGNAL \ledg[5]~output_o\ : std_logic;
SIGNAL \ledg[4]~output_o\ : std_logic;
SIGNAL \ledg[3]~output_o\ : std_logic;
SIGNAL \ledg[2]~output_o\ : std_logic;
SIGNAL \ledg[1]~output_o\ : std_logic;
SIGNAL \ledg[0]~output_o\ : std_logic;
SIGNAL \ledr[17]~output_o\ : std_logic;
SIGNAL \ledr[16]~output_o\ : std_logic;
SIGNAL \ledr[15]~output_o\ : std_logic;
SIGNAL \ledr[14]~output_o\ : std_logic;
SIGNAL \ledr[13]~output_o\ : std_logic;
SIGNAL \ledr[12]~output_o\ : std_logic;
SIGNAL \ledr[11]~output_o\ : std_logic;
SIGNAL \ledr[10]~output_o\ : std_logic;
SIGNAL \ledr[9]~output_o\ : std_logic;
SIGNAL \ledr[8]~output_o\ : std_logic;
SIGNAL \ledr[7]~output_o\ : std_logic;
SIGNAL \ledr[6]~output_o\ : std_logic;
SIGNAL \ledr[5]~output_o\ : std_logic;
SIGNAL \ledr[4]~output_o\ : std_logic;
SIGNAL \ledr[3]~output_o\ : std_logic;
SIGNAL \ledr[2]~output_o\ : std_logic;
SIGNAL \ledr[1]~output_o\ : std_logic;
SIGNAL \ledr[0]~output_o\ : std_logic;
SIGNAL \sram_addr[19]~output_o\ : std_logic;
SIGNAL \sram_addr[18]~output_o\ : std_logic;
SIGNAL \sram_addr[17]~output_o\ : std_logic;
SIGNAL \sram_addr[16]~output_o\ : std_logic;
SIGNAL \sram_addr[15]~output_o\ : std_logic;
SIGNAL \sram_addr[14]~output_o\ : std_logic;
SIGNAL \sram_addr[13]~output_o\ : std_logic;
SIGNAL \sram_addr[12]~output_o\ : std_logic;
SIGNAL \sram_addr[11]~output_o\ : std_logic;
SIGNAL \sram_addr[10]~output_o\ : std_logic;
SIGNAL \sram_addr[9]~output_o\ : std_logic;
SIGNAL \sram_addr[8]~output_o\ : std_logic;
SIGNAL \sram_addr[7]~output_o\ : std_logic;
SIGNAL \sram_addr[6]~output_o\ : std_logic;
SIGNAL \sram_addr[5]~output_o\ : std_logic;
SIGNAL \sram_addr[4]~output_o\ : std_logic;
SIGNAL \sram_addr[3]~output_o\ : std_logic;
SIGNAL \sram_addr[2]~output_o\ : std_logic;
SIGNAL \sram_addr[1]~output_o\ : std_logic;
SIGNAL \sram_addr[0]~output_o\ : std_logic;
SIGNAL \clock_50~input_o\ : std_logic;
SIGNAL \clock_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|timer|Add0~0_combout\ : std_logic;
SIGNAL \inst|timer|count~12_combout\ : std_logic;
SIGNAL \inst|timer|Add0~1\ : std_logic;
SIGNAL \inst|timer|Add0~2_combout\ : std_logic;
SIGNAL \inst|timer|Add0~3\ : std_logic;
SIGNAL \inst|timer|Add0~4_combout\ : std_logic;
SIGNAL \inst|timer|Add0~5\ : std_logic;
SIGNAL \inst|timer|Add0~7\ : std_logic;
SIGNAL \inst|timer|Add0~8_combout\ : std_logic;
SIGNAL \inst|timer|Add0~9\ : std_logic;
SIGNAL \inst|timer|Add0~11\ : std_logic;
SIGNAL \inst|timer|Add0~12_combout\ : std_logic;
SIGNAL \inst|timer|count~11_combout\ : std_logic;
SIGNAL \inst|timer|Add0~13\ : std_logic;
SIGNAL \inst|timer|Add0~14_combout\ : std_logic;
SIGNAL \inst|timer|Add0~15\ : std_logic;
SIGNAL \inst|timer|Add0~16_combout\ : std_logic;
SIGNAL \inst|timer|Add0~17\ : std_logic;
SIGNAL \inst|timer|Add0~18_combout\ : std_logic;
SIGNAL \inst|timer|Add0~19\ : std_logic;
SIGNAL \inst|timer|Add0~20_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~6_combout\ : std_logic;
SIGNAL \inst|timer|Add0~21\ : std_logic;
SIGNAL \inst|timer|Add0~22_combout\ : std_logic;
SIGNAL \inst|timer|count~10_combout\ : std_logic;
SIGNAL \inst|timer|Add0~23\ : std_logic;
SIGNAL \inst|timer|Add0~25\ : std_logic;
SIGNAL \inst|timer|Add0~26_combout\ : std_logic;
SIGNAL \inst|timer|count~8_combout\ : std_logic;
SIGNAL \inst|timer|Add0~24_combout\ : std_logic;
SIGNAL \inst|timer|count~9_combout\ : std_logic;
SIGNAL \inst|timer|Add0~27\ : std_logic;
SIGNAL \inst|timer|Add0~28_combout\ : std_logic;
SIGNAL \inst|timer|count~7_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~5_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~7_combout\ : std_logic;
SIGNAL \inst|timer|Add0~29\ : std_logic;
SIGNAL \inst|timer|Add0~31\ : std_logic;
SIGNAL \inst|timer|Add0~33\ : std_logic;
SIGNAL \inst|timer|Add0~34_combout\ : std_logic;
SIGNAL \inst|timer|Add0~35\ : std_logic;
SIGNAL \inst|timer|Add0~37\ : std_logic;
SIGNAL \inst|timer|Add0~39\ : std_logic;
SIGNAL \inst|timer|Add0~40_combout\ : std_logic;
SIGNAL \inst|timer|count~3_combout\ : std_logic;
SIGNAL \inst|timer|Add0~41\ : std_logic;
SIGNAL \inst|timer|Add0~42_combout\ : std_logic;
SIGNAL \inst|timer|count~2_combout\ : std_logic;
SIGNAL \inst|timer|Add0~43\ : std_logic;
SIGNAL \inst|timer|Add0~44_combout\ : std_logic;
SIGNAL \inst|timer|count~1_combout\ : std_logic;
SIGNAL \inst|timer|Add0~45\ : std_logic;
SIGNAL \inst|timer|Add0~46_combout\ : std_logic;
SIGNAL \inst|timer|Add0~47\ : std_logic;
SIGNAL \inst|timer|Add0~48_combout\ : std_logic;
SIGNAL \inst|timer|count~0_combout\ : std_logic;
SIGNAL \inst|timer|Add0~49\ : std_logic;
SIGNAL \inst|timer|Add0~50_combout\ : std_logic;
SIGNAL \inst|timer|Add0~51\ : std_logic;
SIGNAL \inst|timer|Add0~52_combout\ : std_logic;
SIGNAL \inst|timer|Add0~53\ : std_logic;
SIGNAL \inst|timer|Add0~55\ : std_logic;
SIGNAL \inst|timer|Add0~56_combout\ : std_logic;
SIGNAL \inst|timer|Add0~57\ : std_logic;
SIGNAL \inst|timer|Add0~59\ : std_logic;
SIGNAL \inst|timer|Add0~60_combout\ : std_logic;
SIGNAL \inst|timer|Add0~61\ : std_logic;
SIGNAL \inst|timer|Add0~62_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~9_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~1_combout\ : std_logic;
SIGNAL \inst|timer|Add0~54_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~0_combout\ : std_logic;
SIGNAL \inst|timer|Add0~36_combout\ : std_logic;
SIGNAL \inst|timer|count~5_combout\ : std_logic;
SIGNAL \inst|timer|Add0~30_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~3_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~4_combout\ : std_logic;
SIGNAL \inst|timer|Equal0~10_combout\ : std_logic;
SIGNAL \inst|timer|signal~q\ : std_logic;
SIGNAL \inst|timer|count\ : std_logic_vector(31 DOWNTO 0);

BEGIN

sram_we_n <= ww_sram_we_n;
ww_clock_50 <= clock_50;
ww_key <= key;
ww_sw <= sw;
sram_oe_n <= ww_sram_oe_n;
sram_ub_n <= ww_sram_ub_n;
sram_lb_n <= ww_sram_lb_n;
sram_ce_n <= ww_sram_ce_n;
hex0 <= ww_hex0;
hex1 <= ww_hex1;
hex2 <= ww_hex2;
hex3 <= ww_hex3;
hex4 <= ww_hex4;
hex5 <= ww_hex5;
hex6 <= ww_hex6;
hex7 <= ww_hex7;
ledg <= ww_ledg;
ledr <= ww_ledr;
sram_addr <= ww_sram_addr;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock_50~input_o\);

-- Location: LCCOMB_X68_Y71_N6
\inst|timer|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~6_combout\ = (\inst|timer|count\(3) & (!\inst|timer|Add0~5\)) # (!\inst|timer|count\(3) & ((\inst|timer|Add0~5\) # (GND)))
-- \inst|timer|Add0~7\ = CARRY((!\inst|timer|Add0~5\) # (!\inst|timer|count\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(3),
	datad => VCC,
	cin => \inst|timer|Add0~5\,
	combout => \inst|timer|Add0~6_combout\,
	cout => \inst|timer|Add0~7\);

-- Location: LCCOMB_X68_Y71_N10
\inst|timer|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~10_combout\ = (\inst|timer|count\(5) & (!\inst|timer|Add0~9\)) # (!\inst|timer|count\(5) & ((\inst|timer|Add0~9\) # (GND)))
-- \inst|timer|Add0~11\ = CARRY((!\inst|timer|Add0~9\) # (!\inst|timer|count\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(5),
	datad => VCC,
	cin => \inst|timer|Add0~9\,
	combout => \inst|timer|Add0~10_combout\,
	cout => \inst|timer|Add0~11\);

-- Location: LCCOMB_X68_Y70_N0
\inst|timer|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~32_combout\ = (\inst|timer|count\(16) & (\inst|timer|Add0~31\ $ (GND))) # (!\inst|timer|count\(16) & (!\inst|timer|Add0~31\ & VCC))
-- \inst|timer|Add0~33\ = CARRY((\inst|timer|count\(16) & !\inst|timer|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(16),
	datad => VCC,
	cin => \inst|timer|Add0~31\,
	combout => \inst|timer|Add0~32_combout\,
	cout => \inst|timer|Add0~33\);

-- Location: LCCOMB_X68_Y70_N6
\inst|timer|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~38_combout\ = (\inst|timer|count\(19) & (!\inst|timer|Add0~37\)) # (!\inst|timer|count\(19) & ((\inst|timer|Add0~37\) # (GND)))
-- \inst|timer|Add0~39\ = CARRY((!\inst|timer|Add0~37\) # (!\inst|timer|count\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(19),
	datad => VCC,
	cin => \inst|timer|Add0~37\,
	combout => \inst|timer|Add0~38_combout\,
	cout => \inst|timer|Add0~39\);

-- Location: LCCOMB_X68_Y70_N26
\inst|timer|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~58_combout\ = (\inst|timer|count\(29) & (!\inst|timer|Add0~57\)) # (!\inst|timer|count\(29) & ((\inst|timer|Add0~57\) # (GND)))
-- \inst|timer|Add0~59\ = CARRY((!\inst|timer|Add0~57\) # (!\inst|timer|count\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(29),
	datad => VCC,
	cin => \inst|timer|Add0~57\,
	combout => \inst|timer|Add0~58_combout\,
	cout => \inst|timer|Add0~59\);

-- Location: FF_X68_Y70_N27
\inst|timer|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(29));

-- Location: FF_X69_Y70_N21
\inst|timer|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(19));

-- Location: LCCOMB_X69_Y70_N6
\inst|timer|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~2_combout\ = (\inst|timer|count\(22) & (\inst|timer|count\(21) & (\inst|timer|count\(19) & \inst|timer|count\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(22),
	datab => \inst|timer|count\(21),
	datac => \inst|timer|count\(19),
	datad => \inst|timer|count\(20),
	combout => \inst|timer|Equal0~2_combout\);

-- Location: FF_X69_Y70_N31
\inst|timer|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(16));

-- Location: FF_X68_Y71_N11
\inst|timer|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(5));

-- Location: FF_X68_Y71_N7
\inst|timer|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(3));

-- Location: LCCOMB_X69_Y71_N6
\inst|timer|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~8_combout\ = (!\inst|timer|count\(5) & (\inst|timer|count\(6) & (!\inst|timer|count\(3) & !\inst|timer|count\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(5),
	datab => \inst|timer|count\(6),
	datac => \inst|timer|count\(3),
	datad => \inst|timer|count\(4),
	combout => \inst|timer|Equal0~8_combout\);

-- Location: LCCOMB_X69_Y70_N20
\inst|timer|count~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~4_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|Equal0~10_combout\,
	datac => \inst|timer|Add0~38_combout\,
	combout => \inst|timer|count~4_combout\);

-- Location: LCCOMB_X69_Y70_N30
\inst|timer|count~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~6_combout\ = (\inst|timer|Add0~32_combout\ & !\inst|timer|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|Add0~32_combout\,
	datac => \inst|timer|Equal0~10_combout\,
	combout => \inst|timer|count~6_combout\);

-- Location: IOOBUF_X3_Y0_N16
\sram_dq[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[15]~output_o\);

-- Location: IOOBUF_X7_Y0_N23
\sram_dq[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[14]~output_o\);

-- Location: IOOBUF_X3_Y0_N23
\sram_dq[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[13]~output_o\);

-- Location: IOOBUF_X0_Y7_N9
\sram_dq[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[12]~output_o\);

-- Location: IOOBUF_X0_Y16_N16
\sram_dq[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[11]~output_o\);

-- Location: IOOBUF_X0_Y17_N16
\sram_dq[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[10]~output_o\);

-- Location: IOOBUF_X0_Y22_N23
\sram_dq[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[9]~output_o\);

-- Location: IOOBUF_X0_Y21_N16
\sram_dq[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[8]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\sram_dq[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[7]~output_o\);

-- Location: IOOBUF_X11_Y0_N16
\sram_dq[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[6]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\sram_dq[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[5]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\sram_dq[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[4]~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\sram_dq[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[3]~output_o\);

-- Location: IOOBUF_X9_Y0_N23
\sram_dq[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[2]~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\sram_dq[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[1]~output_o\);

-- Location: IOOBUF_X5_Y0_N9
\sram_dq[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \sram_dq[0]~output_o\);

-- Location: IOOBUF_X23_Y0_N23
\sram_we_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_we_n~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\sram_oe_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_oe_n~output_o\);

-- Location: IOOBUF_X0_Y4_N2
\sram_ub_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_ub_n~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\sram_lb_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_lb_n~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\sram_ce_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_ce_n~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\hex0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex0[6]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\hex0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex0[5]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\hex0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex0[4]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\hex0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex0[3]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\hex0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex0[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\hex0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex0[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\hex0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex0[0]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\hex1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex1[6]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\hex1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex1[5]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\hex1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex1[4]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\hex1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex1[3]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\hex1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\hex1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex1[1]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\hex1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex1[0]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\hex2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex2[6]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\hex2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex2[5]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\hex2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex2[4]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\hex2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex2[3]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\hex2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex2[2]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\hex2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex2[1]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\hex2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex2[0]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\hex3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex3[6]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\hex3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\hex3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex3[4]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\hex3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex3[3]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\hex3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex3[2]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\hex3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex3[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\hex3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex3[0]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\hex4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex4[6]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\hex4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex4[5]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\hex4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex4[4]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\hex4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex4[3]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\hex4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex4[2]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\hex4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex4[1]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\hex4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex4[0]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\hex5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex5[6]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\hex5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex5[5]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\hex5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex5[4]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\hex5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex5[3]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\hex5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex5[2]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\hex5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex5[1]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\hex5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex5[0]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\hex6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex6[6]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\hex6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex6[5]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\hex6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex6[4]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\hex6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex6[3]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\hex6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex6[2]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\hex6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex6[1]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\hex6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex6[0]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\hex7[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex7[6]~output_o\);

-- Location: IOOBUF_X69_Y0_N9
\hex7[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex7[5]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\hex7[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex7[4]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\hex7[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex7[3]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\hex7[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex7[2]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\hex7[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex7[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N16
\hex7[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \hex7[0]~output_o\);

-- Location: IOOBUF_X67_Y73_N16
\ledg[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[8]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\ledg[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[7]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\ledg[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[6]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\ledg[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\ledg[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[4]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\ledg[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[3]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\ledg[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[2]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\ledg[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[1]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\ledg[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledg[0]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\ledr[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[17]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\ledr[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[16]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\ledr[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[15]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\ledr[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[14]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\ledr[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[13]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\ledr[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[12]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\ledr[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[11]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\ledr[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[10]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\ledr[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[9]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\ledr[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[8]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\ledr[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[7]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\ledr[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[6]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\ledr[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[5]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\ledr[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[4]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\ledr[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[3]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\ledr[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[2]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\ledr[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ledr[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\ledr[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|timer|signal~q\,
	devoe => ww_devoe,
	o => \ledr[0]~output_o\);

-- Location: IOOBUF_X0_Y20_N16
\sram_addr[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[19]~output_o\);

-- Location: IOOBUF_X11_Y0_N2
\sram_addr[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[18]~output_o\);

-- Location: IOOBUF_X11_Y0_N9
\sram_addr[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[17]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\sram_addr[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[16]~output_o\);

-- Location: IOOBUF_X27_Y0_N9
\sram_addr[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[15]~output_o\);

-- Location: IOOBUF_X0_Y19_N2
\sram_addr[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[14]~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\sram_addr[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[13]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\sram_addr[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[12]~output_o\);

-- Location: IOOBUF_X0_Y22_N16
\sram_addr[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[11]~output_o\);

-- Location: IOOBUF_X0_Y6_N2
\sram_addr[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[10]~output_o\);

-- Location: IOOBUF_X0_Y31_N16
\sram_addr[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[9]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\sram_addr[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[8]~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\sram_addr[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[7]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\sram_addr[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[6]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\sram_addr[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[5]~output_o\);

-- Location: IOOBUF_X0_Y4_N9
\sram_addr[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[4]~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\sram_addr[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[3]~output_o\);

-- Location: IOOBUF_X20_Y0_N16
\sram_addr[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[2]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\sram_addr[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[1]~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\sram_addr[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \sram_addr[0]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\clock_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock_50,
	o => \clock_50~input_o\);

-- Location: CLKCTRL_G4
\clock_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X68_Y71_N0
\inst|timer|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~0_combout\ = \inst|timer|count\(0) $ (VCC)
-- \inst|timer|Add0~1\ = CARRY(\inst|timer|count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(0),
	datad => VCC,
	combout => \inst|timer|Add0~0_combout\,
	cout => \inst|timer|Add0~1\);

-- Location: LCCOMB_X69_Y71_N10
\inst|timer|count~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~12_combout\ = (\inst|timer|Add0~0_combout\ & !\inst|timer|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Add0~0_combout\,
	datad => \inst|timer|Equal0~10_combout\,
	combout => \inst|timer|count~12_combout\);

-- Location: FF_X68_Y71_N29
\inst|timer|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	asdata => \inst|timer|count~12_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(0));

-- Location: LCCOMB_X68_Y71_N2
\inst|timer|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~2_combout\ = (\inst|timer|count\(1) & (!\inst|timer|Add0~1\)) # (!\inst|timer|count\(1) & ((\inst|timer|Add0~1\) # (GND)))
-- \inst|timer|Add0~3\ = CARRY((!\inst|timer|Add0~1\) # (!\inst|timer|count\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(1),
	datad => VCC,
	cin => \inst|timer|Add0~1\,
	combout => \inst|timer|Add0~2_combout\,
	cout => \inst|timer|Add0~3\);

-- Location: FF_X68_Y71_N3
\inst|timer|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(1));

-- Location: LCCOMB_X68_Y71_N4
\inst|timer|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~4_combout\ = (\inst|timer|count\(2) & (\inst|timer|Add0~3\ $ (GND))) # (!\inst|timer|count\(2) & (!\inst|timer|Add0~3\ & VCC))
-- \inst|timer|Add0~5\ = CARRY((\inst|timer|count\(2) & !\inst|timer|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(2),
	datad => VCC,
	cin => \inst|timer|Add0~3\,
	combout => \inst|timer|Add0~4_combout\,
	cout => \inst|timer|Add0~5\);

-- Location: FF_X68_Y71_N5
\inst|timer|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(2));

-- Location: LCCOMB_X68_Y71_N8
\inst|timer|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~8_combout\ = (\inst|timer|count\(4) & (\inst|timer|Add0~7\ $ (GND))) # (!\inst|timer|count\(4) & (!\inst|timer|Add0~7\ & VCC))
-- \inst|timer|Add0~9\ = CARRY((\inst|timer|count\(4) & !\inst|timer|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(4),
	datad => VCC,
	cin => \inst|timer|Add0~7\,
	combout => \inst|timer|Add0~8_combout\,
	cout => \inst|timer|Add0~9\);

-- Location: FF_X68_Y71_N9
\inst|timer|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(4));

-- Location: LCCOMB_X68_Y71_N12
\inst|timer|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~12_combout\ = (\inst|timer|count\(6) & (\inst|timer|Add0~11\ $ (GND))) # (!\inst|timer|count\(6) & (!\inst|timer|Add0~11\ & VCC))
-- \inst|timer|Add0~13\ = CARRY((\inst|timer|count\(6) & !\inst|timer|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(6),
	datad => VCC,
	cin => \inst|timer|Add0~11\,
	combout => \inst|timer|Add0~12_combout\,
	cout => \inst|timer|Add0~13\);

-- Location: LCCOMB_X69_Y71_N28
\inst|timer|count~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~11_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Equal0~10_combout\,
	datad => \inst|timer|Add0~12_combout\,
	combout => \inst|timer|count~11_combout\);

-- Location: FF_X69_Y71_N29
\inst|timer|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(6));

-- Location: LCCOMB_X68_Y71_N14
\inst|timer|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~14_combout\ = (\inst|timer|count\(7) & (!\inst|timer|Add0~13\)) # (!\inst|timer|count\(7) & ((\inst|timer|Add0~13\) # (GND)))
-- \inst|timer|Add0~15\ = CARRY((!\inst|timer|Add0~13\) # (!\inst|timer|count\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(7),
	datad => VCC,
	cin => \inst|timer|Add0~13\,
	combout => \inst|timer|Add0~14_combout\,
	cout => \inst|timer|Add0~15\);

-- Location: FF_X68_Y71_N15
\inst|timer|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(7));

-- Location: LCCOMB_X68_Y71_N16
\inst|timer|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~16_combout\ = (\inst|timer|count\(8) & (\inst|timer|Add0~15\ $ (GND))) # (!\inst|timer|count\(8) & (!\inst|timer|Add0~15\ & VCC))
-- \inst|timer|Add0~17\ = CARRY((\inst|timer|count\(8) & !\inst|timer|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(8),
	datad => VCC,
	cin => \inst|timer|Add0~15\,
	combout => \inst|timer|Add0~16_combout\,
	cout => \inst|timer|Add0~17\);

-- Location: FF_X68_Y71_N17
\inst|timer|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(8));

-- Location: LCCOMB_X68_Y71_N18
\inst|timer|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~18_combout\ = (\inst|timer|count\(9) & (!\inst|timer|Add0~17\)) # (!\inst|timer|count\(9) & ((\inst|timer|Add0~17\) # (GND)))
-- \inst|timer|Add0~19\ = CARRY((!\inst|timer|Add0~17\) # (!\inst|timer|count\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(9),
	datad => VCC,
	cin => \inst|timer|Add0~17\,
	combout => \inst|timer|Add0~18_combout\,
	cout => \inst|timer|Add0~19\);

-- Location: FF_X68_Y71_N19
\inst|timer|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(9));

-- Location: LCCOMB_X68_Y71_N20
\inst|timer|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~20_combout\ = (\inst|timer|count\(10) & (\inst|timer|Add0~19\ $ (GND))) # (!\inst|timer|count\(10) & (!\inst|timer|Add0~19\ & VCC))
-- \inst|timer|Add0~21\ = CARRY((\inst|timer|count\(10) & !\inst|timer|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(10),
	datad => VCC,
	cin => \inst|timer|Add0~19\,
	combout => \inst|timer|Add0~20_combout\,
	cout => \inst|timer|Add0~21\);

-- Location: FF_X68_Y71_N21
\inst|timer|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(10));

-- Location: LCCOMB_X69_Y71_N16
\inst|timer|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~6_combout\ = (!\inst|timer|count\(9) & !\inst|timer|count\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(9),
	datad => \inst|timer|count\(10),
	combout => \inst|timer|Equal0~6_combout\);

-- Location: LCCOMB_X68_Y71_N22
\inst|timer|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~22_combout\ = (\inst|timer|count\(11) & (!\inst|timer|Add0~21\)) # (!\inst|timer|count\(11) & ((\inst|timer|Add0~21\) # (GND)))
-- \inst|timer|Add0~23\ = CARRY((!\inst|timer|Add0~21\) # (!\inst|timer|count\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(11),
	datad => VCC,
	cin => \inst|timer|Add0~21\,
	combout => \inst|timer|Add0~22_combout\,
	cout => \inst|timer|Add0~23\);

-- Location: LCCOMB_X69_Y71_N12
\inst|timer|count~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~10_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Equal0~10_combout\,
	datad => \inst|timer|Add0~22_combout\,
	combout => \inst|timer|count~10_combout\);

-- Location: FF_X69_Y71_N13
\inst|timer|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(11));

-- Location: LCCOMB_X68_Y71_N24
\inst|timer|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~24_combout\ = (\inst|timer|count\(12) & (\inst|timer|Add0~23\ $ (GND))) # (!\inst|timer|count\(12) & (!\inst|timer|Add0~23\ & VCC))
-- \inst|timer|Add0~25\ = CARRY((\inst|timer|count\(12) & !\inst|timer|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(12),
	datad => VCC,
	cin => \inst|timer|Add0~23\,
	combout => \inst|timer|Add0~24_combout\,
	cout => \inst|timer|Add0~25\);

-- Location: LCCOMB_X68_Y71_N26
\inst|timer|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~26_combout\ = (\inst|timer|count\(13) & (!\inst|timer|Add0~25\)) # (!\inst|timer|count\(13) & ((\inst|timer|Add0~25\) # (GND)))
-- \inst|timer|Add0~27\ = CARRY((!\inst|timer|Add0~25\) # (!\inst|timer|count\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(13),
	datad => VCC,
	cin => \inst|timer|Add0~25\,
	combout => \inst|timer|Add0~26_combout\,
	cout => \inst|timer|Add0~27\);

-- Location: LCCOMB_X69_Y71_N20
\inst|timer|count~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~8_combout\ = (\inst|timer|Add0~26_combout\ & !\inst|timer|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Add0~26_combout\,
	datad => \inst|timer|Equal0~10_combout\,
	combout => \inst|timer|count~8_combout\);

-- Location: FF_X69_Y71_N21
\inst|timer|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(13));

-- Location: LCCOMB_X69_Y71_N30
\inst|timer|count~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~9_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Equal0~10_combout\,
	datad => \inst|timer|Add0~24_combout\,
	combout => \inst|timer|count~9_combout\);

-- Location: FF_X69_Y71_N31
\inst|timer|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(12));

-- Location: LCCOMB_X68_Y71_N28
\inst|timer|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~28_combout\ = (\inst|timer|count\(14) & (\inst|timer|Add0~27\ $ (GND))) # (!\inst|timer|count\(14) & (!\inst|timer|Add0~27\ & VCC))
-- \inst|timer|Add0~29\ = CARRY((\inst|timer|count\(14) & !\inst|timer|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(14),
	datad => VCC,
	cin => \inst|timer|Add0~27\,
	combout => \inst|timer|Add0~28_combout\,
	cout => \inst|timer|Add0~29\);

-- Location: LCCOMB_X69_Y71_N18
\inst|timer|count~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~7_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Equal0~10_combout\,
	datad => \inst|timer|Add0~28_combout\,
	combout => \inst|timer|count~7_combout\);

-- Location: FF_X69_Y71_N19
\inst|timer|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(14));

-- Location: LCCOMB_X69_Y71_N26
\inst|timer|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~5_combout\ = (\inst|timer|count\(11) & (\inst|timer|count\(13) & (\inst|timer|count\(12) & \inst|timer|count\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(11),
	datab => \inst|timer|count\(13),
	datac => \inst|timer|count\(12),
	datad => \inst|timer|count\(14),
	combout => \inst|timer|Equal0~5_combout\);

-- Location: LCCOMB_X69_Y71_N14
\inst|timer|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~7_combout\ = (!\inst|timer|count\(8) & (\inst|timer|Equal0~6_combout\ & (\inst|timer|Equal0~5_combout\ & !\inst|timer|count\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(8),
	datab => \inst|timer|Equal0~6_combout\,
	datac => \inst|timer|Equal0~5_combout\,
	datad => \inst|timer|count\(7),
	combout => \inst|timer|Equal0~7_combout\);

-- Location: LCCOMB_X68_Y71_N30
\inst|timer|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~30_combout\ = (\inst|timer|count\(15) & (!\inst|timer|Add0~29\)) # (!\inst|timer|count\(15) & ((\inst|timer|Add0~29\) # (GND)))
-- \inst|timer|Add0~31\ = CARRY((!\inst|timer|Add0~29\) # (!\inst|timer|count\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(15),
	datad => VCC,
	cin => \inst|timer|Add0~29\,
	combout => \inst|timer|Add0~30_combout\,
	cout => \inst|timer|Add0~31\);

-- Location: LCCOMB_X68_Y70_N2
\inst|timer|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~34_combout\ = (\inst|timer|count\(17) & (!\inst|timer|Add0~33\)) # (!\inst|timer|count\(17) & ((\inst|timer|Add0~33\) # (GND)))
-- \inst|timer|Add0~35\ = CARRY((!\inst|timer|Add0~33\) # (!\inst|timer|count\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(17),
	datad => VCC,
	cin => \inst|timer|Add0~33\,
	combout => \inst|timer|Add0~34_combout\,
	cout => \inst|timer|Add0~35\);

-- Location: FF_X68_Y70_N3
\inst|timer|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(17));

-- Location: LCCOMB_X68_Y70_N4
\inst|timer|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~36_combout\ = (\inst|timer|count\(18) & (\inst|timer|Add0~35\ $ (GND))) # (!\inst|timer|count\(18) & (!\inst|timer|Add0~35\ & VCC))
-- \inst|timer|Add0~37\ = CARRY((\inst|timer|count\(18) & !\inst|timer|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(18),
	datad => VCC,
	cin => \inst|timer|Add0~35\,
	combout => \inst|timer|Add0~36_combout\,
	cout => \inst|timer|Add0~37\);

-- Location: LCCOMB_X68_Y70_N8
\inst|timer|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~40_combout\ = (\inst|timer|count\(20) & (\inst|timer|Add0~39\ $ (GND))) # (!\inst|timer|count\(20) & (!\inst|timer|Add0~39\ & VCC))
-- \inst|timer|Add0~41\ = CARRY((\inst|timer|count\(20) & !\inst|timer|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(20),
	datad => VCC,
	cin => \inst|timer|Add0~39\,
	combout => \inst|timer|Add0~40_combout\,
	cout => \inst|timer|Add0~41\);

-- Location: LCCOMB_X69_Y70_N18
\inst|timer|count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~3_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Equal0~10_combout\,
	datad => \inst|timer|Add0~40_combout\,
	combout => \inst|timer|count~3_combout\);

-- Location: FF_X69_Y70_N19
\inst|timer|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(20));

-- Location: LCCOMB_X68_Y70_N10
\inst|timer|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~42_combout\ = (\inst|timer|count\(21) & (!\inst|timer|Add0~41\)) # (!\inst|timer|count\(21) & ((\inst|timer|Add0~41\) # (GND)))
-- \inst|timer|Add0~43\ = CARRY((!\inst|timer|Add0~41\) # (!\inst|timer|count\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(21),
	datad => VCC,
	cin => \inst|timer|Add0~41\,
	combout => \inst|timer|Add0~42_combout\,
	cout => \inst|timer|Add0~43\);

-- Location: LCCOMB_X69_Y70_N24
\inst|timer|count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~2_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Equal0~10_combout\,
	datad => \inst|timer|Add0~42_combout\,
	combout => \inst|timer|count~2_combout\);

-- Location: FF_X69_Y70_N25
\inst|timer|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(21));

-- Location: LCCOMB_X68_Y70_N12
\inst|timer|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~44_combout\ = (\inst|timer|count\(22) & (\inst|timer|Add0~43\ $ (GND))) # (!\inst|timer|count\(22) & (!\inst|timer|Add0~43\ & VCC))
-- \inst|timer|Add0~45\ = CARRY((\inst|timer|count\(22) & !\inst|timer|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(22),
	datad => VCC,
	cin => \inst|timer|Add0~43\,
	combout => \inst|timer|Add0~44_combout\,
	cout => \inst|timer|Add0~45\);

-- Location: LCCOMB_X69_Y70_N22
\inst|timer|count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~1_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|timer|Equal0~10_combout\,
	datad => \inst|timer|Add0~44_combout\,
	combout => \inst|timer|count~1_combout\);

-- Location: FF_X69_Y70_N23
\inst|timer|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(22));

-- Location: LCCOMB_X68_Y70_N14
\inst|timer|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~46_combout\ = (\inst|timer|count\(23) & (!\inst|timer|Add0~45\)) # (!\inst|timer|count\(23) & ((\inst|timer|Add0~45\) # (GND)))
-- \inst|timer|Add0~47\ = CARRY((!\inst|timer|Add0~45\) # (!\inst|timer|count\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(23),
	datad => VCC,
	cin => \inst|timer|Add0~45\,
	combout => \inst|timer|Add0~46_combout\,
	cout => \inst|timer|Add0~47\);

-- Location: FF_X68_Y70_N15
\inst|timer|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(23));

-- Location: LCCOMB_X68_Y70_N16
\inst|timer|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~48_combout\ = (\inst|timer|count\(24) & (\inst|timer|Add0~47\ $ (GND))) # (!\inst|timer|count\(24) & (!\inst|timer|Add0~47\ & VCC))
-- \inst|timer|Add0~49\ = CARRY((\inst|timer|count\(24) & !\inst|timer|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(24),
	datad => VCC,
	cin => \inst|timer|Add0~47\,
	combout => \inst|timer|Add0~48_combout\,
	cout => \inst|timer|Add0~49\);

-- Location: LCCOMB_X69_Y70_N26
\inst|timer|count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~0_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~48_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|Equal0~10_combout\,
	datac => \inst|timer|Add0~48_combout\,
	combout => \inst|timer|count~0_combout\);

-- Location: FF_X69_Y70_N27
\inst|timer|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(24));

-- Location: LCCOMB_X68_Y70_N18
\inst|timer|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~50_combout\ = (\inst|timer|count\(25) & (!\inst|timer|Add0~49\)) # (!\inst|timer|count\(25) & ((\inst|timer|Add0~49\) # (GND)))
-- \inst|timer|Add0~51\ = CARRY((!\inst|timer|Add0~49\) # (!\inst|timer|count\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(25),
	datad => VCC,
	cin => \inst|timer|Add0~49\,
	combout => \inst|timer|Add0~50_combout\,
	cout => \inst|timer|Add0~51\);

-- Location: FF_X68_Y70_N19
\inst|timer|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(25));

-- Location: LCCOMB_X68_Y70_N20
\inst|timer|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~52_combout\ = (\inst|timer|count\(26) & (\inst|timer|Add0~51\ $ (GND))) # (!\inst|timer|count\(26) & (!\inst|timer|Add0~51\ & VCC))
-- \inst|timer|Add0~53\ = CARRY((\inst|timer|count\(26) & !\inst|timer|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(26),
	datad => VCC,
	cin => \inst|timer|Add0~51\,
	combout => \inst|timer|Add0~52_combout\,
	cout => \inst|timer|Add0~53\);

-- Location: FF_X68_Y70_N21
\inst|timer|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(26));

-- Location: LCCOMB_X68_Y70_N22
\inst|timer|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~54_combout\ = (\inst|timer|count\(27) & (!\inst|timer|Add0~53\)) # (!\inst|timer|count\(27) & ((\inst|timer|Add0~53\) # (GND)))
-- \inst|timer|Add0~55\ = CARRY((!\inst|timer|Add0~53\) # (!\inst|timer|count\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(27),
	datad => VCC,
	cin => \inst|timer|Add0~53\,
	combout => \inst|timer|Add0~54_combout\,
	cout => \inst|timer|Add0~55\);

-- Location: LCCOMB_X68_Y70_N24
\inst|timer|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~56_combout\ = (\inst|timer|count\(28) & (\inst|timer|Add0~55\ $ (GND))) # (!\inst|timer|count\(28) & (!\inst|timer|Add0~55\ & VCC))
-- \inst|timer|Add0~57\ = CARRY((\inst|timer|count\(28) & !\inst|timer|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(28),
	datad => VCC,
	cin => \inst|timer|Add0~55\,
	combout => \inst|timer|Add0~56_combout\,
	cout => \inst|timer|Add0~57\);

-- Location: FF_X68_Y70_N25
\inst|timer|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(28));

-- Location: LCCOMB_X68_Y70_N28
\inst|timer|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~60_combout\ = (\inst|timer|count\(30) & (\inst|timer|Add0~59\ $ (GND))) # (!\inst|timer|count\(30) & (!\inst|timer|Add0~59\ & VCC))
-- \inst|timer|Add0~61\ = CARRY((\inst|timer|count\(30) & !\inst|timer|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|count\(30),
	datad => VCC,
	cin => \inst|timer|Add0~59\,
	combout => \inst|timer|Add0~60_combout\,
	cout => \inst|timer|Add0~61\);

-- Location: FF_X68_Y70_N29
\inst|timer|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(30));

-- Location: LCCOMB_X68_Y70_N30
\inst|timer|Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Add0~62_combout\ = \inst|timer|count\(31) $ (\inst|timer|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(31),
	cin => \inst|timer|Add0~61\,
	combout => \inst|timer|Add0~62_combout\);

-- Location: FF_X68_Y70_N31
\inst|timer|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(31));

-- Location: LCCOMB_X69_Y71_N4
\inst|timer|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~9_combout\ = (!\inst|timer|count\(0) & (!\inst|timer|count\(2) & (!\inst|timer|count\(31) & !\inst|timer|count\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(0),
	datab => \inst|timer|count\(2),
	datac => \inst|timer|count\(31),
	datad => \inst|timer|count\(1),
	combout => \inst|timer|Equal0~9_combout\);

-- Location: LCCOMB_X69_Y70_N16
\inst|timer|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~1_combout\ = (!\inst|timer|count\(23) & (!\inst|timer|count\(26) & (\inst|timer|count\(24) & !\inst|timer|count\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(23),
	datab => \inst|timer|count\(26),
	datac => \inst|timer|count\(24),
	datad => \inst|timer|count\(25),
	combout => \inst|timer|Equal0~1_combout\);

-- Location: FF_X68_Y70_N23
\inst|timer|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(27));

-- Location: LCCOMB_X69_Y70_N8
\inst|timer|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~0_combout\ = (!\inst|timer|count\(29) & (!\inst|timer|count\(27) & (!\inst|timer|count\(28) & !\inst|timer|count\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(29),
	datab => \inst|timer|count\(27),
	datac => \inst|timer|count\(28),
	datad => \inst|timer|count\(30),
	combout => \inst|timer|Equal0~0_combout\);

-- Location: LCCOMB_X69_Y70_N4
\inst|timer|count~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|count~5_combout\ = (!\inst|timer|Equal0~10_combout\ & \inst|timer|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|timer|Equal0~10_combout\,
	datac => \inst|timer|Add0~36_combout\,
	combout => \inst|timer|count~5_combout\);

-- Location: FF_X69_Y70_N5
\inst|timer|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(18));

-- Location: FF_X68_Y71_N31
\inst|timer|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|count\(15));

-- Location: LCCOMB_X69_Y70_N28
\inst|timer|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~3_combout\ = (\inst|timer|count\(16) & (\inst|timer|count\(18) & (!\inst|timer|count\(15) & !\inst|timer|count\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|count\(16),
	datab => \inst|timer|count\(18),
	datac => \inst|timer|count\(15),
	datad => \inst|timer|count\(17),
	combout => \inst|timer|Equal0~3_combout\);

-- Location: LCCOMB_X69_Y70_N2
\inst|timer|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~4_combout\ = (\inst|timer|Equal0~2_combout\ & (\inst|timer|Equal0~1_combout\ & (\inst|timer|Equal0~0_combout\ & \inst|timer|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|Equal0~2_combout\,
	datab => \inst|timer|Equal0~1_combout\,
	datac => \inst|timer|Equal0~0_combout\,
	datad => \inst|timer|Equal0~3_combout\,
	combout => \inst|timer|Equal0~4_combout\);

-- Location: LCCOMB_X69_Y71_N24
\inst|timer|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|timer|Equal0~10_combout\ = (\inst|timer|Equal0~8_combout\ & (\inst|timer|Equal0~7_combout\ & (\inst|timer|Equal0~9_combout\ & \inst|timer|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|timer|Equal0~8_combout\,
	datab => \inst|timer|Equal0~7_combout\,
	datac => \inst|timer|Equal0~9_combout\,
	datad => \inst|timer|Equal0~4_combout\,
	combout => \inst|timer|Equal0~10_combout\);

-- Location: FF_X69_Y71_N25
\inst|timer|signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \inst|timer|Equal0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|timer|signal~q\);

-- Location: IOIBUF_X115_Y35_N22
\key[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key(3),
	o => \key[3]~input_o\);

-- Location: IOIBUF_X115_Y42_N15
\key[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key(2),
	o => \key[2]~input_o\);

-- Location: IOIBUF_X115_Y53_N15
\key[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key(1),
	o => \key[1]~input_o\);

-- Location: IOIBUF_X115_Y40_N8
\key[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_key(0),
	o => \key[0]~input_o\);

-- Location: IOIBUF_X115_Y16_N8
\sw[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(9),
	o => \sw[9]~input_o\);

-- Location: IOIBUF_X115_Y4_N22
\sw[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(8),
	o => \sw[8]~input_o\);

-- Location: IOIBUF_X115_Y15_N1
\sw[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(7),
	o => \sw[7]~input_o\);

-- Location: IOIBUF_X115_Y10_N1
\sw[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(6),
	o => \sw[6]~input_o\);

-- Location: IOIBUF_X115_Y11_N8
\sw[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(5),
	o => \sw[5]~input_o\);

-- Location: IOIBUF_X115_Y18_N8
\sw[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(4),
	o => \sw[4]~input_o\);

-- Location: IOIBUF_X115_Y13_N8
\sw[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(3),
	o => \sw[3]~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\sw[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(2),
	o => \sw[2]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\sw[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(1),
	o => \sw[1]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\sw[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(0),
	o => \sw[0]~input_o\);

-- Location: IOIBUF_X3_Y0_N15
\sram_dq[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(15),
	o => \sram_dq[15]~input_o\);

-- Location: IOIBUF_X7_Y0_N22
\sram_dq[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(14),
	o => \sram_dq[14]~input_o\);

-- Location: IOIBUF_X3_Y0_N22
\sram_dq[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(13),
	o => \sram_dq[13]~input_o\);

-- Location: IOIBUF_X0_Y7_N8
\sram_dq[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(12),
	o => \sram_dq[12]~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\sram_dq[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(11),
	o => \sram_dq[11]~input_o\);

-- Location: IOIBUF_X0_Y17_N15
\sram_dq[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(10),
	o => \sram_dq[10]~input_o\);

-- Location: IOIBUF_X0_Y22_N22
\sram_dq[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(9),
	o => \sram_dq[9]~input_o\);

-- Location: IOIBUF_X0_Y21_N15
\sram_dq[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(8),
	o => \sram_dq[8]~input_o\);

-- Location: IOIBUF_X20_Y0_N8
\sram_dq[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(7),
	o => \sram_dq[7]~input_o\);

-- Location: IOIBUF_X11_Y0_N15
\sram_dq[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(6),
	o => \sram_dq[6]~input_o\);

-- Location: IOIBUF_X11_Y0_N22
\sram_dq[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(5),
	o => \sram_dq[5]~input_o\);

-- Location: IOIBUF_X7_Y0_N15
\sram_dq[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(4),
	o => \sram_dq[4]~input_o\);

-- Location: IOIBUF_X9_Y0_N15
\sram_dq[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(3),
	o => \sram_dq[3]~input_o\);

-- Location: IOIBUF_X9_Y0_N22
\sram_dq[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(2),
	o => \sram_dq[2]~input_o\);

-- Location: IOIBUF_X1_Y0_N1
\sram_dq[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(1),
	o => \sram_dq[1]~input_o\);

-- Location: IOIBUF_X5_Y0_N8
\sram_dq[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => sram_dq(0),
	o => \sram_dq[0]~input_o\);

ww_sram_we_n <= \sram_we_n~output_o\;

ww_sram_oe_n <= \sram_oe_n~output_o\;

ww_sram_ub_n <= \sram_ub_n~output_o\;

ww_sram_lb_n <= \sram_lb_n~output_o\;

ww_sram_ce_n <= \sram_ce_n~output_o\;

ww_hex0(6) <= \hex0[6]~output_o\;

ww_hex0(5) <= \hex0[5]~output_o\;

ww_hex0(4) <= \hex0[4]~output_o\;

ww_hex0(3) <= \hex0[3]~output_o\;

ww_hex0(2) <= \hex0[2]~output_o\;

ww_hex0(1) <= \hex0[1]~output_o\;

ww_hex0(0) <= \hex0[0]~output_o\;

ww_hex1(6) <= \hex1[6]~output_o\;

ww_hex1(5) <= \hex1[5]~output_o\;

ww_hex1(4) <= \hex1[4]~output_o\;

ww_hex1(3) <= \hex1[3]~output_o\;

ww_hex1(2) <= \hex1[2]~output_o\;

ww_hex1(1) <= \hex1[1]~output_o\;

ww_hex1(0) <= \hex1[0]~output_o\;

ww_hex2(6) <= \hex2[6]~output_o\;

ww_hex2(5) <= \hex2[5]~output_o\;

ww_hex2(4) <= \hex2[4]~output_o\;

ww_hex2(3) <= \hex2[3]~output_o\;

ww_hex2(2) <= \hex2[2]~output_o\;

ww_hex2(1) <= \hex2[1]~output_o\;

ww_hex2(0) <= \hex2[0]~output_o\;

ww_hex3(6) <= \hex3[6]~output_o\;

ww_hex3(5) <= \hex3[5]~output_o\;

ww_hex3(4) <= \hex3[4]~output_o\;

ww_hex3(3) <= \hex3[3]~output_o\;

ww_hex3(2) <= \hex3[2]~output_o\;

ww_hex3(1) <= \hex3[1]~output_o\;

ww_hex3(0) <= \hex3[0]~output_o\;

ww_hex4(6) <= \hex4[6]~output_o\;

ww_hex4(5) <= \hex4[5]~output_o\;

ww_hex4(4) <= \hex4[4]~output_o\;

ww_hex4(3) <= \hex4[3]~output_o\;

ww_hex4(2) <= \hex4[2]~output_o\;

ww_hex4(1) <= \hex4[1]~output_o\;

ww_hex4(0) <= \hex4[0]~output_o\;

ww_hex5(6) <= \hex5[6]~output_o\;

ww_hex5(5) <= \hex5[5]~output_o\;

ww_hex5(4) <= \hex5[4]~output_o\;

ww_hex5(3) <= \hex5[3]~output_o\;

ww_hex5(2) <= \hex5[2]~output_o\;

ww_hex5(1) <= \hex5[1]~output_o\;

ww_hex5(0) <= \hex5[0]~output_o\;

ww_hex6(6) <= \hex6[6]~output_o\;

ww_hex6(5) <= \hex6[5]~output_o\;

ww_hex6(4) <= \hex6[4]~output_o\;

ww_hex6(3) <= \hex6[3]~output_o\;

ww_hex6(2) <= \hex6[2]~output_o\;

ww_hex6(1) <= \hex6[1]~output_o\;

ww_hex6(0) <= \hex6[0]~output_o\;

ww_hex7(6) <= \hex7[6]~output_o\;

ww_hex7(5) <= \hex7[5]~output_o\;

ww_hex7(4) <= \hex7[4]~output_o\;

ww_hex7(3) <= \hex7[3]~output_o\;

ww_hex7(2) <= \hex7[2]~output_o\;

ww_hex7(1) <= \hex7[1]~output_o\;

ww_hex7(0) <= \hex7[0]~output_o\;

ww_ledg(8) <= \ledg[8]~output_o\;

ww_ledg(7) <= \ledg[7]~output_o\;

ww_ledg(6) <= \ledg[6]~output_o\;

ww_ledg(5) <= \ledg[5]~output_o\;

ww_ledg(4) <= \ledg[4]~output_o\;

ww_ledg(3) <= \ledg[3]~output_o\;

ww_ledg(2) <= \ledg[2]~output_o\;

ww_ledg(1) <= \ledg[1]~output_o\;

ww_ledg(0) <= \ledg[0]~output_o\;

ww_ledr(17) <= \ledr[17]~output_o\;

ww_ledr(16) <= \ledr[16]~output_o\;

ww_ledr(15) <= \ledr[15]~output_o\;

ww_ledr(14) <= \ledr[14]~output_o\;

ww_ledr(13) <= \ledr[13]~output_o\;

ww_ledr(12) <= \ledr[12]~output_o\;

ww_ledr(11) <= \ledr[11]~output_o\;

ww_ledr(10) <= \ledr[10]~output_o\;

ww_ledr(9) <= \ledr[9]~output_o\;

ww_ledr(8) <= \ledr[8]~output_o\;

ww_ledr(7) <= \ledr[7]~output_o\;

ww_ledr(6) <= \ledr[6]~output_o\;

ww_ledr(5) <= \ledr[5]~output_o\;

ww_ledr(4) <= \ledr[4]~output_o\;

ww_ledr(3) <= \ledr[3]~output_o\;

ww_ledr(2) <= \ledr[2]~output_o\;

ww_ledr(1) <= \ledr[1]~output_o\;

ww_ledr(0) <= \ledr[0]~output_o\;

ww_sram_addr(19) <= \sram_addr[19]~output_o\;

ww_sram_addr(18) <= \sram_addr[18]~output_o\;

ww_sram_addr(17) <= \sram_addr[17]~output_o\;

ww_sram_addr(16) <= \sram_addr[16]~output_o\;

ww_sram_addr(15) <= \sram_addr[15]~output_o\;

ww_sram_addr(14) <= \sram_addr[14]~output_o\;

ww_sram_addr(13) <= \sram_addr[13]~output_o\;

ww_sram_addr(12) <= \sram_addr[12]~output_o\;

ww_sram_addr(11) <= \sram_addr[11]~output_o\;

ww_sram_addr(10) <= \sram_addr[10]~output_o\;

ww_sram_addr(9) <= \sram_addr[9]~output_o\;

ww_sram_addr(8) <= \sram_addr[8]~output_o\;

ww_sram_addr(7) <= \sram_addr[7]~output_o\;

ww_sram_addr(6) <= \sram_addr[6]~output_o\;

ww_sram_addr(5) <= \sram_addr[5]~output_o\;

ww_sram_addr(4) <= \sram_addr[4]~output_o\;

ww_sram_addr(3) <= \sram_addr[3]~output_o\;

ww_sram_addr(2) <= \sram_addr[2]~output_o\;

ww_sram_addr(1) <= \sram_addr[1]~output_o\;

ww_sram_addr(0) <= \sram_addr[0]~output_o\;

sram_dq(15) <= \sram_dq[15]~output_o\;

sram_dq(14) <= \sram_dq[14]~output_o\;

sram_dq(13) <= \sram_dq[13]~output_o\;

sram_dq(12) <= \sram_dq[12]~output_o\;

sram_dq(11) <= \sram_dq[11]~output_o\;

sram_dq(10) <= \sram_dq[10]~output_o\;

sram_dq(9) <= \sram_dq[9]~output_o\;

sram_dq(8) <= \sram_dq[8]~output_o\;

sram_dq(7) <= \sram_dq[7]~output_o\;

sram_dq(6) <= \sram_dq[6]~output_o\;

sram_dq(5) <= \sram_dq[5]~output_o\;

sram_dq(4) <= \sram_dq[4]~output_o\;

sram_dq(3) <= \sram_dq[3]~output_o\;

sram_dq(2) <= \sram_dq[2]~output_o\;

sram_dq(1) <= \sram_dq[1]~output_o\;

sram_dq(0) <= \sram_dq[0]~output_o\;
END structure;


