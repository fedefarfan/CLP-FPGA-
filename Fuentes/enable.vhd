-----------------------------------------------------------------------------
--  
--  Copyright (c) 2009 Xilinx Inc.
--
--  Project  : Programmable Wave Generator
--  Module   : led_ctl.v
--  Parent   : uart_led.v
--  Children : None
--
--  Description: 
--     LED output generator
--
--  Parameters:
--     None
--
--  Local Parameters:
--
--  Notes       : 
--
--  Multicycle and False Paths
--    None
--

library IEEE;
use IEEE.std_logic_1164.all;

entity enable is
	port(
		clk_rx:			in std_logic;					-- Clock input
		rx_data_rdy:	in std_logic;					-- valid when rx_data_rdy is asserted
		in_data:        out std_logic
	);
end;


architecture enable_arq of enable is
	signal old_rx_data_rdy: std_logic := '0';
	signal in_data_local: std_logic := '0';
begin

	process(clk_rx)
	begin
		if rising_edge(clk_rx) then
				old_rx_data_rdy <= '0';
				in_data_local  <= '0';
				
				old_rx_data_rdy <= rx_data_rdy;
				
				if (rx_data_rdy = '1' and old_rx_data_rdy = '0') then
					  in_data_local <= '1';	
                else 
                 in_data_local <= '0';	
				end if;
		end if;
		
		if rising_edge(clk_rx) then
                in_data <= in_data_local;
		end if;
		
	end process;

end;


