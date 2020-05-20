--Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
--Date        : Wed Apr  1 13:04:40 2020
--Host        : DESKTOP-813AKL3 running 64-bit major release  (build 9200)
--Command     : generate_target MercuryXU1_wrapper.bd
--Design      : MercuryXU1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MercuryXU1_wrapper is
  port (
    GPIO_tri_o : out STD_LOGIC_VECTOR ( 19 downto 0 );
    emio_spi0_ss_in : in STD_LOGIC;
    emio_spi0_ss_out : out STD_LOGIC;
    emio_spi0_ss_tri : out STD_LOGIC;
    pl_clk1 : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC;
    ps_master_i2c_scl_io : inout STD_LOGIC;
    ps_master_i2c_sda_io : inout STD_LOGIC;
    ps_spi_0_io0_io : inout STD_LOGIC;
    ps_spi_0_io1_io : inout STD_LOGIC;
    ps_spi_0_sck_io : inout STD_LOGIC;
    ps_spi_1_io0_io : inout STD_LOGIC;
    ps_spi_1_io1_io : inout STD_LOGIC;
    ps_spi_1_sck_io : inout STD_LOGIC;
    ps_spi_1_ss_io : inout STD_LOGIC
  );
end MercuryXU1_wrapper;

architecture STRUCTURE of MercuryXU1_wrapper is
  component MercuryXU1 is
  port (
    pl_clk1 : out STD_LOGIC;
    pl_resetn0 : out STD_LOGIC;
    emio_spi0_ss_out : out STD_LOGIC;
    emio_spi0_ss_tri : out STD_LOGIC;
    emio_spi0_ss_in : in STD_LOGIC;
    ps_spi_1_sck_i : in STD_LOGIC;
    ps_spi_1_sck_o : out STD_LOGIC;
    ps_spi_1_sck_t : out STD_LOGIC;
    ps_spi_1_io0_i : in STD_LOGIC;
    ps_spi_1_io0_o : out STD_LOGIC;
    ps_spi_1_io0_t : out STD_LOGIC;
    ps_spi_1_io1_i : in STD_LOGIC;
    ps_spi_1_io1_o : out STD_LOGIC;
    ps_spi_1_io1_t : out STD_LOGIC;
    ps_spi_1_ss_i : in STD_LOGIC;
    ps_spi_1_ss_o : out STD_LOGIC;
    ps_spi_1_ss_t : out STD_LOGIC;
    ps_master_i2c_scl_i : in STD_LOGIC;
    ps_master_i2c_scl_o : out STD_LOGIC;
    ps_master_i2c_scl_t : out STD_LOGIC;
    ps_master_i2c_sda_i : in STD_LOGIC;
    ps_master_i2c_sda_o : out STD_LOGIC;
    ps_master_i2c_sda_t : out STD_LOGIC;
    GPIO_tri_o : out STD_LOGIC_VECTOR ( 19 downto 0 );
    ps_spi_0_sck_i : in STD_LOGIC;
    ps_spi_0_sck_o : out STD_LOGIC;
    ps_spi_0_sck_t : out STD_LOGIC;
    ps_spi_0_io0_i : in STD_LOGIC;
    ps_spi_0_io0_o : out STD_LOGIC;
    ps_spi_0_io0_t : out STD_LOGIC;
    ps_spi_0_io1_i : in STD_LOGIC;
    ps_spi_0_io1_o : out STD_LOGIC;
    ps_spi_0_io1_t : out STD_LOGIC
  );
  end component MercuryXU1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal ps_master_i2c_scl_i : STD_LOGIC;
  signal ps_master_i2c_scl_o : STD_LOGIC;
  signal ps_master_i2c_scl_t : STD_LOGIC;
  signal ps_master_i2c_sda_i : STD_LOGIC;
  signal ps_master_i2c_sda_o : STD_LOGIC;
  signal ps_master_i2c_sda_t : STD_LOGIC;
  signal ps_spi_0_io0_i : STD_LOGIC;
  signal ps_spi_0_io0_o : STD_LOGIC;
  signal ps_spi_0_io0_t : STD_LOGIC;
  signal ps_spi_0_io1_i : STD_LOGIC;
  signal ps_spi_0_io1_o : STD_LOGIC;
  signal ps_spi_0_io1_t : STD_LOGIC;
  signal ps_spi_0_sck_i : STD_LOGIC;
  signal ps_spi_0_sck_o : STD_LOGIC;
  signal ps_spi_0_sck_t : STD_LOGIC;
  signal ps_spi_1_io0_i : STD_LOGIC;
  signal ps_spi_1_io0_o : STD_LOGIC;
  signal ps_spi_1_io0_t : STD_LOGIC;
  signal ps_spi_1_io1_i : STD_LOGIC;
  signal ps_spi_1_io1_o : STD_LOGIC;
  signal ps_spi_1_io1_t : STD_LOGIC;
  signal ps_spi_1_sck_i : STD_LOGIC;
  signal ps_spi_1_sck_o : STD_LOGIC;
  signal ps_spi_1_sck_t : STD_LOGIC;
  signal ps_spi_1_ss_i : STD_LOGIC;
  signal ps_spi_1_ss_o : STD_LOGIC;
  signal ps_spi_1_ss_t : STD_LOGIC;
