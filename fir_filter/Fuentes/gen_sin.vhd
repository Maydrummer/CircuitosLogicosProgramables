library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity gen_sin is 
    port(
        clk:            in std_logic;
        rst:            in std_logic;
        cordic_clk:     in std_logic; -- Reloj para el módulo Cordic
        phase_valid:    in std_logic;
        signal_test:    out signed(15 downto 0);
        sin_2_mhz_out:  out signed(15 downto 0);
        sin_30_mhz_out: out signed(15 downto 0)
    );
end gen_sin;

architecture gen_sin_arch of gen_sin is
    
    COMPONENT cordic_1
    PORT (
        aclk : IN STD_LOGIC;
        s_axis_phase_tvalid : IN STD_LOGIC;
        s_axis_phase_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        m_axis_dout_tvalid : OUT STD_LOGIC;
        m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
    END COMPONENT;

    constant CORDIC_CLK_PERIOD: time := 2 ns;  -- Período del reloj para el módulo Cordic
    constant PI_POS: signed(15 downto 0) := X"6488"; -- +pi
    constant PI_NEG: signed(15 downto 0) := X"9B78"; -- -pi
    constant PHASE_INC_2MHZ: integer := 200;         -- Incremento de fase para onda de 2 MHz
    constant PHASE_INC_30MHZ: integer := 3000;       -- Incremento de fase para onda de 30 MHz
    
    signal phase_2Mhz:             signed(15 downto 0) := (others => '0'); -- Barrido de fase para 2 MHz
    signal phase_30Mhz:            signed(15 downto 0) := (others => '0'); -- Barrido de fase para 30 MHz
    signal sincos_2Mhz_tvalid:     std_logic;
    signal sin_2Mhz,cos_2Mhz:      std_logic_vector(15 downto 0);  -- Seno/Coseno de 2 MHz
    signal sincos_30Mhz_tvalid:    std_logic;
    signal sin_30Mhz,cos_30Mhz:    std_logic_vector(15 downto 0);  -- Seno/Coseno de 30 MHz
    signal noisy_signal:           signed(15 downto 0);  -- Señal ruidosa: 2 MHz + 30 MHz
        

begin

    -- Synthesis de la onda seno de 2 MHz
    cordic_inst_0: cordic_1
    port map(
        aclk                              => cordic_clk,
        s_axis_phase_tvalid               => phase_valid,
        s_axis_phase_tdata                => std_logic_vector(phase_2Mhz),
        m_axis_dout_tvalid                => sincos_2Mhz_tvalid,
        m_axis_dout_tdata(31 downto 16)   => sin_2Mhz,
        m_axis_dout_tdata(15 downto  0)   => cos_2Mhz
    );

    -- Synthesis de la onda seno de 30 MHz 
    cordic_inst_1: cordic_1
    port map(
        aclk                              => cordic_clk,
        s_axis_phase_tvalid               => phase_valid,
        s_axis_phase_tdata                => std_logic_vector(phase_30Mhz),
        m_axis_dout_tvalid                => sincos_30Mhz_tvalid,
        m_axis_dout_tdata(31 downto 16)   => sin_30Mhz,
        m_axis_dout_tdata(15 downto  0)   => cos_30Mhz
    );

    -- Proceso para barrer la fase
    process (cordic_clk)
    begin
        if rising_edge(cordic_clk) then
            if phase_valid = '1' then
                -- Barrido de fase para 2 MHz
                if (phase_2Mhz + PHASE_INC_2MHZ < PI_POS) then
                    phase_2Mhz <= phase_2Mhz + PHASE_INC_2MHZ;
                else
                    phase_2Mhz <= PI_NEG + (phase_2Mhz + PHASE_INC_2MHZ - PI_POS);
                end if;

                -- Barrido de fase para 30 MHz
                if (phase_30Mhz + PHASE_INC_30MHZ < PI_POS) then
                    phase_30Mhz <= phase_30Mhz + PHASE_INC_30MHZ;
                else
                    phase_30Mhz <= PI_NEG + (phase_30Mhz + PHASE_INC_30MHZ - PI_POS);
                end if;
            end if;
        end if;
    end process;

    -- Proceso para generar la señal ruidosa
    process (clk,rst)
    begin
        if rst = '1' then
            noisy_signal <= (others => '0');
            signal_test <= (others => '0');
            sin_2_mhz_out <= (others => '0');
            sin_30_mhz_out <= (others => '0');
        elsif rising_edge(clk) then 
            if phase_valid = '1' then
                noisy_signal <= (signed(sin_2Mhz) + signed(sin_30Mhz)) / 2;
                signal_test <= noisy_signal;
                sin_2_mhz_out <= signed(sin_2Mhz);
                sin_30_mhz_out <= signed(sin_30Mhz);
            end if;
        end if;
    end process;

end gen_sin_arch;
