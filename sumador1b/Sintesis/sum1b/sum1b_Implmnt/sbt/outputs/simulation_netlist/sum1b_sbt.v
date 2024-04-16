// ******************************************************************************

// iCEcube Netlister

// Version:            2020.12.27943

// Build Date:         Dec  9 2020 18:18:12

// File Generated:     Apr 1 2024 21:54:40

// Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

// Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

// ******************************************************************************

// Verilog file for cell "sum1b" view "INTERFACE"

module sum1b (
    s_o,
    co_o,
    ci_i,
    b_i,
    a_i);

    output s_o;
    output co_o;
    input ci_i;
    input b_i;
    input a_i;

    wire N__214;
    wire N__213;
    wire N__212;
    wire N__205;
    wire N__204;
    wire N__203;
    wire N__196;
    wire N__195;
    wire N__194;
    wire N__187;
    wire N__186;
    wire N__185;
    wire N__178;
    wire N__177;
    wire N__176;
    wire N__159;
    wire N__156;
    wire N__153;
    wire N__150;
    wire N__147;
    wire N__146;
    wire N__141;
    wire N__138;
    wire N__135;
    wire N__134;
    wire N__129;
    wire N__126;
    wire N__123;
    wire N__120;
    wire N__117;
    wire N__116;
    wire N__111;
    wire N__108;
    wire N__105;
    wire N__102;
    wire N__99;
    wire N__96;
    wire N__93;
    wire N__90;
    wire VCCG0;
    wire GNDG0;
    wire s_o_c;
    wire ci_i_c;
    wire b_i_c;
    wire a_i_c;
    wire co_o_0_i;
    wire _gnd_net_;

    IO_PAD a_i_ibuf_iopad (
            .OE(N__214),
            .DIN(N__213),
            .DOUT(N__212),
            .PACKAGEPIN(a_i));
    defparam a_i_ibuf_preio.NEG_TRIGGER=1'b0;
    defparam a_i_ibuf_preio.PIN_TYPE=6'b000001;
    PRE_IO a_i_ibuf_preio (
            .PADOEN(N__214),
            .PADOUT(N__213),
            .PADIN(N__212),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(a_i_c),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD b_i_ibuf_iopad (
            .OE(N__205),
            .DIN(N__204),
            .DOUT(N__203),
            .PACKAGEPIN(b_i));
    defparam b_i_ibuf_preio.NEG_TRIGGER=1'b0;
    defparam b_i_ibuf_preio.PIN_TYPE=6'b000001;
    PRE_IO b_i_ibuf_preio (
            .PADOEN(N__205),
            .PADOUT(N__204),
            .PADIN(N__203),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(b_i_c),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD s_o_obuf_iopad (
            .OE(N__196),
            .DIN(N__195),
            .DOUT(N__194),
            .PACKAGEPIN(s_o));
    defparam s_o_obuf_preio.NEG_TRIGGER=1'b0;
    defparam s_o_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO s_o_obuf_preio (
            .PADOEN(N__196),
            .PADOUT(N__195),
            .PADIN(N__194),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__159),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD ci_i_ibuf_iopad (
            .OE(N__187),
            .DIN(N__186),
            .DOUT(N__185),
            .PACKAGEPIN(ci_i));
    defparam ci_i_ibuf_preio.NEG_TRIGGER=1'b0;
    defparam ci_i_ibuf_preio.PIN_TYPE=6'b000001;
    PRE_IO ci_i_ibuf_preio (
            .PADOEN(N__187),
            .PADOUT(N__186),
            .PADIN(N__185),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(ci_i_c),
            .DOUT0(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IO_PAD co_o_obuf_iopad (
            .OE(N__178),
            .DIN(N__177),
            .DOUT(N__176),
            .PACKAGEPIN(co_o));
    defparam co_o_obuf_preio.NEG_TRIGGER=1'b0;
    defparam co_o_obuf_preio.PIN_TYPE=6'b011001;
    PRE_IO co_o_obuf_preio (
            .PADOEN(N__178),
            .PADOUT(N__177),
            .PADIN(N__176),
            .CLOCKENABLE(),
            .DOUT1(),
            .OUTPUTENABLE(),
            .DIN0(),
            .DOUT0(N__99),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .DIN1(),
            .OUTPUTCLK());
    IoInMux I__33 (
            .O(N__159),
            .I(N__156));
    LocalMux I__32 (
            .O(N__156),
            .I(N__153));
    Span12Mux_s0_v I__31 (
            .O(N__153),
            .I(N__150));
    Odrv12 I__30 (
            .O(N__150),
            .I(s_o_c));
    InMux I__29 (
            .O(N__147),
            .I(N__141));
    InMux I__28 (
            .O(N__146),
            .I(N__141));
    LocalMux I__27 (
            .O(N__141),
            .I(ci_i_c));
    CascadeMux I__26 (
            .O(N__138),
            .I(N__135));
    InMux I__25 (
            .O(N__135),
            .I(N__129));
    InMux I__24 (
            .O(N__134),
            .I(N__129));
    LocalMux I__23 (
            .O(N__129),
            .I(N__126));
    Span4Mux_h I__22 (
            .O(N__126),
            .I(N__123));
    Span4Mux_h I__21 (
            .O(N__123),
            .I(N__120));
    Odrv4 I__20 (
            .O(N__120),
            .I(b_i_c));
    InMux I__19 (
            .O(N__117),
            .I(N__111));
    InMux I__18 (
            .O(N__116),
            .I(N__111));
    LocalMux I__17 (
            .O(N__111),
            .I(N__108));
    IoSpan4Mux I__16 (
            .O(N__108),
            .I(N__105));
    IoSpan4Mux I__15 (
            .O(N__105),
            .I(N__102));
    Odrv4 I__14 (
            .O(N__102),
            .I(a_i_c));
    IoInMux I__13 (
            .O(N__99),
            .I(N__96));
    LocalMux I__12 (
            .O(N__96),
            .I(N__93));
    Span12Mux_s0_v I__11 (
            .O(N__93),
            .I(N__90));
    Odrv12 I__10 (
            .O(N__90),
            .I(co_o_0_i));
    VCC VCC (
            .Y(VCCG0));
    GND GND (
            .Y(GNDG0));
    GND GND_Inst (
            .Y(_gnd_net_));
    defparam s_o_1_SUM_0_LC_13_30_0.C_ON=1'b0;
    defparam s_o_1_SUM_0_LC_13_30_0.SEQ_MODE=4'b0000;
    defparam s_o_1_SUM_0_LC_13_30_0.LUT_INIT=16'b1001100101100110;
    LogicCell40 s_o_1_SUM_0_LC_13_30_0 (
            .in0(N__116),
            .in1(N__146),
            .in2(_gnd_net_),
            .in3(N__134),
            .lcout(s_o_c),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam s_o_1_co_o_0_i_LC_13_30_1.C_ON=1'b0;
    defparam s_o_1_co_o_0_i_LC_13_30_1.SEQ_MODE=4'b0000;
    defparam s_o_1_co_o_0_i_LC_13_30_1.LUT_INIT=16'b1111101010100000;
    LogicCell40 s_o_1_co_o_0_i_LC_13_30_1 (
            .in0(N__147),
            .in1(_gnd_net_),
            .in2(N__138),
            .in3(N__117),
            .lcout(co_o_0_i),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
endmodule // sum1b
