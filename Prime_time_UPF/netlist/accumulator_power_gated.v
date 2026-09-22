/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP3
// Date      : Sat Sep 19 23:25:50 2026
/////////////////////////////////////////////////////////////


module accumulator_power_gated ( clk, rst_n, enable, data_in, acc_out, 
        overflow );
  input [31:0] data_in;
  output [31:0] acc_out;
  input clk, rst_n, enable;
  output overflow;
  wire   N4, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, add_x_2_n79,
         add_x_2_n78, add_x_2_n77, add_x_2_n76, add_x_2_n75, add_x_2_n74,
         add_x_2_n73, add_x_2_n72, add_x_2_n71, add_x_2_n70, add_x_2_n69,
         add_x_2_n68, add_x_2_n67, add_x_2_n66, add_x_2_n65, add_x_2_n64,
         add_x_2_n63, add_x_2_n62, add_x_2_n61, add_x_2_n60, add_x_2_n59,
         add_x_2_n58, add_x_2_n57, add_x_2_n56, add_x_2_n55, add_x_2_n54,
         add_x_2_n53, add_x_2_n52, add_x_2_n51, add_x_2_n50, add_x_2_n49,
         add_x_2_n48, add_x_2_n47, add_x_2_n46, add_x_2_n45, add_x_2_n44,
         add_x_2_n43, add_x_2_n42, add_x_2_n41, add_x_2_n40, add_x_2_n39,
         add_x_2_n38, add_x_2_n37, add_x_2_n36, add_x_2_n35, add_x_2_n34,
         add_x_2_n32, add_x_2_n30, add_x_2_n28, add_x_2_n26, add_x_2_n24,
         add_x_2_n22, add_x_2_n20, add_x_2_n18, add_x_2_n16, add_x_2_n14,
         add_x_2_n12, add_x_2_n10, add_x_2_n8, add_x_2_n6, add_x_2_n4,
         add_x_2_n2, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121;
  wire   [30:2] data_in_gated;
  wire   [32:1] extended_sum;

  ASYNC_DFFHx1_ASAP7_75t_R overflow_reg ( .D(N4), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n98) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_31_ ( .D(n97), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n96) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_30_ ( .D(n95), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n94) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_29_ ( .D(n93), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n92) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_28_ ( .D(n91), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n90) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_27_ ( .D(n89), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n88) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_26_ ( .D(n87), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n86) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_25_ ( .D(n85), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n84) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_24_ ( .D(n83), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n82) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_23_ ( .D(n81), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n80) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_22_ ( .D(n79), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n78) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_21_ ( .D(n77), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n76) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_20_ ( .D(n75), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n74) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_19_ ( .D(n73), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n72) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_18_ ( .D(n71), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n70) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_17_ ( .D(n69), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n68) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_16_ ( .D(n67), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n66) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_15_ ( .D(n65), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n64) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_14_ ( .D(n63), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n62) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_13_ ( .D(n61), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n60) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_12_ ( .D(n59), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n58) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_11_ ( .D(n57), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n56) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_10_ ( .D(n55), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n54) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_9_ ( .D(n53), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n52) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_8_ ( .D(n51), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n50) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_7_ ( .D(n49), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n48) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_6_ ( .D(n47), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n46) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_5_ ( .D(n45), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n44) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_4_ ( .D(n43), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n42) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_3_ ( .D(n41), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n40) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_2_ ( .D(n39), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n38) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_1_ ( .D(n37), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n36) );
  ASYNC_DFFHx1_ASAP7_75t_R acc_out_reg_0_ ( .D(n35), .CLK(clk), .RESET(n34), 
        .SET(n100), .QN(n33) );
  FAx1_ASAP7_75t_R add_x_2_U76 ( .A(n36), .B(add_x_2_n32), .CI(add_x_2_n64), 
        .CON(add_x_2_n63), .SN(extended_sum[1]) );
  FAx1_ASAP7_75t_R add_x_2_U75 ( .A(acc_out[2]), .B(data_in_gated[2]), .CI(
        add_x_2_n63), .CON(add_x_2_n62), .SN(add_x_2_n79) );
  FAx1_ASAP7_75t_R add_x_2_U71 ( .A(n40), .B(add_x_2_n30), .CI(add_x_2_n62), 
        .CON(add_x_2_n61), .SN(extended_sum[3]) );
  FAx1_ASAP7_75t_R add_x_2_U70 ( .A(acc_out[4]), .B(data_in_gated[4]), .CI(
        add_x_2_n61), .CON(add_x_2_n60), .SN(add_x_2_n78) );
  FAx1_ASAP7_75t_R add_x_2_U66 ( .A(n44), .B(add_x_2_n28), .CI(add_x_2_n60), 
        .CON(add_x_2_n59), .SN(extended_sum[5]) );
  FAx1_ASAP7_75t_R add_x_2_U65 ( .A(acc_out[6]), .B(data_in_gated[6]), .CI(
        add_x_2_n59), .CON(add_x_2_n58), .SN(add_x_2_n77) );
  FAx1_ASAP7_75t_R add_x_2_U61 ( .A(n48), .B(add_x_2_n26), .CI(add_x_2_n58), 
        .CON(add_x_2_n57), .SN(extended_sum[7]) );
  FAx1_ASAP7_75t_R add_x_2_U60 ( .A(acc_out[8]), .B(data_in_gated[8]), .CI(
        add_x_2_n57), .CON(add_x_2_n56), .SN(add_x_2_n76) );
  FAx1_ASAP7_75t_R add_x_2_U56 ( .A(n52), .B(add_x_2_n24), .CI(add_x_2_n56), 
        .CON(add_x_2_n55), .SN(extended_sum[9]) );
  FAx1_ASAP7_75t_R add_x_2_U55 ( .A(acc_out[10]), .B(data_in_gated[10]), .CI(
        add_x_2_n55), .CON(add_x_2_n54), .SN(add_x_2_n75) );
  FAx1_ASAP7_75t_R add_x_2_U51 ( .A(n56), .B(add_x_2_n22), .CI(add_x_2_n54), 
        .CON(add_x_2_n53), .SN(extended_sum[11]) );
  FAx1_ASAP7_75t_R add_x_2_U50 ( .A(acc_out[12]), .B(data_in_gated[12]), .CI(
        add_x_2_n53), .CON(add_x_2_n52), .SN(add_x_2_n74) );
  FAx1_ASAP7_75t_R add_x_2_U46 ( .A(n60), .B(add_x_2_n20), .CI(add_x_2_n52), 
        .CON(add_x_2_n51), .SN(extended_sum[13]) );
  FAx1_ASAP7_75t_R add_x_2_U45 ( .A(acc_out[14]), .B(data_in_gated[14]), .CI(
        add_x_2_n51), .CON(add_x_2_n50), .SN(add_x_2_n73) );
  FAx1_ASAP7_75t_R add_x_2_U41 ( .A(n64), .B(add_x_2_n18), .CI(add_x_2_n50), 
        .CON(add_x_2_n49), .SN(extended_sum[15]) );
  FAx1_ASAP7_75t_R add_x_2_U40 ( .A(acc_out[16]), .B(data_in_gated[16]), .CI(
        add_x_2_n49), .CON(add_x_2_n48), .SN(add_x_2_n72) );
  FAx1_ASAP7_75t_R add_x_2_U36 ( .A(n68), .B(add_x_2_n16), .CI(add_x_2_n48), 
        .CON(add_x_2_n47), .SN(extended_sum[17]) );
  FAx1_ASAP7_75t_R add_x_2_U35 ( .A(acc_out[18]), .B(data_in_gated[18]), .CI(
        add_x_2_n47), .CON(add_x_2_n46), .SN(add_x_2_n71) );
  FAx1_ASAP7_75t_R add_x_2_U31 ( .A(n72), .B(add_x_2_n14), .CI(add_x_2_n46), 
        .CON(add_x_2_n45), .SN(extended_sum[19]) );
  FAx1_ASAP7_75t_R add_x_2_U30 ( .A(acc_out[20]), .B(data_in_gated[20]), .CI(
        add_x_2_n45), .CON(add_x_2_n44), .SN(add_x_2_n70) );
  FAx1_ASAP7_75t_R add_x_2_U26 ( .A(n76), .B(add_x_2_n12), .CI(add_x_2_n44), 
        .CON(add_x_2_n43), .SN(extended_sum[21]) );
  FAx1_ASAP7_75t_R add_x_2_U25 ( .A(acc_out[22]), .B(data_in_gated[22]), .CI(
        add_x_2_n43), .CON(add_x_2_n42), .SN(add_x_2_n69) );
  FAx1_ASAP7_75t_R add_x_2_U21 ( .A(n80), .B(add_x_2_n10), .CI(add_x_2_n42), 
        .CON(add_x_2_n41), .SN(extended_sum[23]) );
  FAx1_ASAP7_75t_R add_x_2_U20 ( .A(acc_out[24]), .B(data_in_gated[24]), .CI(
        add_x_2_n41), .CON(add_x_2_n40), .SN(add_x_2_n68) );
  FAx1_ASAP7_75t_R add_x_2_U16 ( .A(n84), .B(add_x_2_n8), .CI(add_x_2_n40), 
        .CON(add_x_2_n39), .SN(extended_sum[25]) );
  FAx1_ASAP7_75t_R add_x_2_U15 ( .A(acc_out[26]), .B(data_in_gated[26]), .CI(
        add_x_2_n39), .CON(add_x_2_n38), .SN(add_x_2_n67) );
  FAx1_ASAP7_75t_R add_x_2_U11 ( .A(n88), .B(add_x_2_n6), .CI(add_x_2_n38), 
        .CON(add_x_2_n37), .SN(extended_sum[27]) );
  FAx1_ASAP7_75t_R add_x_2_U10 ( .A(acc_out[28]), .B(data_in_gated[28]), .CI(
        add_x_2_n37), .CON(add_x_2_n36), .SN(add_x_2_n66) );
  FAx1_ASAP7_75t_R add_x_2_U6 ( .A(n92), .B(add_x_2_n4), .CI(add_x_2_n36), 
        .CON(add_x_2_n35), .SN(extended_sum[29]) );
  FAx1_ASAP7_75t_R add_x_2_U5 ( .A(acc_out[30]), .B(data_in_gated[30]), .CI(
        add_x_2_n35), .CON(add_x_2_n34), .SN(add_x_2_n65) );
  FAx1_ASAP7_75t_R add_x_2_U1 ( .A(n96), .B(add_x_2_n2), .CI(add_x_2_n34), 
        .CON(extended_sum[32]), .SN(extended_sum[31]) );
  INVxp33_ASAP7_75t_R U135 ( .A(n33), .Y(acc_out[0]) );
  INVxp33_ASAP7_75t_R U136 ( .A(n46), .Y(acc_out[6]) );
  INVxp33_ASAP7_75t_R U137 ( .A(n74), .Y(acc_out[20]) );
  INVxp67_ASAP7_75t_R U138 ( .A(n90), .Y(acc_out[28]) );
  INVxp67_ASAP7_75t_R U139 ( .A(n94), .Y(acc_out[30]) );
  INVxp67_ASAP7_75t_R U140 ( .A(n86), .Y(acc_out[26]) );
  INVxp67_ASAP7_75t_R U141 ( .A(n82), .Y(acc_out[24]) );
  INVxp67_ASAP7_75t_R U142 ( .A(n78), .Y(acc_out[22]) );
  INVxp67_ASAP7_75t_R U143 ( .A(n70), .Y(acc_out[18]) );
  INVxp67_ASAP7_75t_R U144 ( .A(n66), .Y(acc_out[16]) );
  INVxp67_ASAP7_75t_R U145 ( .A(n62), .Y(acc_out[14]) );
  INVxp67_ASAP7_75t_R U146 ( .A(n58), .Y(acc_out[12]) );
  INVxp67_ASAP7_75t_R U147 ( .A(n54), .Y(acc_out[10]) );
  INVxp67_ASAP7_75t_R U148 ( .A(n50), .Y(acc_out[8]) );
  INVxp67_ASAP7_75t_R U149 ( .A(n42), .Y(acc_out[4]) );
  INVxp67_ASAP7_75t_R U150 ( .A(n38), .Y(acc_out[2]) );
  HB1xp67_ASAP7_75t_R U151 ( .A(enable), .Y(n101) );
  HB1xp67_ASAP7_75t_R U152 ( .A(enable), .Y(n105) );
  INVx1_ASAP7_75t_R U153 ( .A(rst_n), .Y(n100) );
  TIELOx1_ASAP7_75t_R U154 ( .L(n34) );
  INVxp33_ASAP7_75t_R U155 ( .A(n98), .Y(overflow) );
  INVxp33_ASAP7_75t_R U156 ( .A(n92), .Y(acc_out[29]) );
  INVxp33_ASAP7_75t_R U157 ( .A(n48), .Y(acc_out[7]) );
  INVxp33_ASAP7_75t_R U158 ( .A(n96), .Y(acc_out[31]) );
  INVxp33_ASAP7_75t_R U159 ( .A(n44), .Y(acc_out[5]) );
  INVxp33_ASAP7_75t_R U160 ( .A(n84), .Y(acc_out[25]) );
  INVxp33_ASAP7_75t_R U161 ( .A(n36), .Y(acc_out[1]) );
  INVxp33_ASAP7_75t_R U162 ( .A(n56), .Y(acc_out[11]) );
  INVxp33_ASAP7_75t_R U163 ( .A(n80), .Y(acc_out[23]) );
  INVxp33_ASAP7_75t_R U164 ( .A(n60), .Y(acc_out[13]) );
  INVxp33_ASAP7_75t_R U165 ( .A(n64), .Y(acc_out[15]) );
  INVxp33_ASAP7_75t_R U166 ( .A(n72), .Y(acc_out[19]) );
  INVxp33_ASAP7_75t_R U167 ( .A(n68), .Y(acc_out[17]) );
  INVxp33_ASAP7_75t_R U168 ( .A(n88), .Y(acc_out[27]) );
  INVxp33_ASAP7_75t_R U169 ( .A(n76), .Y(acc_out[21]) );
  INVxp33_ASAP7_75t_R U170 ( .A(n52), .Y(acc_out[9]) );
  INVxp33_ASAP7_75t_R U171 ( .A(n40), .Y(acc_out[3]) );
  NAND3xp33_ASAP7_75t_R U172 ( .A(n101), .B(data_in[0]), .C(acc_out[0]), .Y(
        add_x_2_n64) );
  NAND2xp33_ASAP7_75t_R U173 ( .A(n101), .B(data_in[1]), .Y(add_x_2_n32) );
  NAND2xp33_ASAP7_75t_R U174 ( .A(n101), .B(data_in[3]), .Y(add_x_2_n30) );
  NAND2xp33_ASAP7_75t_R U175 ( .A(n101), .B(data_in[5]), .Y(add_x_2_n28) );
  NAND2xp33_ASAP7_75t_R U176 ( .A(n101), .B(data_in[7]), .Y(add_x_2_n26) );
  NAND2xp33_ASAP7_75t_R U177 ( .A(n101), .B(data_in[9]), .Y(add_x_2_n24) );
  NAND2xp33_ASAP7_75t_R U178 ( .A(n101), .B(data_in[11]), .Y(add_x_2_n22) );
  NAND2xp33_ASAP7_75t_R U179 ( .A(n101), .B(data_in[13]), .Y(add_x_2_n20) );
  NAND2xp33_ASAP7_75t_R U180 ( .A(n101), .B(data_in[15]), .Y(add_x_2_n18) );
  NAND2xp33_ASAP7_75t_R U181 ( .A(n101), .B(data_in[17]), .Y(add_x_2_n16) );
  NAND2xp33_ASAP7_75t_R U182 ( .A(n101), .B(data_in[19]), .Y(add_x_2_n14) );
  NAND2xp33_ASAP7_75t_R U183 ( .A(n101), .B(data_in[21]), .Y(add_x_2_n12) );
  NAND2xp33_ASAP7_75t_R U184 ( .A(n101), .B(data_in[23]), .Y(add_x_2_n10) );
  NAND2xp33_ASAP7_75t_R U185 ( .A(n101), .B(data_in[25]), .Y(add_x_2_n8) );
  NAND2xp33_ASAP7_75t_R U186 ( .A(n101), .B(data_in[27]), .Y(add_x_2_n6) );
  NAND2xp33_ASAP7_75t_R U187 ( .A(n101), .B(data_in[29]), .Y(add_x_2_n4) );
  NAND2xp33_ASAP7_75t_R U188 ( .A(n101), .B(data_in[31]), .Y(add_x_2_n2) );
  NAND2xp33_ASAP7_75t_R U189 ( .A(n101), .B(data_in[0]), .Y(n103) );
  INVxp33_ASAP7_75t_R U190 ( .A(add_x_2_n64), .Y(n102) );
  AOI21xp33_ASAP7_75t_R U191 ( .A1(n33), .A2(n103), .B(n102), .Y(n35) );
  NAND2xp33_ASAP7_75t_R U192 ( .A(extended_sum[1]), .B(n101), .Y(n104) );
  OAI21xp33_ASAP7_75t_R U193 ( .A1(n36), .A2(n105), .B(n104), .Y(n37) );
  INVxp33_ASAP7_75t_R U194 ( .A(enable), .Y(n120) );
  AOI22xp33_ASAP7_75t_R U195 ( .A1(n105), .A2(add_x_2_n79), .B1(n38), .B2(n120), .Y(n39) );
  NAND2xp33_ASAP7_75t_R U196 ( .A(extended_sum[3]), .B(n105), .Y(n106) );
  OAI21xp33_ASAP7_75t_R U197 ( .A1(n40), .A2(n105), .B(n106), .Y(n41) );
  AOI22xp33_ASAP7_75t_R U198 ( .A1(n105), .A2(add_x_2_n78), .B1(n42), .B2(n120), .Y(n43) );
  NAND2xp33_ASAP7_75t_R U199 ( .A(extended_sum[5]), .B(n105), .Y(n107) );
  OAI21xp33_ASAP7_75t_R U200 ( .A1(n44), .A2(n105), .B(n107), .Y(n45) );
  AOI22xp33_ASAP7_75t_R U201 ( .A1(n105), .A2(add_x_2_n77), .B1(n46), .B2(n120), .Y(n47) );
  NAND2xp33_ASAP7_75t_R U202 ( .A(extended_sum[7]), .B(n105), .Y(n108) );
  OAI21xp33_ASAP7_75t_R U203 ( .A1(n48), .A2(n105), .B(n108), .Y(n49) );
  AOI22xp33_ASAP7_75t_R U204 ( .A1(n105), .A2(add_x_2_n76), .B1(n50), .B2(n120), .Y(n51) );
  NAND2xp33_ASAP7_75t_R U205 ( .A(extended_sum[9]), .B(n105), .Y(n109) );
  OAI21xp33_ASAP7_75t_R U206 ( .A1(n52), .A2(n105), .B(n109), .Y(n53) );
  AOI22xp33_ASAP7_75t_R U207 ( .A1(n105), .A2(add_x_2_n75), .B1(n54), .B2(n120), .Y(n55) );
  NAND2xp33_ASAP7_75t_R U208 ( .A(extended_sum[11]), .B(n105), .Y(n110) );
  OAI21xp33_ASAP7_75t_R U209 ( .A1(n56), .A2(n105), .B(n110), .Y(n57) );
  AOI22xp33_ASAP7_75t_R U210 ( .A1(n105), .A2(add_x_2_n74), .B1(n58), .B2(n120), .Y(n59) );
  NAND2xp33_ASAP7_75t_R U211 ( .A(extended_sum[13]), .B(n101), .Y(n111) );
  OAI21xp33_ASAP7_75t_R U212 ( .A1(n60), .A2(n105), .B(n111), .Y(n61) );
  AOI22xp33_ASAP7_75t_R U213 ( .A1(n105), .A2(add_x_2_n73), .B1(n62), .B2(n120), .Y(n63) );
  NAND2xp33_ASAP7_75t_R U214 ( .A(extended_sum[15]), .B(n105), .Y(n112) );
  OAI21xp33_ASAP7_75t_R U215 ( .A1(n64), .A2(n105), .B(n112), .Y(n65) );
  AOI22xp33_ASAP7_75t_R U216 ( .A1(n105), .A2(add_x_2_n72), .B1(n66), .B2(n120), .Y(n67) );
  NAND2xp33_ASAP7_75t_R U217 ( .A(extended_sum[17]), .B(n105), .Y(n113) );
  OAI21xp33_ASAP7_75t_R U218 ( .A1(n68), .A2(n105), .B(n113), .Y(n69) );
  AOI22xp33_ASAP7_75t_R U219 ( .A1(n105), .A2(add_x_2_n71), .B1(n70), .B2(n120), .Y(n71) );
  NAND2xp33_ASAP7_75t_R U220 ( .A(extended_sum[19]), .B(n101), .Y(n114) );
  OAI21xp33_ASAP7_75t_R U221 ( .A1(n72), .A2(n105), .B(n114), .Y(n73) );
  AOI22xp33_ASAP7_75t_R U222 ( .A1(n105), .A2(add_x_2_n70), .B1(n74), .B2(n120), .Y(n75) );
  NAND2xp33_ASAP7_75t_R U223 ( .A(extended_sum[21]), .B(n101), .Y(n115) );
  OAI21xp33_ASAP7_75t_R U224 ( .A1(n76), .A2(n105), .B(n115), .Y(n77) );
  AOI22xp33_ASAP7_75t_R U225 ( .A1(n105), .A2(add_x_2_n69), .B1(n78), .B2(n120), .Y(n79) );
  NAND2xp33_ASAP7_75t_R U226 ( .A(extended_sum[23]), .B(n101), .Y(n116) );
  OAI21xp33_ASAP7_75t_R U227 ( .A1(n80), .A2(n105), .B(n116), .Y(n81) );
  AOI22xp33_ASAP7_75t_R U228 ( .A1(n105), .A2(add_x_2_n68), .B1(n82), .B2(n120), .Y(n83) );
  NAND2xp33_ASAP7_75t_R U229 ( .A(extended_sum[25]), .B(n101), .Y(n117) );
  OAI21xp33_ASAP7_75t_R U230 ( .A1(n84), .A2(n105), .B(n117), .Y(n85) );
  AOI22xp33_ASAP7_75t_R U231 ( .A1(n105), .A2(add_x_2_n67), .B1(n86), .B2(n120), .Y(n87) );
  NAND2xp33_ASAP7_75t_R U232 ( .A(extended_sum[27]), .B(n101), .Y(n118) );
  OAI21xp33_ASAP7_75t_R U233 ( .A1(n88), .A2(n105), .B(n118), .Y(n89) );
  AOI22xp33_ASAP7_75t_R U234 ( .A1(n105), .A2(add_x_2_n66), .B1(n90), .B2(n120), .Y(n91) );
  NAND2xp33_ASAP7_75t_R U235 ( .A(extended_sum[29]), .B(n101), .Y(n119) );
  OAI21xp33_ASAP7_75t_R U236 ( .A1(n92), .A2(n105), .B(n119), .Y(n93) );
  AOI22xp33_ASAP7_75t_R U237 ( .A1(n105), .A2(add_x_2_n65), .B1(n94), .B2(n120), .Y(n95) );
  NAND2xp33_ASAP7_75t_R U238 ( .A(extended_sum[31]), .B(n101), .Y(n121) );
  OAI21xp33_ASAP7_75t_R U239 ( .A1(n96), .A2(n105), .B(n121), .Y(n97) );
  AND2x2_ASAP7_75t_R U240 ( .A(n101), .B(extended_sum[32]), .Y(N4) );
  AND2x2_ASAP7_75t_R U241 ( .A(n101), .B(data_in[2]), .Y(data_in_gated[2]) );
  AND2x2_ASAP7_75t_R U242 ( .A(n101), .B(data_in[4]), .Y(data_in_gated[4]) );
  AND2x2_ASAP7_75t_R U243 ( .A(n101), .B(data_in[6]), .Y(data_in_gated[6]) );
  AND2x2_ASAP7_75t_R U244 ( .A(n101), .B(data_in[8]), .Y(data_in_gated[8]) );
  AND2x2_ASAP7_75t_R U245 ( .A(n101), .B(data_in[10]), .Y(data_in_gated[10])
         );
  AND2x2_ASAP7_75t_R U246 ( .A(n101), .B(data_in[12]), .Y(data_in_gated[12])
         );
  AND2x2_ASAP7_75t_R U247 ( .A(n101), .B(data_in[14]), .Y(data_in_gated[14])
         );
  AND2x2_ASAP7_75t_R U248 ( .A(n101), .B(data_in[16]), .Y(data_in_gated[16])
         );
  AND2x2_ASAP7_75t_R U249 ( .A(n101), .B(data_in[18]), .Y(data_in_gated[18])
         );
  AND2x2_ASAP7_75t_R U250 ( .A(n101), .B(data_in[20]), .Y(data_in_gated[20])
         );
  AND2x2_ASAP7_75t_R U251 ( .A(n101), .B(data_in[22]), .Y(data_in_gated[22])
         );
  AND2x2_ASAP7_75t_R U252 ( .A(n101), .B(data_in[24]), .Y(data_in_gated[24])
         );
  AND2x2_ASAP7_75t_R U253 ( .A(n101), .B(data_in[26]), .Y(data_in_gated[26])
         );
  AND2x2_ASAP7_75t_R U254 ( .A(n101), .B(data_in[28]), .Y(data_in_gated[28])
         );
  AND2x2_ASAP7_75t_R U255 ( .A(n101), .B(data_in[30]), .Y(data_in_gated[30])
         );
endmodule

