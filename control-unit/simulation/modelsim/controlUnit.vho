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
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "12/01/2023 09:54:25"

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

ENTITY 	controlUnit IS
    PORT (
	opCode : IN std_logic_vector(4 DOWNTO 0);
	controlSignals : BUFFER std_logic_vector(21 DOWNTO 0)
	);
END controlUnit;

-- Design Ports Information
-- controlSignals[0]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[1]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[2]	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[3]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[4]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[5]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[6]	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[7]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[8]	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[9]	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[10]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[11]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[12]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[13]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[14]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[15]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[16]	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[17]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[18]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[19]	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[20]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- controlSignals[21]	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opCode[0]	=>  Location: PIN_P22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opCode[3]	=>  Location: PIN_R15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opCode[4]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opCode[1]	=>  Location: PIN_R22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opCode[2]	=>  Location: PIN_T22,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF controlUnit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_opCode : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_controlSignals : std_logic_vector(21 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \opCode[1]~input_o\ : std_logic;
SIGNAL \opCode[2]~input_o\ : std_logic;
SIGNAL \opCode[4]~input_o\ : std_logic;
SIGNAL \opCode[3]~input_o\ : std_logic;
SIGNAL \opCode[0]~input_o\ : std_logic;
SIGNAL \Ram0~0_combout\ : std_logic;
SIGNAL \Ram0~1_combout\ : std_logic;
SIGNAL \Ram0~2_combout\ : std_logic;
SIGNAL \Ram0~3_combout\ : std_logic;
SIGNAL \Ram0~4_combout\ : std_logic;
SIGNAL \Ram0~5_combout\ : std_logic;
SIGNAL \Ram0~21_combout\ : std_logic;
SIGNAL \Ram0~6_combout\ : std_logic;
SIGNAL \Ram0~7_combout\ : std_logic;
SIGNAL \Ram0~8_combout\ : std_logic;
SIGNAL \Ram0~20_combout\ : std_logic;
SIGNAL \Ram0~9_combout\ : std_logic;
SIGNAL \Ram0~19_combout\ : std_logic;
SIGNAL \Ram0~10_combout\ : std_logic;
SIGNAL \Ram0~11_combout\ : std_logic;
SIGNAL \Ram0~18_combout\ : std_logic;
SIGNAL \Ram0~17_combout\ : std_logic;
SIGNAL \Ram0~12_combout\ : std_logic;
SIGNAL \Ram0~13_combout\ : std_logic;
SIGNAL \Ram0~14_combout\ : std_logic;
SIGNAL \Ram0~15_combout\ : std_logic;
SIGNAL \Ram0~16_combout\ : std_logic;
SIGNAL \ALT_INV_opCode[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_opCode[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_opCode[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_opCode[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_opCode[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Ram0~3_combout\ : std_logic;

BEGIN

ww_opCode <= opCode;
controlSignals <= ww_controlSignals;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_opCode[2]~input_o\ <= NOT \opCode[2]~input_o\;
\ALT_INV_opCode[1]~input_o\ <= NOT \opCode[1]~input_o\;
\ALT_INV_opCode[4]~input_o\ <= NOT \opCode[4]~input_o\;
\ALT_INV_opCode[3]~input_o\ <= NOT \opCode[3]~input_o\;
\ALT_INV_opCode[0]~input_o\ <= NOT \opCode[0]~input_o\;
\ALT_INV_Ram0~3_combout\ <= NOT \Ram0~3_combout\;

-- Location: IOOBUF_X89_Y37_N5
\controlSignals[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~0_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(0));

-- Location: IOOBUF_X89_Y35_N45
\controlSignals[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~1_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(1));

-- Location: IOOBUF_X89_Y36_N56
\controlSignals[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~2_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(2));

-- Location: IOOBUF_X89_Y35_N62
\controlSignals[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Ram0~3_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(3));

-- Location: IOOBUF_X89_Y37_N56
\controlSignals[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~4_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(4));

-- Location: IOOBUF_X89_Y37_N39
\controlSignals[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~5_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(5));

-- Location: IOOBUF_X89_Y8_N39
\controlSignals[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~21_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(6));

-- Location: IOOBUF_X89_Y9_N5
\controlSignals[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~6_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(7));

-- Location: IOOBUF_X89_Y9_N22
\controlSignals[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~7_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(8));

-- Location: IOOBUF_X89_Y9_N39
\controlSignals[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~8_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(9));

-- Location: IOOBUF_X89_Y8_N22
\controlSignals[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~20_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(10));

-- Location: IOOBUF_X89_Y37_N22
\controlSignals[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~9_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(11));

-- Location: IOOBUF_X89_Y38_N39
\controlSignals[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~19_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(12));

-- Location: IOOBUF_X89_Y38_N22
\controlSignals[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~10_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(13));

-- Location: IOOBUF_X89_Y36_N22
\controlSignals[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~11_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(14));

-- Location: IOOBUF_X89_Y38_N56
\controlSignals[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~18_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(15));

-- Location: IOOBUF_X89_Y36_N5
\controlSignals[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~17_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(16));

-- Location: IOOBUF_X89_Y35_N79
\controlSignals[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~12_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(17));

-- Location: IOOBUF_X89_Y35_N96
\controlSignals[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~13_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(18));

-- Location: IOOBUF_X89_Y36_N39
\controlSignals[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~14_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(19));

-- Location: IOOBUF_X89_Y9_N56
\controlSignals[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~15_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(20));

-- Location: IOOBUF_X89_Y38_N5
\controlSignals[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Ram0~16_combout\,
	devoe => ww_devoe,
	o => ww_controlSignals(21));

-- Location: IOIBUF_X89_Y6_N55
\opCode[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opCode(1),
	o => \opCode[1]~input_o\);

-- Location: IOIBUF_X89_Y6_N38
\opCode[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opCode(2),
	o => \opCode[2]~input_o\);

-- Location: IOIBUF_X89_Y8_N4
\opCode[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opCode(4),
	o => \opCode[4]~input_o\);

-- Location: IOIBUF_X89_Y6_N21
\opCode[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opCode(3),
	o => \opCode[3]~input_o\);

-- Location: IOIBUF_X89_Y8_N55
\opCode[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opCode(0),
	o => \opCode[0]~input_o\);

-- Location: LABCELL_X88_Y35_N0
\Ram0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~0_combout\ = ( \opCode[0]~input_o\ & ( (!\opCode[4]~input_o\ & ((!\opCode[3]~input_o\) # ((\opCode[1]~input_o\ & \opCode[2]~input_o\)))) # (\opCode[4]~input_o\ & (!\opCode[1]~input_o\ & (!\opCode[2]~input_o\ & \opCode[3]~input_o\))) ) ) # ( 
-- !\opCode[0]~input_o\ & ( (\opCode[3]~input_o\ & ((!\opCode[1]~input_o\ & ((!\opCode[2]~input_o\) # (!\opCode[4]~input_o\))) # (\opCode[1]~input_o\ & (!\opCode[2]~input_o\ & !\opCode[4]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011101000000000001110100011110000000110001111000000011000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[4]~input_o\,
	datad => \ALT_INV_opCode[3]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~0_combout\);

-- Location: LABCELL_X88_Y35_N3
\Ram0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~1_combout\ = ( \opCode[0]~input_o\ & ( (!\opCode[2]~input_o\ & (\opCode[1]~input_o\ & ((!\opCode[4]~input_o\)))) # (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ & ((\opCode[4]~input_o\) # (\opCode[1]~input_o\)))) ) ) # ( !\opCode[0]~input_o\ & ( 
-- (!\opCode[3]~input_o\ & (!\opCode[1]~input_o\ $ (((!\opCode[4]~input_o\) # (\opCode[2]~input_o\))))) # (\opCode[3]~input_o\ & (!\opCode[1]~input_o\ & ((!\opCode[4]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101101010010000010110101001000001010100001100000101010000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~1_combout\);

-- Location: LABCELL_X88_Y35_N36
\Ram0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~2_combout\ = ( \opCode[0]~input_o\ & ( (!\opCode[2]~input_o\ & (!\opCode[1]~input_o\ & (\opCode[3]~input_o\ & \opCode[4]~input_o\))) # (\opCode[2]~input_o\ & ((!\opCode[3]~input_o\) # ((\opCode[1]~input_o\ & !\opCode[4]~input_o\)))) ) ) # ( 
-- !\opCode[0]~input_o\ & ( (!\opCode[1]~input_o\ & (!\opCode[2]~input_o\ $ (((!\opCode[3]~input_o\ & !\opCode[4]~input_o\))))) # (\opCode[1]~input_o\ & (\opCode[2]~input_o\ & ((!\opCode[3]~input_o\) # (!\opCode[4]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011100110011000001110011001100000110001001110000011000100111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~2_combout\);

-- Location: LABCELL_X88_Y35_N39
\Ram0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~3_combout\ = ( \opCode[0]~input_o\ & ( (!\opCode[3]~input_o\) # (\opCode[4]~input_o\) ) ) # ( !\opCode[0]~input_o\ & ( (!\opCode[3]~input_o\ & (((!\opCode[4]~input_o\) # (\opCode[2]~input_o\)) # (\opCode[1]~input_o\))) # (\opCode[3]~input_o\ & 
-- (((!\opCode[1]~input_o\ & !\opCode[2]~input_o\)) # (\opCode[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100001111111111110000111111111110000111111111111000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~3_combout\);

-- Location: LABCELL_X88_Y35_N42
\Ram0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~4_combout\ = ( !\opCode[0]~input_o\ & ( (!\opCode[1]~input_o\ & (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ & \opCode[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000100000000000000010000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~4_combout\);

-- Location: LABCELL_X88_Y35_N45
\Ram0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~5_combout\ = ( \opCode[0]~input_o\ & ( (\opCode[1]~input_o\ & (!\opCode[2]~input_o\ & (!\opCode[3]~input_o\ & \opCode[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000010000000000000001000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~5_combout\);

-- Location: LABCELL_X88_Y8_N39
\Ram0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~21_combout\ = ( \opCode[0]~input_o\ & ( \opCode[4]~input_o\ & ( (!\opCode[2]~input_o\ & !\opCode[3]~input_o\) ) ) ) # ( !\opCode[0]~input_o\ & ( \opCode[4]~input_o\ & ( (\opCode[2]~input_o\ & (\opCode[3]~input_o\ & !\opCode[1]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000101000000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[1]~input_o\,
	datae => \ALT_INV_opCode[0]~input_o\,
	dataf => \ALT_INV_opCode[4]~input_o\,
	combout => \Ram0~21_combout\);

-- Location: LABCELL_X88_Y9_N33
\Ram0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~6_combout\ = ( \opCode[2]~input_o\ & ( !\opCode[0]~input_o\ & ( (!\opCode[3]~input_o\ & (\opCode[1]~input_o\ & !\opCode[4]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000010100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[3]~input_o\,
	datac => \ALT_INV_opCode[1]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	datae => \ALT_INV_opCode[2]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~6_combout\);

-- Location: LABCELL_X88_Y9_N39
\Ram0~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~7_combout\ = ( \opCode[0]~input_o\ & ( (!\opCode[4]~input_o\ & (!\opCode[1]~input_o\ & (\opCode[2]~input_o\ & !\opCode[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000001000000000000000100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[4]~input_o\,
	datab => \ALT_INV_opCode[1]~input_o\,
	datac => \ALT_INV_opCode[2]~input_o\,
	datad => \ALT_INV_opCode[3]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~7_combout\);

-- Location: LABCELL_X88_Y9_N45
\Ram0~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~8_combout\ = ( !\opCode[2]~input_o\ & ( !\opCode[0]~input_o\ & ( (\opCode[3]~input_o\ & (\opCode[1]~input_o\ & \opCode[4]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[3]~input_o\,
	datac => \ALT_INV_opCode[1]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	datae => \ALT_INV_opCode[2]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~8_combout\);

-- Location: LABCELL_X88_Y8_N0
\Ram0~20\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~20_combout\ = ( \opCode[0]~input_o\ & ( \opCode[4]~input_o\ & ( (\opCode[1]~input_o\ & (\opCode[3]~input_o\ & !\opCode[2]~input_o\)) ) ) ) # ( !\opCode[0]~input_o\ & ( \opCode[4]~input_o\ & ( (!\opCode[1]~input_o\ & (\opCode[3]~input_o\ & 
-- \opCode[2]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000010000000100001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[3]~input_o\,
	datac => \ALT_INV_opCode[2]~input_o\,
	datae => \ALT_INV_opCode[0]~input_o\,
	dataf => \ALT_INV_opCode[4]~input_o\,
	combout => \Ram0~20_combout\);

-- Location: LABCELL_X88_Y35_N51
\Ram0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~9_combout\ = ( \opCode[3]~input_o\ & ( \opCode[0]~input_o\ & ( (!\opCode[2]~input_o\ & !\opCode[4]~input_o\) ) ) ) # ( !\opCode[3]~input_o\ & ( \opCode[0]~input_o\ & ( !\opCode[4]~input_o\ $ (((!\opCode[1]~input_o\ & \opCode[2]~input_o\))) ) ) ) # ( 
-- \opCode[3]~input_o\ & ( !\opCode[0]~input_o\ & ( !\opCode[4]~input_o\ ) ) ) # ( !\opCode[3]~input_o\ & ( !\opCode[0]~input_o\ & ( (!\opCode[2]~input_o\ $ (!\opCode[4]~input_o\)) # (\opCode[1]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101111111110101111111110000000011110101000010101111000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datac => \ALT_INV_opCode[2]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	datae => \ALT_INV_opCode[3]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~9_combout\);

-- Location: LABCELL_X88_Y35_N21
\Ram0~19\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~19_combout\ = ( \opCode[0]~input_o\ & ( (!\opCode[1]~input_o\ & (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ & \opCode[4]~input_o\))) ) ) # ( !\opCode[0]~input_o\ & ( (\opCode[1]~input_o\ & (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ & 
-- \opCode[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010000000000000001000000000000001000000000000000100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~19_combout\);

-- Location: LABCELL_X88_Y35_N54
\Ram0~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~10_combout\ = ( \opCode[0]~input_o\ & ( (!\opCode[1]~input_o\ & (!\opCode[2]~input_o\ & (\opCode[4]~input_o\ & \opCode[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000010000000000000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[4]~input_o\,
	datad => \ALT_INV_opCode[3]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~10_combout\);

-- Location: LABCELL_X88_Y35_N57
\Ram0~11\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~11_combout\ = ( !\opCode[0]~input_o\ & ( (!\opCode[1]~input_o\ & (!\opCode[2]~input_o\ & (\opCode[3]~input_o\ & \opCode[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001000000000000000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~11_combout\);

-- Location: LABCELL_X88_Y35_N18
\Ram0~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~18_combout\ = ( \opCode[0]~input_o\ & ( (\opCode[4]~input_o\ & (!\opCode[3]~input_o\ & ((!\opCode[2]~input_o\) # (\opCode[1]~input_o\)))) ) ) # ( !\opCode[0]~input_o\ & ( (!\opCode[1]~input_o\ & (\opCode[2]~input_o\ & (\opCode[4]~input_o\ & 
-- \opCode[3]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000010000000000000001000001101000000000000110100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[4]~input_o\,
	datad => \ALT_INV_opCode[3]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~18_combout\);

-- Location: LABCELL_X88_Y35_N15
\Ram0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~17_combout\ = ( \opCode[0]~input_o\ & ( (\opCode[4]~input_o\ & ((!\opCode[2]~input_o\ & ((!\opCode[3]~input_o\))) # (\opCode[2]~input_o\ & (!\opCode[1]~input_o\ & \opCode[3]~input_o\)))) ) ) # ( !\opCode[0]~input_o\ & ( (\opCode[4]~input_o\ & 
-- ((!\opCode[1]~input_o\ & (\opCode[2]~input_o\)) # (\opCode[1]~input_o\ & (!\opCode[2]~input_o\ & !\opCode[3]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001100010000000000110001000000000110000100000000011000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~17_combout\);

-- Location: LABCELL_X88_Y35_N30
\Ram0~12\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~12_combout\ = ( \opCode[0]~input_o\ & ( (\opCode[1]~input_o\ & (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ $ (!\opCode[4]~input_o\)))) ) ) # ( !\opCode[0]~input_o\ & ( (!\opCode[1]~input_o\ & (!\opCode[2]~input_o\ & (!\opCode[3]~input_o\ & 
-- \opCode[4]~input_o\))) # (\opCode[1]~input_o\ & (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ $ (!\opCode[4]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000110010000000000011001000000000001000100000000000100010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~12_combout\);

-- Location: LABCELL_X88_Y35_N33
\Ram0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~13_combout\ = ( \opCode[0]~input_o\ & ( (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ & \opCode[4]~input_o\)) ) ) # ( !\opCode[0]~input_o\ & ( (!\opCode[1]~input_o\ & (!\opCode[2]~input_o\ & (\opCode[3]~input_o\ & !\opCode[4]~input_o\))) # 
-- (\opCode[1]~input_o\ & (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ & \opCode[4]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000010000000010000001000000000000001100000000000000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[4]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~13_combout\);

-- Location: LABCELL_X88_Y35_N6
\Ram0~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~14_combout\ = ( \opCode[3]~input_o\ & ( \opCode[0]~input_o\ & ( (\opCode[4]~input_o\ & (\opCode[2]~input_o\ & !\opCode[1]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001000000010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[4]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[1]~input_o\,
	datae => \ALT_INV_opCode[3]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~14_combout\);

-- Location: LABCELL_X88_Y9_N36
\Ram0~15\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~15_combout\ = ( !\opCode[0]~input_o\ & ( (\opCode[4]~input_o\ & (!\opCode[1]~input_o\ & (\opCode[3]~input_o\ & \opCode[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000100000000000000010000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[4]~input_o\,
	datab => \ALT_INV_opCode[1]~input_o\,
	datac => \ALT_INV_opCode[3]~input_o\,
	datad => \ALT_INV_opCode[2]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~15_combout\);

-- Location: LABCELL_X88_Y35_N12
\Ram0~16\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ram0~16_combout\ = ( \opCode[0]~input_o\ & ( (!\opCode[2]~input_o\ & (((!\opCode[3]~input_o\) # (\opCode[4]~input_o\)))) # (\opCode[2]~input_o\ & (!\opCode[3]~input_o\ $ (((\opCode[1]~input_o\ & !\opCode[4]~input_o\))))) ) ) # ( !\opCode[0]~input_o\ & ( 
-- (!\opCode[1]~input_o\ & (((\opCode[2]~input_o\ & !\opCode[3]~input_o\)) # (\opCode[4]~input_o\))) # (\opCode[1]~input_o\ & ((!\opCode[3]~input_o\) # (!\opCode[2]~input_o\ $ (!\opCode[4]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111111100011110011111110001111011101111000111001110111100011100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opCode[1]~input_o\,
	datab => \ALT_INV_opCode[2]~input_o\,
	datac => \ALT_INV_opCode[4]~input_o\,
	datad => \ALT_INV_opCode[3]~input_o\,
	dataf => \ALT_INV_opCode[0]~input_o\,
	combout => \Ram0~16_combout\);

-- Location: LABCELL_X80_Y74_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


