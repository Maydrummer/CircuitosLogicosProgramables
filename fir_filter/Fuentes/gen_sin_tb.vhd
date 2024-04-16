library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gen_sin_tb is
end gen_sin_tb;

architecture testbench of gen_sin_tb is
    
    -- Constantes de periodo del reloj
    constant CORDIC_CLK_PERIOD: time := 2 ns;
    constant CLK_PERIOD: time := 10 ns;
    constant TIME_SIM:   time := 4000 ns;
    -- Senales de entrada
    signal tb_sys_clk:        std_logic := '0';
    signal tb_sys_rst:        std_logic := '0';
    signal tb_cordic_clk:     std_logic := '0';
    signal tb_phase_valid:    std_logic := '0';
    -- Senales de salida
    signal tb_output_signal:          signed(15 downto 0);
    signal tb_output_sin_2_mhz:       signed(15 downto 0);
    signal tb_output_sin_30_mhz:      signed(15 downto 0);

    component gen_sin is
    port (
        clk:            in std_logic;
        rst:            in std_logic;
        cordic_clk:     in std_logic;
        phase_valid:    in std_logic;
        signal_test:    out signed(15 downto 0);
        sin_2_mhz_out:  out signed(15 downto 0);
        sin_30_mhz_out: out signed(15 downto 0)
    );
    end component;
begin 
    -- Proceso para generar el reloj de sistema
    process
    begin
        while now < TIME_SIM loop
            tb_sys_clk <= not tb_sys_clk;
            wait for CORDIC_CLK_PERIOD/2;
        end loop;
        wait;
    end process;

    -- Proceso para generar el reloj del modulo Cordic
    process
    begin
        while now < TIME_SIM loop
            tb_cordic_clk <= not tb_cordic_clk;
            wait for CORDIC_CLK_PERIOD/2;
        end loop;
        wait;
    end process;

    -- Estimulo
    stimulus : process
    begin
        -- Espera inicial
        wait for 10 ns;
        -- Ciclo de reinicio
        tb_sys_rst <= '1';
        tb_phase_valid <= '0';
        wait for CLK_PERIOD;
        tb_sys_rst <= '0';
        tb_phase_valid <= '1';
        -- Ciclo de generación de señal
        wait for TIME_SIM;
        -- Fin de la simulación
        wait;
    end process;

    -- Conexion del componente bajo prueba
    DUT: gen_sin
    port map (
        clk => tb_sys_clk,
        rst => tb_sys_rst,
        cordic_clk => tb_cordic_clk,
        phase_valid => tb_phase_valid,
        signal_test => tb_output_signal,
        sin_2_mhz_out => tb_output_sin_2_mhz,
        sin_30_mhz_out => tb_output_sin_30_mhz
    );

end testbench;
