
vsim memory_stage -gui

add wave -position end  sim:/memory_stage/DATA_SIZE
add wave -position end  sim:/memory_stage/SP_STEP
add wave -position end  sim:/memory_stage/FLAGS_COUNT
add wave -position end  sim:/memory_stage/memory_data_in
add wave -position end  sim:/memory_stage/address
add wave -position end  sim:/memory_stage/input_flags
add wave -position end  sim:/memory_stage/write_enable
add wave -position end  sim:/memory_stage/protect_address
add wave -position end  sim:/memory_stage/free_address
add wave -position end  sim:/memory_stage/memory_operation
add wave -position end  sim:/memory_stage/is_stack_operation
add wave -position end  sim:/memory_stage/inc_dec_stack
add wave -position end  sim:/memory_stage/is_push_flags
add wave -position end  sim:/memory_stage/is_pop_flags
add wave -position end  sim:/memory_stage/clk
add wave -position end  sim:/memory_stage/reset
add wave -position end  sim:/memory_stage/memory_data_result
add wave -position end  sim:/memory_stage/final_data
add wave -position end  sim:/memory_stage/memory_data_out
add wave -position end  sim:/memory_stage/address_select
add wave -position end  sim:/memory_stage/memory_data_select
add wave -position end  sim:/memory_stage/stack_pointer_in
add wave -position end  sim:/memory_stage/stack_pointer_out
add wave -position end  sim:/memory_stage/extended_flags

force -freeze sim:/memory_stage/clk 1 0, 0 {60 ps} -r 100
run 10 ps


#test case 1: reseting
force -freeze sim:/memory_stage/memory_data_in 10101010101010101010101010101010 0
force -freeze sim:/memory_stage/address 00000000000000000000000000000000 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 0 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 0 0
force -freeze sim:/memory_stage/is_stack_operation 0 0
force -freeze sim:/memory_stage/inc_dec_stack 0 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 1 0
run





#test case 2: writing to memory location number 0
force -freeze sim:/memory_stage/memory_data_in 10101010101010101010101010101010 0
force -freeze sim:/memory_stage/address 00000000000000000000000000000000 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 1 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 0 0
force -freeze sim:/memory_stage/is_stack_operation 0 0
force -freeze sim:/memory_stage/inc_dec_stack 1 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run




#test case 3: pushing some data
force -freeze sim:/memory_stage/memory_data_in 10011001100110011001100110011001 0
force -freeze sim:/memory_stage/address 00000000000000000000000000000000 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 1 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 1 0
force -freeze sim:/memory_stage/inc_dec_stack 1 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run



#test case 4: read address 2^12 - 2
force -freeze sim:/memory_stage/memory_data_in 10011001100110011001100110011001 0
force -freeze sim:/memory_stage/address 11111111111111111111111111111110 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 0 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 0 0
force -freeze sim:/memory_stage/inc_dec_stack 1 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run



#test case 5: pop stack
force -freeze sim:/memory_stage/memory_data_in 10011001100110011001100110011001 0
force -freeze sim:/memory_stage/address 11111111111111111111111111111110 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 0 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 1 0
force -freeze sim:/memory_stage/inc_dec_stack 0 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run



#test case 6: push flags
force -freeze sim:/memory_stage/memory_data_in 10011001100110011001100110011001 0
force -freeze sim:/memory_stage/address 11111111111111111111111111111110 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 1 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 1 0
force -freeze sim:/memory_stage/inc_dec_stack 1 0
force -freeze sim:/memory_stage/is_push_flags 1 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run


#test case 7: read flags
force -freeze sim:/memory_stage/memory_data_in 10011001100110011001100110011001 0
force -freeze sim:/memory_stage/address 11111111111111111111111111111110 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 0 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 0 0
force -freeze sim:/memory_stage/inc_dec_stack 1 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run



#test case 8: pop flags
force -freeze sim:/memory_stage/memory_data_in 10011001100110011001100110011001 0
force -freeze sim:/memory_stage/address 11111111111111111111111111111110 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 0 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 1 0
force -freeze sim:/memory_stage/inc_dec_stack 0 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run




#test case 9: protect memory
force -freeze sim:/memory_stage/memory_data_in 10011101100111011001110110011101 0
force -freeze sim:/memory_stage/address 00000000000000000000000000000000 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 0 0
force -freeze sim:/memory_stage/protect_address 1 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 0 0
force -freeze sim:/memory_stage/inc_dec_stack 0 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run





#test case 10: writing to protected memory
force -freeze sim:/memory_stage/memory_data_in 10011101100111011001110110011101 0
force -freeze sim:/memory_stage/address 00000000000000000000000000000000 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 1 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 0 0
force -freeze sim:/memory_stage/inc_dec_stack 1 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run




#test case 11: free memory
force -freeze sim:/memory_stage/memory_data_in 10011101100111011001110110011101 0
force -freeze sim:/memory_stage/address 00000000000000000000000000000000 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 0 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 1 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 0 0
force -freeze sim:/memory_stage/inc_dec_stack 0 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run





#test case 12: writing to freed memory
force -freeze sim:/memory_stage/memory_data_in 10011101100111011001110110011101 0
force -freeze sim:/memory_stage/address 00000000000000000000000000000000 0
force -freeze sim:/memory_stage/input_flags 1001 0
force -freeze sim:/memory_stage/write_enable 1 0
force -freeze sim:/memory_stage/protect_address 0 0
force -freeze sim:/memory_stage/free_address 0 0
force -freeze sim:/memory_stage/memory_operation 1 0
force -freeze sim:/memory_stage/is_stack_operation 0 0
force -freeze sim:/memory_stage/inc_dec_stack 1 0
force -freeze sim:/memory_stage/is_push_flags 0 0
force -freeze sim:/memory_stage/is_pop_flags 0 0
force -freeze sim:/memory_stage/reset 0 0
run