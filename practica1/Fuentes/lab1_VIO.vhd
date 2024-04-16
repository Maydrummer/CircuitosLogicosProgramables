library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab1_VIO is
	port(
		clk_i: 	in std_logic
	);
end;

architecture lab1_VIO_arq of lab1_VIO is
	-- Parte declarativa
	COMPONENT lab1 is
        port(
            swt: in std_logic_vector(3 downto 0);
            led: out std_logic_vector(3 downto 0)
        );
    END COMPONENT;

	COMPONENT vio_0
      PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_in1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_in2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_in3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out2 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out3 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
    END COMPONENT;

	
	signal probe_sw_i	: std_logic_vector(3 downto 0);
	signal probe_led_o	: std_logic_vector(3 downto 0);

begin
	-- Parte descriptiva

	lab1_inst: entity work.lab1
		port map(
			swt(0) => probe_sw_i(0),
			swt(1) => probe_sw_i(1),
			swt(2) => probe_sw_i(2),
			swt(3) => probe_sw_i(3),
			led(0) => probe_led_o(0),
			led(1) => probe_led_o(1),
			led(2) => probe_led_o(2),
			led(3) => probe_led_o(3)			
		);
		
    lab1_vio_inst : vio_0
          PORT MAP (
            clk => clk_i,
            probe_in0(0) => probe_led_o(0),
            probe_in1(0) => probe_led_o(1),
            probe_in2(0) => probe_led_o(2),
            probe_in3(0) => probe_led_o(3),
            probe_out0(0) => probe_sw_i(0),
            probe_out1(0) => probe_sw_i(1),
            probe_out2(0) => probe_sw_i(2),
            probe_out3(0) => probe_sw_i(3)
          );
	
end;