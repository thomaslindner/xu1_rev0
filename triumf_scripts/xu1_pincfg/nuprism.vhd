---------------------------------------------------------------------------------------------------
-- Project          : Mercury+ XU1 Reference Design
-- File description : Top Level
-- File name        : system_top_PE1.vhd
-- Author           : Diana Ungureanu
---------------------------------------------------------------------------------------------------
-- Copyright (c) 2018 by Enclustra GmbH, Switzerland. All rights are reserved. 
-- Unauthorized duplication of this document, in whole or in part, by any means is prohibited
-- without the prior written permission of Enclustra GmbH, Switzerland.
-- 
-- Although Enclustra GmbH believes that the information included in this publication is correct
-- as of the date of publication, Enclustra GmbH reserves the right to make changes at any time
-- without notice.
-- 
-- All information in this document may only be published by Enclustra GmbH, Switzerland.
---------------------------------------------------------------------------------------------------
-- Description:
-- This is a top-level file for Mercury+ XU1 Reference Design
--    
---------------------------------------------------------------------------------------------------
-- File history:
--
-- Version | Date       | Author           | Remarks
-- ------------------------------------------------------------------------------------------------
-- 1.0     | 24.04.2016 | D. Ungureanu     | First released version
-- 2.0     | 20.10.2017 | D. Ungureanu     | Consistency checks
-- 3.0     | 11.06.2018 | D. Ungureanu     | Consistency checks
--
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
-- libraries
---------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

---------------------------------------------------------------------------------------------------
-- entity declaration
---------------------------------------------------------------------------------------------------

