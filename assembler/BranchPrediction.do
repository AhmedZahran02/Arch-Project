
add wave -position end  sim:/processor/clk
add wave -radix hex sim:/processor/port_in
add wave -radix hex sim:/processor/port_out
add wave -position end  sim:/processor/protected_warning
add wave -position end  sim:/processor/reset_signal
add wave -position end  sim:/processor/interrupt_signal
add wave -radix hex sim:/processor/current_pc
add wave -radix hex sim:/processor/memory_data_out 
add wave -position end  sim:/processor/current_flags
add wave -radix hex sim:/processor/decode/register_file/generalRegister

force -freeze sim:/processor/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/processor/reset_signal 1 0
force -freeze sim:/processor/interrupt_signal 0 0
force -freeze sim:/processor/port_in 32'd5 0
run 20ps
force -freeze sim:/processor/reset_signal 0 0
run 
run 
run 




run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run