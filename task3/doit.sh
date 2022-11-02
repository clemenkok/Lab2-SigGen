#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f sigdelay.vcd

# run Verilator to translate Verilog into C++, including C++ Testbench
verilator -Wall --cc --trace sigdelay.sv --exe sigdelay_tb.cpp

# build CPP project via make automatically generaated
make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay

# run exe sim
obj_dir/Vsigdelay