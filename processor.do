add wave -position end  sim:/processor/clk
add wave -position end  sim:/processor/port_in
add wave -position end  sim:/processor/port_out
add wave -position end  sim:/processor/protected_warning
add wave -position end  sim:/processor/reset_signal
add wave -position end  sim:/processor/interrupt_signal
add wave -position end  sim:/processor/current_pc
add wave -position end  sim:/processor/memory_data_out
add wave -position end  sim:/processor/current_flags
add wave -position end sim:/processor/decode/register_file/generalRegister
force -freeze sim:/processor/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/processor/reset_signal 1 0
force -freeze sim:/processor/interrupt_signal 0 0
force -freeze sim:/processor/port_in 32'd60 0
run
run 
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