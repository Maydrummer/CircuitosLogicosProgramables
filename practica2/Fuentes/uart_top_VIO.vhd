library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uart_top_VIO is
    port(
        clk_i: 	in std_logic;
        rxd_pin: in std_logic
    );

end uart_top_VIO;

architecture Behavioral of uart_top_VIO is

COMPONENT vio_0
  PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

COMPONENT uart_top is
    PORT(
        --Write side inputs
        clk_pin: in std_logic;		-- Clock input (from pin)
        rst_pin: in std_logic;		-- Active HIGH reset (from pin)
        btn_pin: in std_logic;		-- Button to swap high and low bits
        rxd_pin: in std_logic; 		-- Uart input
        led_pins: out std_logic_vector(3 downto 0) -- 4 LED outputs
    );
END COMPONENT;

signal probe_leds: std_logic_vector(3 downto 0);
signal probe_btn,probe_rst: std_logic_vector(0 downto 0);
	
begin

uart_top_instance: uart_top
    PORT MAP(
        clk_pin  => clk_i,
        rst_pin  =>probe_rst(0),
        btn_pin  =>probe_btn(0),
        rxd_pin  => rxd_pin,
        led_pins => probe_leds
    );
    

uart_top_vio_instance : vio_0
    PORT MAP (
        clk => clk_i,
        probe_in0 => probe_leds,
        probe_out0 => probe_rst,
        probe_out1 => probe_btn
     );

end Behavioral;
