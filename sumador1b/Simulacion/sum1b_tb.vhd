library IEEE;
use IEEE.std_logic_1164.all;

entity sum1b_tb is
end;

architecture sum1b_tb_arq of sum1b_tb is 
    -- declaracion de senales de prueba
    signal a_tb, b_tb, ci_tb, s_tb, co_tb : std_logic;
    -- Instanciacion del componente sum1b 
    component sum1b is
        port(
            a_i:  in std_logic;
            b_i:  in std_logic;
            ci_i: in std_logic;
            s_o:  in std_logic;
            co_o: in std_logic
        );
    end component;
begin
    -- Estímulos de prueba 
    a_tb  <= not a_tb after 10 ns;
    b_tb  <= not b_tb after 20 ns;
    ci_tb <= not ci_tb after 40 ns;

    -- Instanciación del DUT (Dispositivo bajo prueba)
    DUT: sum1b
        port map(
            a_i    => a_tb,
            b_i    => b_tb,
            ci_i   => ci_tb, 
            s_o    => s_tb,
            co_o   => co_tb

        );

end;