entity system_top is
  port (
  
  	-------------------------------------------------------------------------------------------
	-- processor system
	-------------------------------------------------------------------------------------------
	
	-- LEDs
	Led2_N							: out	std_logic;

    -- I2C on PL side
    I2c_Scl							: inout	std_logic;
    I2c_Sda							: inout	std_logic;
    
	-- Bank 64
	IO_B64_AG4						: inout	std_logic       := 'Z';
	IO_B64_AG9						: inout	std_logic       := 'Z';
	IO_B64_AH11						: inout	std_logic       := 'Z';
	IO_B64_AJ1						: inout	std_logic       := 'Z';
	FPGA_SDATA			: inout	std_logic       := 'Z';
	SEL0			: inout	std_logic       := 'Z';
	SMA_TRIG				: inout	std_logic       := 'Z';
	IO_B64_L11_GC_AJ7_N				: inout	std_logic       := 'Z';
	SEL4				: inout	std_logic       := 'Z';
	SEL3				: inout	std_logic       := 'Z';
	ADC3_DB1_n				: inout	std_logic       := 'Z';
	ADC3_DB1_p				: inout	std_logic       := 'Z';
	ADC4_DC1_p				: inout	std_logic       := 'Z';
	ADC4_DC1_n				: inout	std_logic       := 'Z';
	ADC3_DA0_n			: inout	std_logic       := 'Z';
	ADC3_DA0_p			: inout	std_logic       := 'Z';
	ADC4_DD1_n			: inout	std_logic       := 'Z';
	ADC4_DD1_p			: inout	std_logic       := 'Z';
	ADC4_DD0_p			: inout	std_logic       := 'Z';
	ADC4_DD0_n			: inout	std_logic       := 'Z';
	ADC4_DC0_p			: inout	std_logic       := 'Z';
	ADC4_DC0_n			: inout	std_logic       := 'Z';
	ADC3_DA1_n			: inout	std_logic       := 'Z';
	ADC3_DA1_p			: inout	std_logic       := 'Z';
	RJ45_LVDS_TRIG_p				: inout	std_logic       := 'Z';
	RJ45_LVDS_TRIG_n				: inout	std_logic       := 'Z';
	ADC3_DB0_n			: inout	std_logic       := 'Z';
	ADC3_DB0_p			: inout	std_logic       := 'Z';
	ADC4_FCLK_p			: inout	std_logic       := 'Z';
	ADC4_FCLK_n			: inout	std_logic       := 'Z';
	ADC4_DB1_p			: inout	std_logic       := 'Z';
	ADC4_DB1_n			: inout	std_logic       := 'Z';
	ADC3_FCLK_p				: inout	std_logic       := 'Z';
	ADC3_FCLK_n				: inout	std_logic       := 'Z';
	ADC4_DB0_n				: inout	std_logic       := 'Z';
	ADC4_DB0_p				: inout	std_logic       := 'Z';
	IO_B64_L2_AG13_P				: inout	std_logic       := 'Z';
	IO_B64_L2_AH13_N				: inout	std_logic       := 'Z';
	UART_SEL_0			: inout	std_logic       := 'Z';
	UART_SEL_1			: inout	std_logic       := 'Z';
	SMA_CLK			: inout	std_logic       := 'Z';
	UART_SEL_4			: inout	std_logic       := 'Z';
	UART_SEL_2			: inout	std_logic       := 'Z';
	UART_SEL_3			: inout	std_logic       := 'Z';
	FPGA_SCLK			: inout	std_logic       := 'Z';
	FPGA_SDOUT			: inout	std_logic       := 'Z';
	SEL5			: inout	std_logic       := 'Z';
	SEL6			: inout	std_logic       := 'Z';
	MAX10_SPARE1			: inout	std_logic       := 'Z';
	MAX10_SPARE0			: inout	std_logic       := 'Z';
	SEL2			: inout	std_logic       := 'Z';
	SEL1			: inout	std_logic       := 'Z';
	
	-- Bank 65
	IO_B65_AE1						: inout	std_logic       := 'Z';
	IO_B65_AE7						: inout	std_logic       := 'Z';
	ADC1_DC1_n			: inout	std_logic       := 'Z';
	ADC1_DC1_p			: inout	std_logic       := 'Z';
	IO_B65_L11_GC_AC7_P				: inout	std_logic       := 'Z';
	IO_B65_L11_GC_AD7_N				: inout	std_logic       := 'Z';
	ADC1_DCLK_p				: inout	std_logic       := 'Z';
	ADC1_DCLK_n				: inout	std_logic       := 'Z';
	ADC0_DC1_n				: inout	std_logic       := 'Z';
	ADC0_DC1_p				: inout	std_logic       := 'Z';
	ADC0_DB0_p				: inout	std_logic       := 'Z';
	ADC0_DB0_n				: inout	std_logic       := 'Z';
	ADC0_DD1_n			: inout	std_logic       := 'Z';
	ADC0_DD1_p			: inout	std_logic       := 'Z';
	ADC1_DA1_p			: inout	std_logic       := 'Z';
	ADC1_DA1_n			: inout	std_logic       := 'Z';
	ADC1_DB0_p			: inout	std_logic       := 'Z';
	ADC1_DB0_n			: inout	std_logic       := 'Z';
	ADC1_DA0_p			: inout	std_logic       := 'Z';
	ADC1_DA0_n			: inout	std_logic       := 'Z';
	ADC0_DB1_p			: inout	std_logic       := 'Z';
	ADC0_DB1_n			: inout	std_logic       := 'Z';
	ADC3_DC0_p				: inout	std_logic       := 'Z';
	ADC3_DC0_n				: inout	std_logic       := 'Z';
	ADC0_DD0_n			: inout	std_logic       := 'Z';
	ADC0_DD0_p			: inout	std_logic       := 'Z';
	ADC0_DC0_p			: inout	std_logic       := 'Z';
	ADC0_DC0_n			: inout	std_logic       := 'Z';
	ADC0_FCLK_p			: inout	std_logic       := 'Z';
	ADC0_FCLK_n			: inout	std_logic       := 'Z';
	ADC0_DA0_n				: inout	std_logic       := 'Z';
	ADC0_DA0_p			: inout	std_logic       := 'Z';
	IO_B65_L24_PERST_AB1_N_n		: inout	std_logic       := 'Z';
	ADC0_DA1_p			: inout	std_logic       := 'Z';
	ADC3_DC1_p				: inout	std_logic       := 'Z';
	ADC3_DC1_n				: inout	std_logic       := 'Z';
	IO_B65_L3_AD15_AD12_P			: inout	std_logic       := 'Z';
	IO_B65_L3_AD15_AE12_N			: inout	std_logic       := 'Z';
	IO_B65_L4_AD7_AC11_P			: inout	std_logic       := 'Z';
	IO_B65_L4_AD7_AD11_N			: inout	std_logic       := 'Z';
	IO_B65_L5_AD14_AA11_N			: inout	std_logic       := 'Z';
	IO_B65_L5_AD14_AA12_P			: inout	std_logic       := 'Z';
	ADC1_DD0_n			: inout	std_logic       := 'Z';
	ADC1_DD0_p			: inout	std_logic       := 'Z';
	ADC1_DC0_p			: inout	std_logic       := 'Z';
	ADC1_DC0_n			: inout	std_logic       := 'Z';
	ADC1_DB1_p			: inout	std_logic       := 'Z';
	ADC1_DB1_n			: inout	std_logic       := 'Z';
	ADC1_FCLK_p			: inout	std_logic       := 'Z';
	ADC1_FCLK_n			: inout	std_logic       := 'Z';
	
	-- Bank 66
	ADC1_SEN				: inout	std_logic       := 'Z';
	ADC0_SEN				: inout	std_logic       := 'Z';
	IO_B66_L11_GC_V6_N				: inout	std_logic       := 'Z';
	IO_B66_L11_GC_V7_P				: inout	std_logic       := 'Z';
	ADC1_DD1_n				: inout	std_logic       := 'Z';
	ADC1_DD1_p				: inout	std_logic       := 'Z';
	IO_B66_L13_GC_U8_P				: inout	std_logic       := 'Z';
	IO_B66_L13_GC_V8_N				: inout	std_logic       := 'Z';
	IO_B66_L14_GC_Y8_N				: inout	std_logic       := 'Z';
	IO_B66_L14_GC_Y9_P				: inout	std_logic       := 'Z';
	IO_B66_L15_AD11_U11_P			: inout	std_logic       := 'Z';
	IO_B66_L15_AD11_V11_N			: inout	std_logic       := 'Z';
	IO_B66_L16_AD3_W10_N			: inout	std_logic       := 'Z';
	IO_B66_L16_AD3_W11_P			: inout	std_logic       := 'Z';
	IO_B66_L17_AD10_U9_P			: inout	std_logic       := 'Z';
	IO_B66_L17_AD10_V9_N			: inout	std_logic       := 'Z';
	IO_B66_L18_AD2_T11_P			: inout	std_logic       := 'Z';
	IO_B66_L18_AD2_U10_N			: inout	std_logic       := 'Z';
	IO_B66_L19_AD9_T10_N			: inout	std_logic       := 'Z';
	IO_B66_L19_AD9_R10_P			: inout	std_logic       := 'Z';
	MAX10_SPARE2					: inout	std_logic       := 'Z';
	MAX10_SPARE4					: inout	std_logic       := 'Z';
	IO_B66_L20_AD1_P10_N			: inout	std_logic       := 'Z';
	IO_B66_L20_AD1_P11_P			: inout	std_logic       := 'Z';
	IO_B66_L21_AD8_M12_N			: inout	std_logic       := 'Z';
	IO_B66_L21_AD8_N12_P			: inout	std_logic       := 'Z';
	IO_B66_L22_AD0_M10_N			: inout	std_logic       := 'Z';
	IO_B66_L22_AD0_N10_P			: inout	std_logic       := 'Z';
	IO_B66_L23_L11_N				: inout	std_logic       := 'Z';
	IO_B66_L23_L12_P				: inout	std_logic       := 'Z';
	IO_B66_L24_K10_N				: inout	std_logic       := 'Z';
	IO_B66_L24_L10_P				: inout	std_logic       := 'Z';
	MAX10_SPARE3					: inout	std_logic       := 'Z';
	MAX10_SPARE5					: inout	std_logic       := 'Z';
	IO_B66_L3_AD15_W1_N				: inout	std_logic       := 'Z';
	IO_B66_L3_AD15_W2_P				: inout	std_logic       := 'Z';
	IO_B66_L4_AD7_V1_N				: inout	std_logic       := 'Z';
	IO_B66_L4_AD7_V2_P				: inout	std_logic       := 'Z';
	IO_B66_L5_AD14_U2_P				: inout	std_logic       := 'Z';
	IO_B66_L5_AD14_U3_N				: inout	std_logic       := 'Z';
	ADC3_SEN				: inout	std_logic       := 'Z';
	ADC4_SEN				: inout	std_logic       := 'Z';
	ADC_PDN				: inout	std_logic       := 'Z';
	ADC_RST				: inout	std_logic       := 'Z';
	ADC_SDOUT				: inout	std_logic       := 'Z';
	ADC2_SEN				: inout	std_logic       := 'Z';
	ADC_SDATA				: inout	std_logic       := 'Z';
	ADC_SCLK				: inout	std_logic       := 'Z';
	IO_B66_N11						: inout	std_logic       := 'Z';
	IO_B66_Y10						: inout	std_logic       := 'Z';
	
	-- Bank 48
	ADC2_DD1_n				: inout	std_logic       := 'Z';
	ADC2_DD1_p				: inout	std_logic       := 'Z';
	ADC2_DD0_n				: inout	std_logic       := 'Z';
	ADC2_DD0_p				: inout	std_logic       := 'Z';
	ADC2_DC1_n				: inout	std_logic       := 'Z';
	ADC2_DC1_p				: inout	std_logic       := 'Z';
	IO_B48_L1_AD15_B11_N				: inout	std_logic       := 'Z';
	IO_B48_L1_AD15_C12_P				: inout	std_logic       := 'Z';
	IO_B48_L2_AD14_A11_N				: inout	std_logic       := 'Z';
	IO_B48_L2_AD14_A12_P				: inout	std_logic       := 'Z';
	IO_B48_L3_AD13_A10_N				: inout	std_logic       := 'Z';
	IO_B48_L3_AD13_B10_P				: inout	std_logic       := 'Z';
	IO_B48_L4_AD12_C11_N				: inout	std_logic       := 'Z';
	IO_B48_L4_AD12_D11_P				: inout	std_logic       := 'Z';
	IO_B48_L5_HDGC_D12_N				: inout	std_logic       := 'Z';
	IO_B48_L5_HDGC_E12_P				: inout	std_logic       := 'Z';
	IO_B48_L6_HDGC_D10_N				: inout	std_logic       := 'Z';
	IO_B48_L6_HDGC_E10_P				: inout	std_logic       := 'Z';
	ADC2_FCLK_n				: inout	std_logic       := 'Z';
	ADC2_FCLK_p				: inout	std_logic       := 'Z';
	PEO_LVDS_TRIG_n				: inout	std_logic       := 'Z';
	PEO_LVDS_TRIG_p				: inout	std_logic       := 'Z';
	ADC2_DC0_n				: inout	std_logic       := 'Z';
	ADC2_DC0_p				: inout	std_logic       := 'Z';
	
	-- Bank 47
	ADC2_DB0_n				: inout	std_logic       := 'Z';
	ADC2_DB0_p				: inout	std_logic       := 'Z';
	LVDS_SMA_RJ45_CLK1_N				: inout	std_logic       := 'Z';
	LVDS_SMA_RJ45_CLK1_P				: inout	std_logic       := 'Z';
	IO_B47_L12_AD0_H13_N				: inout	std_logic       := 'Z';
	IO_B47_L12_AD0_H14_P				: inout	std_logic       := 'Z';
	IO_B47_L1_AD11_A15_N				: inout	std_logic       := 'Z';
	IO_B47_L1_AD11_B15_P				: inout	std_logic       := 'Z';
	IO_B47_L2_AD10_A14_N				: inout	std_logic       := 'Z';
	IO_B47_L2_AD10_B14_P				: inout	std_logic       := 'Z';
	IO_B47_L3_AD9_A13_N					: inout	std_logic       := 'Z';
	IO_B47_L3_AD9_B13_P					: inout	std_logic       := 'Z';
	IO_B47_L4_AD8_C13_N					: inout	std_logic       := 'Z';
	IO_B47_L4_AD8_C14_P					: inout	std_logic       := 'Z';
	ADC2_DCLK_n			: inout	std_logic       := 'Z';
	ADC2_DCLK_p			: inout	std_logic       := 'Z';
	IO_B47_L6_HDGC_AD6_E13_N			: inout	std_logic       := 'Z';
	IO_B47_L6_HDGC_AD6_E14_P			: inout	std_logic       := 'Z';
	ADC2_DA0_n			: inout	std_logic       := 'Z';
	ADC2_DA0_p			: inout	std_logic       := 'Z';
	ADC2_DB1_n			: inout	std_logic       := 'Z';
	ADC2_DB1_p			: inout	std_logic       := 'Z';
	ADC2_DA1_n					: inout	std_logic       := 'Z';
	ADC2_DA1_p					: inout	std_logic       := 'Z'
	
  );
