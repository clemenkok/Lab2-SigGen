#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f sinegen.vcd

# run Verilator to translate Verilog into C++, including C++ Testbench
verilator -Wall --cc --trace sinegen.sv --exe sinegen_tb.cpp

# build CPP project via make automatically generaated
make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

# run exe sim
obj_dir/Vsinegen