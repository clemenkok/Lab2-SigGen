# Lab 2 Notes by ck21

## Challenges Faced

The display on VBuddy gives a wave that reflects the current value of the address in the ROM accessed via the current vbdValue. Based on the digital logic, this seems correct. Thus our experimental output verifies the design.

However, given the name sinegen, I was expecting a sine wave. 

```
always_ff @ (posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else     count <= count + incr + {{WIDTH-1{1'b0}}, en};
```

This was fixed after a minor modification of `counter.sv`, which had to have feedback. A sine wave was generated on the vbuddy screen.


```
for (simcyc=0; simcyc<MAX_SIM_CYC; simcyc++) {
    // dump variables into VCD file and toggle clock
    for (tick=0; tick<2; tick++) {
      tfp->dump (2*simcyc+tick);
      top->clk = !top->clk;
      top->eval ();
    }
    
    top->incr2 = 1 + vbdValue();
```

For task 2, we simply replicate existing components `rom.sv` and `counter.sv` and thereafter add `vbdValue()` to the existing `incr` to adjust the offset.