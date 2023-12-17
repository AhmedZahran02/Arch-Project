add wave -position insertpoint sim:/processor/*
force -freeze sim:/processor/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/processor/global_reset 1 0
force -freeze sim:/processor/temp_instruction 16'd0 0
run
run
run
force -freeze sim:/processor/global_reset 0 0
run
run
run
force -freeze sim:/processor/temp_instruction 0000100000000000 0
run
run
run
run
run
add wave -position insertpoint sim:/processor/decode/register_file/*
run
force -freeze sim:/processor/decode/register_file/generalRegister(3) 00000000000000000000000000000100 0
force -freeze sim:/processor/decode/register_file/generalRegister(5) 00000000000000000000000001000001 0
run
run
force -freeze sim:/processor/temp_instruction 0011111101110100 0
run
run
run
run