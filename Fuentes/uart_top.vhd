-------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2015 10:24:29 AM
-- Design Name: 
-- Module Name: uart_top
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--////////////////////////////////////////////////////////////////////////////////

library IEEE;
use IEEE.std_logic_1164.all;

entity uart_top is
	port(
		--Write side inputs
		clk_pin: in std_logic;		-- Clock input (from pin)
		rst_pin: in std_logic;		-- Active HIGH reset (from pin)
		rxd_pin: in std_logic; 		-- Uart input
	   counter_data_sal: out std_logic_vector(11 downto 0)
	);
end;
	
architecture uart_top_arq of uart_top is

	component uart_led is
		generic(
			BAUD_RATE: integer := 115200;   
			CLOCK_RATE: integer := 50E6
		);
		port(
			-- Write side inputs
			clk_pin:	in std_logic;      					-- Clock input (from pin)
			rst_pin: 	in std_logic;      					-- Active HIGH reset (from pin)
			rxd_pin: 	in std_logic;      					-- RS232 RXD pin - directly from pin
			led_pins: 	out std_logic_vector(7 downto 0);    -- 8 LED outputs
		   rx_data_rdy_out: out std_logic
		);
	end component;

			component counter is
		port(
			--Write side inputs
			clk_pin:      in std_logic;		                  -- Clock input (from pin)
			rst:          in std_logic;	          			  -- Active HIGH reset - synchronous to clk
			input:   in std_logic_vector(7 downto 0);    -- char from UART
			data_rdy:     in std_logic;
			counter_data: out std_logic_vector(11 downto 0)
		);
	end component;
	
	signal data_recpt: std_logic_vector(7 downto 0) := "00000000";
	signal rx_data_rdy_con: std_logic;
	
begin

	U0: uart_led
		generic map(
			BAUD_RATE => 115200,
			CLOCK_RATE => 50E6
		)
		port map(
			clk_pin => clk_pin,  	-- Clock input (from pin)
			rst_pin => rst_pin,  	-- Active HIGH reset (from pin)
			rxd_pin => rxd_pin,  	-- RS232 RXD pin - directly from pin
			led_pins => data_recpt,--led_pins_o, 	-- 8 LED outputs
		   rx_data_rdy_out => rx_data_rdy_con
		);
		
	C0: counter
        port map(
			clk_pin      => clk_pin,  	-- Clock input (from pin)
			rst          => rst_pin,--rst_aux(0),
			input   => data_recpt, -- char from UART
			data_rdy     => rx_data_rdy_con,
			counter_data => counter_data_sal--counter_data
		);
		
end;