end system_top;

---------------------------------------------------------------------------------------------------
-- architecture declaration
---------------------------------------------------------------------------------------------------

architecture rtl of system_top is

  component MercuryXU1 is
  port (
    pl_resetn0 : out std_logic;
    pl_clk1 : out std_logic;
    gpio_tri_o : out std_logic_vector ( 7 downto 0 )
  );
  end component MercuryXU1;
  
-----------------------------------------------------------------------------------------------
-- signals
-----------------------------------------------------------------------------------------------

  signal Rst_N 			: std_logic := '1';
  
  signal Rst            : std_logic := '0';
  signal Clk			: std_logic;
  signal RstCnt         : unsigned (15 downto 0) := (others => '0');
  signal LedCount       : unsigned (23 downto 0);  
  
  signal Gpio			: std_logic_vector (7 downto 0);
  
begin

-----------------------------------------------------------------------------------------------
-- processor system
-----------------------------------------------------------------------------------------------	

	MercuryXU1_i: component MercuryXU1
       port map (
        gpio_tri_o(7 downto 0) => Gpio(7 downto 0),
        pl_clk1 => Clk,
        pl_resetn0 => Rst_N
      );

    ------------------------------------------------------------------------------------------------
    --  Clock and Reset
    ------------------------------------------------------------------------------------------------ 

    process (Clk)
    begin
        if rising_edge (Clk) then
            if (not RstCnt) = 0 then
                Rst         <= '0';
            else
                Rst         <= '1';
                RstCnt      <= RstCnt + 1;
            end if;
        end if;
    end process;
    
    ------------------------------------------------------------------------------------------------
    -- Blinking LED counter & LED assignment
    ------------------------------------------------------------------------------------------------
   
    process (Clk)
    begin
        if rising_edge (Clk) then
            if Rst = '1' then
                LedCount    <= (others => '0');
            else
                LedCount <= LedCount + 1;
            end if;
        end if;
    end process;
    
    Led2_N <= LedCount(23);	
--    Led2_N <= Gpio(2);


    I2c_Sda <= 'Z';
    I2c_Scl <= 'Z';
	
	-- --LVDS example
	-- -- note: only diff inputs supported in HD banks
	--LDVS_in : IBUFDS 
	--port map (
	--	O  => IO_B48_L5_HDGC_in,
	--	I  => IO_B48_L5_HDGC_E12_P,
	--	IB => IO_B48_L5_HDGC_D12_N
    --);
	
end rtl;


---------------------------------------------------------------------------------------------------
-- eof
---------------------------------------------------------------------------------------------------

