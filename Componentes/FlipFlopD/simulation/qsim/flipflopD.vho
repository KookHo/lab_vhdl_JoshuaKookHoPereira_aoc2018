-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

-- DATE "10/26/2018 11:41:07"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	flipflopD IS
    PORT (
	D : IN std_logic;
	clock : IN std_logic;
	Q0 : OUT std_logic;
	Q1 : OUT std_logic
	);
END flipflopD;

ARCHITECTURE structure OF flipflopD IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_D : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_Q0 : std_logic;
SIGNAL ww_Q1 : std_logic;
SIGNAL \Q0~output_o\ : std_logic;
SIGNAL \Q1~output_o\ : std_logic;
SIGNAL \D~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \G9|SA~1_combout\ : std_logic;
SIGNAL \G7|SA~combout\ : std_logic;
SIGNAL \ALT_INV_clock~input_o\ : std_logic;
SIGNAL \ALT_INV_D~input_o\ : std_logic;
SIGNAL \G9|ALT_INV_SA~1_combout\ : std_logic;

BEGIN

ww_D <= D;
ww_clock <= clock;
Q0 <= ww_Q0;
Q1 <= ww_Q1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_clock~input_o\ <= NOT \clock~input_o\;
\ALT_INV_D~input_o\ <= NOT \D~input_o\;
\G9|ALT_INV_SA~1_combout\ <= NOT \G9|SA~1_combout\;

\Q0~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \G9|ALT_INV_SA~1_combout\,
	devoe => ww_devoe,
	o => \Q0~output_o\);

\Q1~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \G7|SA~combout\,
	devoe => ww_devoe,
	o => \Q1~output_o\);

\D~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_D,
	o => \D~input_o\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\G9|SA~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \G9|SA~1_combout\ = (!\clock~input_o\ & (\G9|SA~1_combout\)) # (\clock~input_o\ & ((\D~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001101010011010100110101001101010011010100110101001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G9|ALT_INV_SA~1_combout\,
	datab => \ALT_INV_D~input_o\,
	datac => \ALT_INV_clock~input_o\,
	combout => \G9|SA~1_combout\);

\G7|SA\ : cyclonev_lcell_comb
-- Equation(s):
-- \G7|SA~combout\ = ((\D~input_o\ & \clock~input_o\)) # (\G9|SA~1_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011101010111010101110101011101010111010101110101011101010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \G9|ALT_INV_SA~1_combout\,
	datab => \ALT_INV_D~input_o\,
	datac => \ALT_INV_clock~input_o\,
	combout => \G7|SA~combout\);

ww_Q0 <= \Q0~output_o\;

ww_Q1 <= \Q1~output_o\;
END structure;