begin
MercuryXU1_i: component MercuryXU1
     port map (
      GPIO_tri_o(19 downto 0) => GPIO_tri_o(19 downto 0),
      emio_spi0_ss_in => emio_spi0_ss_in,
      emio_spi0_ss_out => emio_spi0_ss_out,
      emio_spi0_ss_tri => emio_spi0_ss_tri,
      pl_clk1 => pl_clk1,
      pl_resetn0 => pl_resetn0,
      ps_master_i2c_scl_i => ps_master_i2c_scl_i,
      ps_master_i2c_scl_o => ps_master_i2c_scl_o,
      ps_master_i2c_scl_t => ps_master_i2c_scl_t,
      ps_master_i2c_sda_i => ps_master_i2c_sda_i,
      ps_master_i2c_sda_o => ps_master_i2c_sda_o,
      ps_master_i2c_sda_t => ps_master_i2c_sda_t,
      ps_spi_0_io0_i => ps_spi_0_io0_i,
      ps_spi_0_io0_o => ps_spi_0_io0_o,
      ps_spi_0_io0_t => ps_spi_0_io0_t,
      ps_spi_0_io1_i => ps_spi_0_io1_i,
      ps_spi_0_io1_o => ps_spi_0_io1_o,
      ps_spi_0_io1_t => ps_spi_0_io1_t,
      ps_spi_0_sck_i => ps_spi_0_sck_i,
      ps_spi_0_sck_o => ps_spi_0_sck_o,
      ps_spi_0_sck_t => ps_spi_0_sck_t,
      ps_spi_1_io0_i => ps_spi_1_io0_i,
      ps_spi_1_io0_o => ps_spi_1_io0_o,
      ps_spi_1_io0_t => ps_spi_1_io0_t,
      ps_spi_1_io1_i => ps_spi_1_io1_i,
      ps_spi_1_io1_o => ps_spi_1_io1_o,
      ps_spi_1_io1_t => ps_spi_1_io1_t,
      ps_spi_1_sck_i => ps_spi_1_sck_i,
      ps_spi_1_sck_o => ps_spi_1_sck_o,
      ps_spi_1_sck_t => ps_spi_1_sck_t,
      ps_spi_1_ss_i => ps_spi_1_ss_i,
      ps_spi_1_ss_o => ps_spi_1_ss_o,
      ps_spi_1_ss_t => ps_spi_1_ss_t
    );
ps_master_i2c_scl_iobuf: component IOBUF
     port map (
      I => ps_master_i2c_scl_o,
      IO => ps_master_i2c_scl_io,
      O => ps_master_i2c_scl_i,
      T => ps_master_i2c_scl_t
    );
ps_master_i2c_sda_iobuf: component IOBUF
     port map (
      I => ps_master_i2c_sda_o,
      IO => ps_master_i2c_sda_io,
      O => ps_master_i2c_sda_i,
      T => ps_master_i2c_sda_t
    );
ps_spi_0_io0_iobuf: component IOBUF
     port map (
      I => ps_spi_0_io0_o,
      IO => ps_spi_0_io0_io,
      O => ps_spi_0_io0_i,
      T => ps_spi_0_io0_t
    );
ps_spi_0_io1_iobuf: component IOBUF
     port map (
      I => ps_spi_0_io1_o,
      IO => ps_spi_0_io1_io,
      O => ps_spi_0_io1_i,
      T => ps_spi_0_io1_t
    );
ps_spi_0_sck_iobuf: component IOBUF
     port map (
      I => ps_spi_0_sck_o,
      IO => ps_spi_0_sck_io,
      O => ps_spi_0_sck_i,
      T => ps_spi_0_sck_t
    );
ps_spi_1_io0_iobuf: component IOBUF
     port map (
      I => ps_spi_1_io0_o,
      IO => ps_spi_1_io0_io,
      O => ps_spi_1_io0_i,
      T => ps_spi_1_io0_t
    );
ps_spi_1_io1_iobuf: component IOBUF
     port map (
      I => ps_spi_1_io1_o,
      IO => ps_spi_1_io1_io,
      O => ps_spi_1_io1_i,
      T => ps_spi_1_io1_t
    );
ps_spi_1_sck_iobuf: component IOBUF
     port map (
      I => ps_spi_1_sck_o,
      IO => ps_spi_1_sck_io,
      O => ps_spi_1_sck_i,
      T => ps_spi_1_sck_t
    );
ps_spi_1_ss_iobuf: component IOBUF
     port map (
      I => ps_spi_1_ss_o,
      IO => ps_spi_1_ss_io,
      O => ps_spi_1_ss_i,
      T => ps_spi_1_ss_t
    );
end STRUCTURE;
