library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity uart_top_tb is
end entity uart_top_tb;


architecture uart_top_tb_arq of uart_top_tb is

  component uart_top is
  
  	port(
		--Write side inputs
		clk_pin: in std_logic;		-- Clock input (from pin)
		rst_pin: in std_logic;		-- Active HIGH reset (from pin)
		rxd_pin: in std_logic; 		-- Uart input
		counter_data_sal: out std_logic_vector(11 downto 0)		

	);

  end component uart_top;

  
  

  constant BAUD_RATE: integer := 115200;   
  constant CLOCK_RATE: integer := 50E6;
  signal   clk_tb         : std_logic := '1';
  signal   rst_tb         : std_logic := '1';
  signal   rxd_tb         : std_logic := '1';
  signal   counter_data_sal_tb: std_logic_vector(11 downto 0);

  constant FRECUENCIA    : integer   := 50;              -- en MHz
  constant PERIODO       : time      := 1 us/FRECUENCIA; -- en ns
  signal   detener       : boolean   := false; 




begin
  dut: uart_top  
                port    map (clk_pin      => clk_tb,
                             rst_pin      => rst_tb,
					         rxd_pin      => rxd_tb,        
                             counter_data_sal => counter_data_sal_tb);   

  GeneraReloj:						  
  process begin 	
    clk_tb <= '1', '0' after PERIODO/2;
    wait for PERIODO;
    if detener then
       wait;
    end if;
  end process GeneraReloj;

  rst_tb <= '1' , '0' after PERIODO*3/2;

  Prueba:
  process is begin
    report "Receptor de la UART a 115200 bits/s y caracteres ASCII"
    severity note;

    wait until rst_tb='0';
    wait for 3 ns;    

    rxd_tb <= '1';         
    wait for 9 us;

    rxd_tb <= '0';         -- inicio
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us; 

    rxd_tb <= '1';         -- stop
    wait for 9 us; 
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  

    rxd_tb <= '1';         -- stop
    wait for 9 us;  
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  

    rxd_tb <= '1';         -- stop
    wait for 9 us;  
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  

    rxd_tb <= '1';         -- stop
    wait for 9 us;   
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '0';         -- bit(0) de la J = "01001010"       
    wait for 9 us;    
    rxd_tb <= '1';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  

    rxd_tb <= '1';         -- stop
    wait for 9 us;   
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  

    rxd_tb <= '1';         -- stop
    wait for 9 us;   
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  	

    rxd_tb <= '1';         -- stop
    wait for 9 us;   
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  
	
	
	rxd_tb <= '1';         -- stop
    wait for 9 us;   
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  
	
	rxd_tb <= '1';         -- stop
    wait for 9 us;  
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  
	
	rxd_tb <= '1';         -- stop
    wait for 9 us;  
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '0';         -- bit(0) de la D = "01000100"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us;  

	rxd_tb <= '1';         -- stop
    wait for 9 us;   
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us; 

	rxd_tb <= '1';         -- stop
    wait for 9 us; 
    
    rxd_tb <= '1';         -- idle
    wait for 9 us;

    rxd_tb <= '0';         -- start
    wait for 9 us;

    rxd_tb <= '1';         -- bit(0) de la I = "01001001"       
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(1)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(2)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(3)
    wait for 9 us;    
    rxd_tb <= '0';         -- bit(4)
    wait for 9 us;        
    rxd_tb <= '0';         -- bit(5)
    wait for 9 us;
    rxd_tb <= '1';         -- bit(6)
    wait for 9 us;
    rxd_tb <= '0';         -- bit(7)
    wait for 9 us; 

    rxd_tb <= '1';         -- stop
    wait for 9 us; 

    detener <= true;
    wait;
  end process Prueba;                      
end architecture uart_top_tb_arq;

