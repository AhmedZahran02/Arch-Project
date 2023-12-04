add wave -position end  sim:/counter/clk
add wave -position end  sim:/counter/reset
add wave -position end  sim:/counter/load_enable
add wave -position end  sim:/counter/load_data
add wave -position end  sim:/counter/result
add wave -position end  sim:/counter/counter_reg
add wave -position end  sim:/counter/isNotZero
force -freeze sim:/counter/clk 0 0, 1 {50 ps} -r 100
force -freeze sim:/counter/reset 1 0
force -freeze sim:/counter/load_enable 1 0
force -freeze sim:/counter/load_data 101 0
run
force -freeze sim:/counter/reset 0 0
run
force -freeze sim:/counter/load_enable 0 0
run
run
run
run
run
run
run
run
run