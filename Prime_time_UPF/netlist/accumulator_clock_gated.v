/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP3
// Date      : Tue Sep 22 15:24:45 2026
/////////////////////////////////////////////////////////////


module accumulator_clock_gated ( clk, rst_n, enable, data_in, acc_out, 
        overflow );
  input [31:0] data_in;
  output [31:0] acc_out;
  input clk, rst_n, enable;
  output overflow;
  wire   gated_clk, N6, N8, N10, N12, N14, N16, N18, N20, N22, N24, N26, N28,
         N30, N32, N34, N36, N37, N38, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, add_x_2_n79, add_x_2_n78, add_x_2_n77,
         add_x_2_n76, add_x_2_n75, add_x_2_n74, add_x_2_n73, add_x_2_n72,
         add_x_2_n71, add_x_2_n70, add_x_2_n69, add_x_2_n68, add_x_2_n67,
         add_x_2_n66, add_x_2_n65, add_x_2_n64, add_x_2_n63, add_x_2_n62,
         add_x_2_n61, add_x_2_n60, add_x_2_n59, add_x_2_n58, add_x_2_n57,
         add_x_2_n56, add_x_2_n55, add_x_2_n54, add_x_2_n53, add_x_2_n52,
         add_x_2_n51, add_x_2_n50, add_x_2_n49, add_x_2_n48, add_x_2_n47,
         add_x_2_n46, add_x_2_n45, add_x_2_n44, add_x_2_n43, add_x_2_n42,
         add_x_2_n41, add_x_2_n40, add_x_2_n39, add_x_2_n38, add_x_2_n37,
         add_x_2_n36, add_x_2_n35, add_x_2_n34, add_x_2_n32, add_x_2_n30,
         add_x_2_n28, add_x_2_n26, add_x_2_n24, add_x_2_n22, add_x_2_n20,
         add_x_2_n18, add_x_2_n16, add_x_2_n14, add_x_2_n12, add_x_2_n10,
         add_x_2_n8, add_x_2_n6, add_x_2_n4, add_x_2_n2, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125;
  wire   [30:2] data_in_gated;

  DLLx1_ASAP7_75t_R u_gate_en_latched_reg ( .CLK(clk), .D(n101), .Q(n100) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_32_ ( .D(N38), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n99) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_31_ ( .D(n98), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n97) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_30_ ( .D(n96), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n95) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_29_ ( .D(n94), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n93) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_28_ ( .D(n92), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n91) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_27_ ( .D(n90), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n89) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_26_ ( .D(n88), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n87) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_25_ ( .D(n86), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n85) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_24_ ( .D(n84), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n83) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_23_ ( .D(n82), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n81) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_22_ ( .D(n80), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n79) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_21_ ( .D(n78), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n77) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_20_ ( .D(n76), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n75) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_19_ ( .D(n74), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n73) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_18_ ( .D(n72), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n71) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_17_ ( .D(n70), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n69) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_16_ ( .D(n68), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n67) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_15_ ( .D(n66), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n65) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_14_ ( .D(n64), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n63) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_13_ ( .D(n62), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n61) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_12_ ( .D(n60), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n59) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_11_ ( .D(n58), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n57) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_10_ ( .D(n56), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n55) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_9_ ( .D(n54), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n53) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_8_ ( .D(n52), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n51) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_7_ ( .D(n50), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n49) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_6_ ( .D(n48), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n47) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_5_ ( .D(n46), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n45) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_4_ ( .D(n44), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n43) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_3_ ( .D(n42), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n41) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_2_ ( .D(n40), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n39) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_1_ ( .D(n38), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n37) );
  ASYNC_DFFHx1_ASAP7_75t_R extended_sum_reg_0_ ( .D(n36), .CLK(gated_clk), 
        .RESET(n35), .SET(n103), .QN(n34) );
  FAx1_ASAP7_75t_R add_x_2_U76 ( .A(n37), .B(add_x_2_n32), .CI(add_x_2_n64), 
        .CON(add_x_2_n63), .SN(N6) );
  FAx1_ASAP7_75t_R add_x_2_U75 ( .A(acc_out[2]), .B(data_in_gated[2]), .CI(
        add_x_2_n63), .CON(add_x_2_n62), .SN(add_x_2_n79) );
  FAx1_ASAP7_75t_R add_x_2_U71 ( .A(n41), .B(add_x_2_n30), .CI(add_x_2_n62), 
        .CON(add_x_2_n61), .SN(N8) );
  FAx1_ASAP7_75t_R add_x_2_U70 ( .A(acc_out[4]), .B(data_in_gated[4]), .CI(
        add_x_2_n61), .CON(add_x_2_n60), .SN(add_x_2_n78) );
  FAx1_ASAP7_75t_R add_x_2_U66 ( .A(n45), .B(add_x_2_n28), .CI(add_x_2_n60), 
        .CON(add_x_2_n59), .SN(N10) );
  FAx1_ASAP7_75t_R add_x_2_U65 ( .A(acc_out[6]), .B(data_in_gated[6]), .CI(
        add_x_2_n59), .CON(add_x_2_n58), .SN(add_x_2_n77) );
  FAx1_ASAP7_75t_R add_x_2_U61 ( .A(n49), .B(add_x_2_n26), .CI(add_x_2_n58), 
        .CON(add_x_2_n57), .SN(N12) );
  FAx1_ASAP7_75t_R add_x_2_U60 ( .A(acc_out[8]), .B(data_in_gated[8]), .CI(
        add_x_2_n57), .CON(add_x_2_n56), .SN(add_x_2_n76) );
  FAx1_ASAP7_75t_R add_x_2_U56 ( .A(n53), .B(add_x_2_n24), .CI(add_x_2_n56), 
        .CON(add_x_2_n55), .SN(N14) );
  FAx1_ASAP7_75t_R add_x_2_U55 ( .A(acc_out[10]), .B(data_in_gated[10]), .CI(
        add_x_2_n55), .CON(add_x_2_n54), .SN(add_x_2_n75) );
  FAx1_ASAP7_75t_R add_x_2_U51 ( .A(n57), .B(add_x_2_n22), .CI(add_x_2_n54), 
        .CON(add_x_2_n53), .SN(N16) );
  FAx1_ASAP7_75t_R add_x_2_U50 ( .A(acc_out[12]), .B(data_in_gated[12]), .CI(
        add_x_2_n53), .CON(add_x_2_n52), .SN(add_x_2_n74) );
  FAx1_ASAP7_75t_R add_x_2_U46 ( .A(n61), .B(add_x_2_n20), .CI(add_x_2_n52), 
        .CON(add_x_2_n51), .SN(N18) );
  FAx1_ASAP7_75t_R add_x_2_U45 ( .A(acc_out[14]), .B(data_in_gated[14]), .CI(
        add_x_2_n51), .CON(add_x_2_n50), .SN(add_x_2_n73) );
  FAx1_ASAP7_75t_R add_x_2_U41 ( .A(n65), .B(add_x_2_n18), .CI(add_x_2_n50), 
        .CON(add_x_2_n49), .SN(N20) );
  FAx1_ASAP7_75t_R add_x_2_U40 ( .A(acc_out[16]), .B(data_in_gated[16]), .CI(
        add_x_2_n49), .CON(add_x_2_n48), .SN(add_x_2_n72) );
  FAx1_ASAP7_75t_R add_x_2_U36 ( .A(n69), .B(add_x_2_n16), .CI(add_x_2_n48), 
        .CON(add_x_2_n47), .SN(N22) );
  FAx1_ASAP7_75t_R add_x_2_U35 ( .A(acc_out[18]), .B(data_in_gated[18]), .CI(
        add_x_2_n47), .CON(add_x_2_n46), .SN(add_x_2_n71) );
  FAx1_ASAP7_75t_R add_x_2_U31 ( .A(n73), .B(add_x_2_n14), .CI(add_x_2_n46), 
        .CON(add_x_2_n45), .SN(N24) );
  FAx1_ASAP7_75t_R add_x_2_U30 ( .A(acc_out[20]), .B(data_in_gated[20]), .CI(
        add_x_2_n45), .CON(add_x_2_n44), .SN(add_x_2_n70) );
  FAx1_ASAP7_75t_R add_x_2_U26 ( .A(n77), .B(add_x_2_n12), .CI(add_x_2_n44), 
        .CON(add_x_2_n43), .SN(N26) );
  FAx1_ASAP7_75t_R add_x_2_U25 ( .A(acc_out[22]), .B(data_in_gated[22]), .CI(
        add_x_2_n43), .CON(add_x_2_n42), .SN(add_x_2_n69) );
  FAx1_ASAP7_75t_R add_x_2_U21 ( .A(n81), .B(add_x_2_n10), .CI(add_x_2_n42), 
        .CON(add_x_2_n41), .SN(N28) );
  FAx1_ASAP7_75t_R add_x_2_U20 ( .A(acc_out[24]), .B(data_in_gated[24]), .CI(
        add_x_2_n41), .CON(add_x_2_n40), .SN(add_x_2_n68) );
  FAx1_ASAP7_75t_R add_x_2_U16 ( .A(n85), .B(add_x_2_n8), .CI(add_x_2_n40), 
        .CON(add_x_2_n39), .SN(N30) );
  FAx1_ASAP7_75t_R add_x_2_U15 ( .A(acc_out[26]), .B(data_in_gated[26]), .CI(
        add_x_2_n39), .CON(add_x_2_n38), .SN(add_x_2_n67) );
  FAx1_ASAP7_75t_R add_x_2_U11 ( .A(n89), .B(add_x_2_n6), .CI(add_x_2_n38), 
        .CON(add_x_2_n37), .SN(N32) );
  FAx1_ASAP7_75t_R add_x_2_U10 ( .A(acc_out[28]), .B(data_in_gated[28]), .CI(
        add_x_2_n37), .CON(add_x_2_n36), .SN(add_x_2_n66) );
  FAx1_ASAP7_75t_R add_x_2_U6 ( .A(n93), .B(add_x_2_n4), .CI(add_x_2_n36), 
        .CON(add_x_2_n35), .SN(N34) );
  FAx1_ASAP7_75t_R add_x_2_U5 ( .A(acc_out[30]), .B(data_in_gated[30]), .CI(
        add_x_2_n35), .CON(add_x_2_n34), .SN(add_x_2_n65) );
  FAx1_ASAP7_75t_R add_x_2_U1 ( .A(n97), .B(add_x_2_n2), .CI(add_x_2_n34), 
        .CON(N37), .SN(N36) );
  INVxp33_ASAP7_75t_R U138 ( .A(n99), .Y(overflow) );
  INVxp33_ASAP7_75t_R U139 ( .A(n47), .Y(acc_out[6]) );
  INVxp33_ASAP7_75t_R U140 ( .A(n79), .Y(acc_out[22]) );
  INVxp67_ASAP7_75t_R U141 ( .A(n67), .Y(acc_out[16]) );
  INVxp67_ASAP7_75t_R U142 ( .A(n55), .Y(acc_out[10]) );
  INVxp67_ASAP7_75t_R U143 ( .A(n63), .Y(acc_out[14]) );
  INVxp67_ASAP7_75t_R U144 ( .A(n95), .Y(acc_out[30]) );
  INVxp67_ASAP7_75t_R U145 ( .A(n91), .Y(acc_out[28]) );
  INVxp67_ASAP7_75t_R U146 ( .A(n71), .Y(acc_out[18]) );
  INVxp67_ASAP7_75t_R U147 ( .A(n59), .Y(acc_out[12]) );
  INVxp67_ASAP7_75t_R U148 ( .A(n87), .Y(acc_out[26]) );
  INVxp67_ASAP7_75t_R U149 ( .A(n34), .Y(acc_out[0]) );
  INVxp67_ASAP7_75t_R U150 ( .A(n75), .Y(acc_out[20]) );
  INVxp67_ASAP7_75t_R U151 ( .A(n83), .Y(acc_out[24]) );
  INVxp67_ASAP7_75t_R U152 ( .A(n51), .Y(acc_out[8]) );
  INVxp67_ASAP7_75t_R U153 ( .A(n43), .Y(acc_out[4]) );
  INVxp67_ASAP7_75t_R U154 ( .A(n39), .Y(acc_out[2]) );
  HB1xp67_ASAP7_75t_R U155 ( .A(enable), .Y(n125) );
  INVx1_ASAP7_75t_R U156 ( .A(rst_n), .Y(n103) );
  HB1xp67_ASAP7_75t_R U157 ( .A(enable), .Y(n107) );
  TIELOx1_ASAP7_75t_R U158 ( .L(n35) );
  INVxp33_ASAP7_75t_R U159 ( .A(n57), .Y(acc_out[11]) );
  INVxp33_ASAP7_75t_R U160 ( .A(n97), .Y(acc_out[31]) );
  INVxp33_ASAP7_75t_R U161 ( .A(n61), .Y(acc_out[13]) );
  INVxp33_ASAP7_75t_R U162 ( .A(n81), .Y(acc_out[23]) );
  INVxp33_ASAP7_75t_R U163 ( .A(n49), .Y(acc_out[7]) );
  INVxp33_ASAP7_75t_R U164 ( .A(n37), .Y(acc_out[1]) );
  INVxp33_ASAP7_75t_R U165 ( .A(n73), .Y(acc_out[19]) );
  INVxp33_ASAP7_75t_R U166 ( .A(n77), .Y(acc_out[21]) );
  INVxp33_ASAP7_75t_R U167 ( .A(n89), .Y(acc_out[27]) );
  INVxp33_ASAP7_75t_R U168 ( .A(n85), .Y(acc_out[25]) );
  INVxp33_ASAP7_75t_R U169 ( .A(n65), .Y(acc_out[15]) );
  INVxp33_ASAP7_75t_R U170 ( .A(n53), .Y(acc_out[9]) );
  INVxp33_ASAP7_75t_R U171 ( .A(n93), .Y(acc_out[29]) );
  INVxp33_ASAP7_75t_R U172 ( .A(n69), .Y(acc_out[17]) );
  INVxp33_ASAP7_75t_R U173 ( .A(n45), .Y(acc_out[5]) );
  INVxp33_ASAP7_75t_R U174 ( .A(n41), .Y(acc_out[3]) );
  NAND3xp33_ASAP7_75t_R U175 ( .A(n125), .B(data_in[0]), .C(acc_out[0]), .Y(
        add_x_2_n64) );
  NAND2xp33_ASAP7_75t_R U176 ( .A(n125), .B(data_in[1]), .Y(add_x_2_n32) );
  NAND2xp33_ASAP7_75t_R U177 ( .A(n125), .B(data_in[3]), .Y(add_x_2_n30) );
  NAND2xp33_ASAP7_75t_R U178 ( .A(n125), .B(data_in[5]), .Y(add_x_2_n28) );
  NAND2xp33_ASAP7_75t_R U179 ( .A(n125), .B(data_in[7]), .Y(add_x_2_n26) );
  NAND2xp33_ASAP7_75t_R U180 ( .A(n125), .B(data_in[9]), .Y(add_x_2_n24) );
  NAND2xp33_ASAP7_75t_R U181 ( .A(n125), .B(data_in[11]), .Y(add_x_2_n22) );
  NAND2xp33_ASAP7_75t_R U182 ( .A(n125), .B(data_in[13]), .Y(add_x_2_n20) );
  NAND2xp33_ASAP7_75t_R U183 ( .A(n125), .B(data_in[15]), .Y(add_x_2_n18) );
  NAND2xp33_ASAP7_75t_R U184 ( .A(n125), .B(data_in[17]), .Y(add_x_2_n16) );
  NAND2xp33_ASAP7_75t_R U185 ( .A(n125), .B(data_in[19]), .Y(add_x_2_n14) );
  NAND2xp33_ASAP7_75t_R U186 ( .A(n125), .B(data_in[21]), .Y(add_x_2_n12) );
  NAND2xp33_ASAP7_75t_R U187 ( .A(n125), .B(data_in[23]), .Y(add_x_2_n10) );
  NAND2xp33_ASAP7_75t_R U188 ( .A(n125), .B(data_in[25]), .Y(add_x_2_n8) );
  NAND2xp33_ASAP7_75t_R U189 ( .A(n125), .B(data_in[27]), .Y(add_x_2_n6) );
  NAND2xp33_ASAP7_75t_R U190 ( .A(n125), .B(data_in[29]), .Y(add_x_2_n4) );
  NAND2xp33_ASAP7_75t_R U191 ( .A(n125), .B(data_in[31]), .Y(add_x_2_n2) );
  NAND2xp33_ASAP7_75t_R U192 ( .A(n125), .B(data_in[0]), .Y(n105) );
  INVxp33_ASAP7_75t_R U193 ( .A(add_x_2_n64), .Y(n104) );
  AOI21xp33_ASAP7_75t_R U194 ( .A1(n34), .A2(n105), .B(n104), .Y(n36) );
  NAND2xp33_ASAP7_75t_R U195 ( .A(N6), .B(n107), .Y(n106) );
  OAI21xp33_ASAP7_75t_R U196 ( .A1(n37), .A2(n107), .B(n106), .Y(n38) );
  INVxp33_ASAP7_75t_R U197 ( .A(enable), .Y(n122) );
  AOI22xp33_ASAP7_75t_R U198 ( .A1(n107), .A2(add_x_2_n79), .B1(n39), .B2(n122), .Y(n40) );
  NAND2xp33_ASAP7_75t_R U199 ( .A(N8), .B(n125), .Y(n108) );
  OAI21xp33_ASAP7_75t_R U200 ( .A1(n41), .A2(n107), .B(n108), .Y(n42) );
  AOI22xp33_ASAP7_75t_R U201 ( .A1(n107), .A2(add_x_2_n78), .B1(n43), .B2(n122), .Y(n44) );
  NAND2xp33_ASAP7_75t_R U202 ( .A(N10), .B(n107), .Y(n109) );
  OAI21xp33_ASAP7_75t_R U203 ( .A1(n45), .A2(n107), .B(n109), .Y(n46) );
  AOI22xp33_ASAP7_75t_R U204 ( .A1(n107), .A2(add_x_2_n77), .B1(n47), .B2(n122), .Y(n48) );
  NAND2xp33_ASAP7_75t_R U205 ( .A(N12), .B(n125), .Y(n110) );
  OAI21xp33_ASAP7_75t_R U206 ( .A1(n49), .A2(n107), .B(n110), .Y(n50) );
  AOI22xp33_ASAP7_75t_R U207 ( .A1(n107), .A2(add_x_2_n76), .B1(n51), .B2(n122), .Y(n52) );
  NAND2xp33_ASAP7_75t_R U208 ( .A(N14), .B(n107), .Y(n111) );
  OAI21xp33_ASAP7_75t_R U209 ( .A1(n53), .A2(n107), .B(n111), .Y(n54) );
  AOI22xp33_ASAP7_75t_R U210 ( .A1(n107), .A2(add_x_2_n75), .B1(n55), .B2(n122), .Y(n56) );
  NAND2xp33_ASAP7_75t_R U211 ( .A(N16), .B(n107), .Y(n112) );
  OAI21xp33_ASAP7_75t_R U212 ( .A1(n57), .A2(n107), .B(n112), .Y(n58) );
  AOI22xp33_ASAP7_75t_R U213 ( .A1(n107), .A2(add_x_2_n74), .B1(n59), .B2(n122), .Y(n60) );
  NAND2xp33_ASAP7_75t_R U214 ( .A(N18), .B(n107), .Y(n113) );
  OAI21xp33_ASAP7_75t_R U215 ( .A1(n61), .A2(n107), .B(n113), .Y(n62) );
  AOI22xp33_ASAP7_75t_R U216 ( .A1(n107), .A2(add_x_2_n73), .B1(n63), .B2(n122), .Y(n64) );
  NAND2xp33_ASAP7_75t_R U217 ( .A(N20), .B(n107), .Y(n114) );
  OAI21xp33_ASAP7_75t_R U218 ( .A1(n65), .A2(n107), .B(n114), .Y(n66) );
  AOI22xp33_ASAP7_75t_R U219 ( .A1(n107), .A2(add_x_2_n72), .B1(n67), .B2(n122), .Y(n68) );
  NAND2xp33_ASAP7_75t_R U220 ( .A(N22), .B(n107), .Y(n115) );
  OAI21xp33_ASAP7_75t_R U221 ( .A1(n69), .A2(n107), .B(n115), .Y(n70) );
  AOI22xp33_ASAP7_75t_R U222 ( .A1(n107), .A2(add_x_2_n71), .B1(n71), .B2(n122), .Y(n72) );
  NAND2xp33_ASAP7_75t_R U223 ( .A(N24), .B(n125), .Y(n116) );
  OAI21xp33_ASAP7_75t_R U224 ( .A1(n73), .A2(n107), .B(n116), .Y(n74) );
  AOI22xp33_ASAP7_75t_R U225 ( .A1(n107), .A2(add_x_2_n70), .B1(n75), .B2(n122), .Y(n76) );
  NAND2xp33_ASAP7_75t_R U226 ( .A(N26), .B(n125), .Y(n117) );
  OAI21xp33_ASAP7_75t_R U227 ( .A1(n77), .A2(n107), .B(n117), .Y(n78) );
  AOI22xp33_ASAP7_75t_R U228 ( .A1(n107), .A2(add_x_2_n69), .B1(n79), .B2(n122), .Y(n80) );
  NAND2xp33_ASAP7_75t_R U229 ( .A(N28), .B(n125), .Y(n118) );
  OAI21xp33_ASAP7_75t_R U230 ( .A1(n81), .A2(n107), .B(n118), .Y(n82) );
  AOI22xp33_ASAP7_75t_R U231 ( .A1(n107), .A2(add_x_2_n68), .B1(n83), .B2(n122), .Y(n84) );
  NAND2xp33_ASAP7_75t_R U232 ( .A(N30), .B(n125), .Y(n119) );
  OAI21xp33_ASAP7_75t_R U233 ( .A1(n85), .A2(n107), .B(n119), .Y(n86) );
  AOI22xp33_ASAP7_75t_R U234 ( .A1(n107), .A2(add_x_2_n67), .B1(n87), .B2(n122), .Y(n88) );
  NAND2xp33_ASAP7_75t_R U235 ( .A(N32), .B(n125), .Y(n120) );
  OAI21xp33_ASAP7_75t_R U236 ( .A1(n89), .A2(n107), .B(n120), .Y(n90) );
  AOI22xp33_ASAP7_75t_R U237 ( .A1(n107), .A2(add_x_2_n66), .B1(n91), .B2(n122), .Y(n92) );
  NAND2xp33_ASAP7_75t_R U238 ( .A(N34), .B(n125), .Y(n121) );
  OAI21xp33_ASAP7_75t_R U239 ( .A1(n93), .A2(n107), .B(n121), .Y(n94) );
  AOI22xp33_ASAP7_75t_R U240 ( .A1(n107), .A2(add_x_2_n65), .B1(n95), .B2(n122), .Y(n96) );
  NAND2xp33_ASAP7_75t_R U241 ( .A(N36), .B(n125), .Y(n123) );
  OAI21xp33_ASAP7_75t_R U242 ( .A1(n97), .A2(n107), .B(n123), .Y(n98) );
  INVxp33_ASAP7_75t_R U243 ( .A(clk), .Y(n124) );
  NOR2xp33_ASAP7_75t_R U244 ( .A(n100), .B(n124), .Y(gated_clk) );
  AND2x2_ASAP7_75t_R U245 ( .A(n125), .B(N37), .Y(N38) );
  AND2x2_ASAP7_75t_R U246 ( .A(n125), .B(data_in[2]), .Y(data_in_gated[2]) );
  AND2x2_ASAP7_75t_R U247 ( .A(n125), .B(data_in[4]), .Y(data_in_gated[4]) );
  AND2x2_ASAP7_75t_R U248 ( .A(n125), .B(data_in[6]), .Y(data_in_gated[6]) );
  AND2x2_ASAP7_75t_R U249 ( .A(n125), .B(data_in[8]), .Y(data_in_gated[8]) );
  AND2x2_ASAP7_75t_R U250 ( .A(n125), .B(data_in[10]), .Y(data_in_gated[10])
         );
  AND2x2_ASAP7_75t_R U251 ( .A(n125), .B(data_in[12]), .Y(data_in_gated[12])
         );
  AND2x2_ASAP7_75t_R U252 ( .A(n125), .B(data_in[14]), .Y(data_in_gated[14])
         );
  AND2x2_ASAP7_75t_R U253 ( .A(n125), .B(data_in[16]), .Y(data_in_gated[16])
         );
  AND2x2_ASAP7_75t_R U254 ( .A(n125), .B(data_in[18]), .Y(data_in_gated[18])
         );
  AND2x2_ASAP7_75t_R U255 ( .A(n125), .B(data_in[20]), .Y(data_in_gated[20])
         );
  AND2x2_ASAP7_75t_R U256 ( .A(n125), .B(data_in[22]), .Y(data_in_gated[22])
         );
  AND2x2_ASAP7_75t_R U257 ( .A(n125), .B(data_in[24]), .Y(data_in_gated[24])
         );
  AND2x2_ASAP7_75t_R U258 ( .A(n125), .B(data_in[26]), .Y(data_in_gated[26])
         );
  AND2x2_ASAP7_75t_R U259 ( .A(n125), .B(data_in[28]), .Y(data_in_gated[28])
         );
  AND2x2_ASAP7_75t_R U260 ( .A(n125), .B(data_in[30]), .Y(data_in_gated[30])
         );
  NOR2xp33_ASAP7_75t_R U261 ( .A(n125), .B(overflow), .Y(n101) );
endmodule

