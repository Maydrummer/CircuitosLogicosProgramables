-- ******************************************************************************

-- iCEcube Netlister

-- Version:            2020.12.27943

-- Build Date:         Dec  9 2020 18:18:06

-- File Generated:     Apr 1 2024 21:54:40

-- Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

-- Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

-- ******************************************************************************

-- VHDL file for cell "sum1b" view "INTERFACE"

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library ice;
use ice.vcomponent_vital.all;

-- Entity of sum1b
entity sum1b is
port (
    s_o : out std_logic;
    co_o : out std_logic;
    ci_i : in std_logic;
    b_i : in std_logic;
    a_i : in std_logic);
end sum1b;

-- Architecture of sum1b
-- View name is \INTERFACE\
architecture \INTERFACE\ of sum1b is

signal \N__214\ : std_logic;
signal \N__213\ : std_logic;
signal \N__212\ : std_logic;
signal \N__205\ : std_logic;
signal \N__204\ : std_logic;
signal \N__203\ : std_logic;
signal \N__196\ : std_logic;
signal \N__195\ : std_logic;
signal \N__194\ : std_logic;
signal \N__187\ : std_logic;
signal \N__186\ : std_logic;
signal \N__185\ : std_logic;
signal \N__178\ : std_logic;
signal \N__177\ : std_logic;
signal \N__176\ : std_logic;
signal \N__159\ : std_logic;
signal \N__156\ : std_logic;
signal \N__153\ : std_logic;
signal \N__150\ : std_logic;
signal \N__147\ : std_logic;
signal \N__146\ : std_logic;
signal \N__141\ : std_logic;
signal \N__138\ : std_logic;
signal \N__135\ : std_logic;
signal \N__134\ : std_logic;
signal \N__129\ : std_logic;
signal \N__126\ : std_logic;
signal \N__123\ : std_logic;
signal \N__120\ : std_logic;
signal \N__117\ : std_logic;
signal \N__116\ : std_logic;
signal \N__111\ : std_logic;
signal \N__108\ : std_logic;
signal \N__105\ : std_logic;
signal \N__102\ : std_logic;
signal \N__99\ : std_logic;
signal \N__96\ : std_logic;
signal \N__93\ : std_logic;
signal \N__90\ : std_logic;
signal \VCCG0\ : std_logic;
signal \GNDG0\ : std_logic;
signal s_o_c : std_logic;
signal ci_i_c : std_logic;
signal b_i_c : std_logic;
signal a_i_c : std_logic;
signal co_o_0_i : std_logic;
signal \_gnd_net_\ : std_logic;

signal a_i_wire : std_logic;
signal b_i_wire : std_logic;
signal s_o_wire : std_logic;
signal ci_i_wire : std_logic;
signal co_o_wire : std_logic;

