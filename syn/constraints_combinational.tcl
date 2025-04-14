# This is an example constraints file for a combinational design without a clock

# create a virtual clock with period 40 and 50% duty cycle
create_clock -period 40 -waveform {0 20} -name sys_clk

# set input/output loads
set_load 0.1 [all_outputs]
set_max_fanout 1 [all_inputs]
set_fanout_load 8 [all_outputs]