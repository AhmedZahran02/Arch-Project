import sys
import numpy as np

#python ./python-scripts/write_to_file.py ./python-scripts/binary_program.txt 1 ./instructions.txt

input_address_mapping_file_path = sys.argv[1] # this should be the compilers output file
input_file_type = int(sys.argv[2])                 # instructions or memory
output_file_path = sys.argv[3]                # where to write

data_out = ['0000000000000000 0' for _ in range(4096)]

with open(input_address_mapping_file_path , "+r") as inFile:
    for line in inFile:
        params = line.split()
        data_out[int(params[0])] = params[1]
        
        if input_file_type == 0:
            data_out[int(params[0])] += " " + params[2]
        else: 
            data_out[int(params[0])] += " " + "0" 

with open(output_file_path,"+w") as f:
    for i in range(len(data_out)):
        if i == len(data_out) - 1:
            f.write(data_out[i])
        else: 
            f.write(data_out[i] + '\n')