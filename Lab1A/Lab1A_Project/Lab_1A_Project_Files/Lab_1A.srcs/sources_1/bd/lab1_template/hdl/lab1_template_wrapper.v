//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Mon Oct  3 13:35:56 2016
//Host        : csil-18.cs.ucsb.edu running 64-bit Fedora release 23 (Twenty Three)
//Command     : generate_target lab1_template_wrapper.bd
//Design      : lab1_template_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module lab1_template_wrapper
   (btnCpuReset,
    reset_rtl);
  input btnCpuReset;
  input reset_rtl;

  wire btnCpuReset;
  wire reset_rtl;

  lab1_template lab1_template_i
       (.btnCpuReset(btnCpuReset),
        .reset_rtl(reset_rtl));
endmodule
