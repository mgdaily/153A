#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/ece/Xilinx/SDK/2016.2/bin:/ece/Xilinx/Vivado/2016.2/ids_lite/ISE/bin/lin64:/ece/Xilinx/Vivado/2016.2/bin
else
  PATH=/ece/Xilinx/SDK/2016.2/bin:/ece/Xilinx/Vivado/2016.2/ids_lite/ISE/bin/lin64:/ece/Xilinx/Vivado/2016.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=/ece/Xilinx/Vivado/2016.2/ids_lite/ISE/lib/lin64
else
  LD_LIBRARY_PATH=/ece/Xilinx/Vivado/2016.2/ids_lite/ISE/lib/lin64:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/fs/student/mgdaily/Documents/ECE153/Lab1A/Lab1A_Project/Lab_1A_Project_Files/Lab_1A.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log lab1_template_wrapper.vds -m64 -mode batch -messageDb vivado.pb -notrace -source lab1_template_wrapper.tcl