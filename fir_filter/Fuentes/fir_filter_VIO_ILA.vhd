library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir_filter_VIO_ILA is 
    port(
        clk_i: in std_logic
    );
end fir_filter_VIO_ILA;

 
architecture arch of fir_filter_VIO_ILA is
    
    component fir_filter is 
    port(
        clk:               in std_logic;
        noisy_signal:      in signed(15 downto 0);
        filtered_signal:  out signed(15 downto 0)
    );
    end component;

    component gen_sin is 
    port(
        clk:            in std_logic;
        rst:            in std_logic;
        cordic_clk:     in std_logic; -- Reloj para el módulo Cordic
        phase_valid:    in std_logic;
        signal_test:    out signed(15 downto 0);
        sin_2_mhz_out:  out signed(15 downto 0);
        sin_30_mhz_out: out signed(15 downto 0)
    );
    end component;
    
    component vio_0
      port (
        clk : IN STD_LOGIC;
        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
    end component;
    
    component ila_0
    port (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
    end component;
    
    component clk_wiz_0
    port
     (-- Clock in ports
      -- Clock out ports
      clk_out1          : out    std_logic;
      clk_out2          : out    std_logic;
      clk_in1           : in     std_logic
     );
    end component;
    --signals
    signal probe_rst:         std_logic_vector(0 downto 0);
    signal probe_phase_valid: std_logic_vector(0 downto 0);
    signal senal_in_filtro:   signed(15 downto 0);
    signal senal_out_filtro:   signed(15 downto 0);
    signal clock_system: std_logic;   
    signal clock_gen_sin: std_logic;
begin

    vio_inst : vio_0
    PORT MAP (
        clk => clk_i,
        probe_out0 => probe_rst,
        probe_out1 => probe_phase_valid
    );

    gen_sin_inst: gen_sin
    port map (
        clk =>clock_gen_sin ,
        rst => probe_rst(0),
        cordic_clk => clock_gen_sin,
        phase_valid =>probe_phase_valid(0) ,
        signal_test => senal_in_filtro
--        sin_2_mhz_out => ,
--        sin_30_mhz_out => 
    );

    fir_filter_inst: fir_filter
    port map(
        clk => clock_system ,
        noisy_signal =>senal_in_filtro ,
        filtered_signal => senal_out_filtro
    );
    
    ila_instance : ila_0
    PORT MAP (
    clk => clock_system,
    probe0 => std_logic_vector(senal_in_filtro),
    probe1 => std_logic_vector(senal_out_filtro)
    );
    
    your_instance_name : clk_wiz_0
       port map ( 
      -- Clock out ports  
       clk_out1 => clock_system,
       clk_out2 => clock_gen_sin,
       -- Clock in ports
       clk_in1 => clk_i
     );

end;
