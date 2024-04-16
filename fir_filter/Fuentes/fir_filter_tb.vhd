library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir_filter_tb is
end fir_filter_tb;

architecture fir_fiter_tb_arch of fir_filter_tb is

COMPONENT cordic_1
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_phase_tvalid : IN STD_LOGIC;
    s_axis_phase_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

constant CORDIC_CLK_PERIOD: time := 2  ns;  --500 Mhz Cordic sampling clock
constant FIR_CLK_PERIOD:    time := 10 ns;  --100 Mhz fir lowpass filter samplick clock rate
constant PI_POS: signed(15 downto 0) := X"6488"; -- +pi
constant PI_NEG: signed(15 downto 0) := X"9B78"; -- -pi
constant PHASE_INC_2MHZ: integer := 200;         -- phase jump for 2Mhz sine wave synth
constant PHASE_INC_30MHZ: integer := 3000;         -- phase jump for 30Mhz sine wave synth

signal cordic_clk:             std_logic := '0';
signal fir_clk:                std_logic := '0';
signal phase_tvalid:           std_logic := '0';
signal phase_2Mhz:             signed(15 downto 0) := (others => '0'); -- 2 Mhz phase sweep
signal phase_30Mhz:            signed(15 downto 0) := (others => '0'); -- 30 Mhz phase sweep
signal sincos_2Mhz_tvalid:     std_logic;
signal sin_2Mhz,cos_2Mhz:      std_logic_vector(15 downto 0);  -- 2Mhz sine/cosine
signal sincos_30Mhz_tvalid:    std_logic;
signal sin_30Mhz,cos_30Mhz:    std_logic_vector(15 downto 0);  -- 30Mhz sine/cosine
signal noisy_signal:           signed(15 downto 0);  -- Resampled 2Mhz sine + 30 Mhz sine
signal filtered_signal:        signed(15 downto 0);  -- Filtered signal output from fir lowpass filter


begin

-- Synth 2 Mhz sine
cordic_inst_0: cordic_1
    port map(
        aclk                              => cordic_clk,
        s_axis_phase_tvalid               => phase_tvalid,
        s_axis_phase_tdata                => std_logic_vector(phase_2Mhz),
        m_axis_dout_tvalid                => sincos_2Mhz_tvalid,
        m_axis_dout_tdata(31 downto 16)   => sin_2Mhz,
        m_axis_dout_tdata(15 downto  0)   => cos_2Mhz
    );

-- Synth 30Mhz sine 
cordic_inst_1: cordic_1
    port map(
        aclk                              => cordic_clk,
        s_axis_phase_tvalid               => phase_tvalid,
        s_axis_phase_tdata                => std_logic_vector(phase_30Mhz),
        m_axis_dout_tvalid                => sincos_30Mhz_tvalid,
        m_axis_dout_tdata(31 downto 16)   => sin_30Mhz,
        m_axis_dout_tdata(15 downto  0)   => cos_30Mhz
    );

-- phase sweep

process(cordic_clk)
begin
    if rising_edge(cordic_clk) then
        phase_tvalid <= '1';

        -- sweep phase for 2Mhz
        if(phase_2Mhz + PHASE_INC_2MHZ < PI_POS) then
            phase_2Mhz <= phase_2Mhz + PHASE_INC_2MHZ;
        else
            phase_2Mhz <= PI_NEG + (phase_2Mhz + PHASE_INC_2MHZ - PI_POS);
        end if;

        -- sweep phase for 30Mhz
        if(phase_30Mhz + PHASE_INC_30MHZ < PI_POS) then
            phase_30Mhz <= phase_30Mhz + PHASE_INC_30MHZ;
        else
            phase_30Mhz <= PI_NEG + (phase_30Mhz + PHASE_INC_30MHZ - PI_POS);
        end if;
    end if;
end process;

-- 500 Mhz cordic clock
process
begin
    cordic_clk <= '0';
    wait for CORDIC_CLK_PERIOD/2;
    cordic_clk <= '1';
    wait for CORDIC_CLK_PERIOD/2;
end process;

-- 100 Mhz FIR clock
process
begin
    fir_clk <= '0';
    wait for FIR_CLK_PERIOD/2;
    fir_clk <= '1';
    wait for FIR_CLK_PERIOD/2;
end process;

-- Noisy signal = 2Mhz sine wave + 30 Mhz 
-- Se resamplea la senal de ruido a 100 Mhz en el filtro fir
process(fir_clk)
begin
    if rising_edge(fir_clk) then 
        noisy_signal <= (signed(sin_2Mhz) + signed(sin_30Mhz)) / 2;
    end if;
end process;

-- feed noisy signal into fir lowpass filter

fir_filter_inst: entity work.fir_filter
    port map(
        clk => fir_clk,
        noisy_signal => noisy_signal,
        filtered_signal => filtered_signal
    );



end fir_fiter_tb_arch;
