# This is an example constraints file for a synchronous design with a clock (clk)

# create a virtual clock with period 40 and 50% duty cycle
create_clock -period 40 -waveform {0 20} -name sys_clk

# create actual clock and set parameters
create_clock -period 40 -waveform {0 20} -name clk
set_clock_latency 0.3 clk
set_input_delay 2.0 -clock clk [all_inputs]
set_output_delay 1.65 -clock clk [all_outputs]

# set input/output loads
set_load 0.1 [all_outputs]
set_max_fanout 1 [all_inputs]
set_fanout_load 8 [all_outputs]