begin
    a_i_wire <= a_i;
    b_i_wire <= b_i;
    s_o <= s_o_wire;
    ci_i_wire <= ci_i;
    co_o <= co_o_wire;

    \a_i_ibuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__214\,
            DIN => \N__213\,
            DOUT => \N__212\,
            PACKAGEPIN => a_i_wire
        );

    \a_i_ibuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__214\,
            PADOUT => \N__213\,
            PADIN => \N__212\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => a_i_c,
            DOUT0 => '0',
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \b_i_ibuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__205\,
            DIN => \N__204\,
            DOUT => \N__203\,
            PACKAGEPIN => b_i_wire
        );

    \b_i_ibuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__205\,
            PADOUT => \N__204\,
            PADIN => \N__203\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => b_i_c,
            DOUT0 => '0',
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \s_o_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__196\,
            DIN => \N__195\,
            DOUT => \N__194\,
            PACKAGEPIN => s_o_wire
        );

    \s_o_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__196\,
            PADOUT => \N__195\,
            PADIN => \N__194\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__159\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \ci_i_ibuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__187\,
            DIN => \N__186\,
            DOUT => \N__185\,
            PACKAGEPIN => ci_i_wire
        );

    \ci_i_ibuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "000001"
        )
    port map (
            PADOEN => \N__187\,
            PADOUT => \N__186\,
            PADIN => \N__185\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => ci_i_c,
            DOUT0 => '0',
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \co_o_obuf_iopad\ : IO_PAD
    generic map (
            IO_STANDARD => "SB_LVCMOS",
            PULLUP => '0'
        )
    port map (
            OE => \N__178\,
            DIN => \N__177\,
            DOUT => \N__176\,
            PACKAGEPIN => co_o_wire
        );

    \co_o_obuf_preio\ : PRE_IO
    generic map (
            NEG_TRIGGER => '0',
            PIN_TYPE => "011001"
        )
    port map (
            PADOEN => \N__178\,
            PADOUT => \N__177\,
            PADIN => \N__176\,
            CLOCKENABLE => 'H',
            DOUT1 => '0',
            OUTPUTENABLE => '0',
            DIN0 => OPEN,
            DOUT0 => \N__99\,
            INPUTCLK => '0',
            LATCHINPUTVALUE => '0',
            DIN1 => OPEN,
            OUTPUTCLK => '0'
        );

    \I__33\ : IoInMux
    port map (
            O => \N__159\,
            I => \N__156\
        );

    \I__32\ : LocalMux
    port map (
            O => \N__156\,
            I => \N__153\
        );

    \I__31\ : Span12Mux_s0_v
    port map (
            O => \N__153\,
            I => \N__150\
        );

    \I__30\ : Odrv12
    port map (
            O => \N__150\,
            I => s_o_c
        );

    \I__29\ : InMux
    port map (
            O => \N__147\,
            I => \N__141\
        );

    \I__28\ : InMux
    port map (
            O => \N__146\,
            I => \N__141\
        );

    \I__27\ : LocalMux
    port map (
            O => \N__141\,
            I => ci_i_c
        );

    \I__26\ : CascadeMux
    port map (
            O => \N__138\,
            I => \N__135\
        );

    \I__25\ : InMux
    port map (
            O => \N__135\,
            I => \N__129\
        );

    \I__24\ : InMux
    port map (
            O => \N__134\,
            I => \N__129\
        );

    \I__23\ : LocalMux
    port map (
            O => \N__129\,
            I => \N__126\
        );

    \I__22\ : Span4Mux_h
    port map (
            O => \N__126\,
            I => \N__123\
        );

    \I__21\ : Span4Mux_h
    port map (
            O => \N__123\,
            I => \N__120\
        );

    \I__20\ : Odrv4
    port map (
            O => \N__120\,
            I => b_i_c
        );

    \I__19\ : InMux
    port map (
            O => \N__117\,
            I => \N__111\
        );

    \I__18\ : InMux
    port map (
            O => \N__116\,
            I => \N__111\
        );

    \I__17\ : LocalMux
    port map (
            O => \N__111\,
            I => \N__108\
        );

    \I__16\ : IoSpan4Mux
    port map (
            O => \N__108\,
            I => \N__105\
        );

    \I__15\ : IoSpan4Mux
    port map (
            O => \N__105\,
            I => \N__102\
        );

    \I__14\ : Odrv4
    port map (
            O => \N__102\,
            I => a_i_c
        );

    \I__13\ : IoInMux
    port map (
            O => \N__99\,
            I => \N__96\
        );

    \I__12\ : LocalMux
    port map (
            O => \N__96\,
            I => \N__93\
        );

    \I__11\ : Span12Mux_s0_v
    port map (
            O => \N__93\,
            I => \N__90\
        );

    \I__10\ : Odrv12
    port map (
            O => \N__90\,
            I => co_o_0_i
        );

    \VCC\ : VCC
    port map (
            Y => \VCCG0\
        );

    \GND\ : GND
    port map (
            Y => \GNDG0\
        );

    \GND_Inst\ : GND
    port map (
            Y => \_gnd_net_\
        );

    \s_o_1_SUM_0_LC_13_30_0\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1001100101100110"
        )
    port map (
            in0 => \N__116\,
            in1 => \N__146\,
            in2 => \_gnd_net_\,
            in3 => \N__134\,
            lcout => s_o_c,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );

    \s_o_1_co_o_0_i_LC_13_30_1\ : LogicCell40
    generic map (
            C_ON => '0',
            SEQ_MODE => "0000",
            LUT_INIT => "1111101010100000"
        )
    port map (
            in0 => \N__147\,
            in1 => \_gnd_net_\,
            in2 => \N__138\,
            in3 => \N__117\,
            lcout => co_o_0_i,
            ltout => OPEN,
            carryin => \_gnd_net_\,
            carryout => OPEN,
            clk => \_gnd_net_\,
            ce => 'H',
            sr => \_gnd_net_\
        );
end \INTERFACE\;
