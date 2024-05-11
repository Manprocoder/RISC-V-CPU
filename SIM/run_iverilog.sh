#!/bin/bash
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "CPU testbench start"
echo ""

# testbench directory
cd .

# if any error, exit
set -e

# clean
#rm -rf simv* crsc* *.log novas* VeriLog
#rm -rf *fsdb VeriLog INCA_Libs ncveriLog*
rm -rf *vvp
rm -rf *vcd

# compiling by ncverilog
#ncverilog +access+rwc \
#                 +nclicq \
#                 -f list.f

#GUI debugging by Verdi
#Verdi -f list.f

# compiling by iverilog
iverilog -o tb_top.vvp tb_top.v
# Running simulation, needed for iverilog
vvp tb_top.vvp

#GUI debugging by gtwave
gtkwave tb_top.vcd

#
echo ""
echo "CPU testbench stop"
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
