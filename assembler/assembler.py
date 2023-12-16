instructions = {
    'NOP': '00000',
    'NOT': '00001',
    'NEG': '00010',
    'INC': '00011',
    'DEC': '00100',
    'OUT': '00101',
    'IN': '00110',
    'ADD': '00111',
    'ADDI': '01000',
    'SUB': '01001',
    'AND': '01010',
    'OR': '01011',
    'XOR': '01100',
    'CMP': '01101',
    'BITSET': '01110',
    'RCL': '01111',
    'RCR': '10000',
    'PUSH': '10001',
    'POP': '10010',
    'PUSHF': '10011',
    'POPF': '10100',
    'LDM': '10101',
    'LDD': '10110',
    'STD': '10111',
    'PROTECT': '11000',
    'FREE': '11001',
    'JZ': '11010',
    'JMP': '11011',
    'CALL': '11100',
    'RET': '11101'
}

last_2_bits = {
    'NOP': '00',
    'NOT': '00',
    'NEG': '00',
    'INC': '00',
    'DEC': '00',
    'OUT': '00',
    'IN': '00',
    'ADD': '00',
    'ADDI': '01',
    'SUB': '00',
    'AND': '00',
    'OR': '00',
    'XOR': '00',
    'CMP': '00',
    'BITSET': '00',
    'RCL': '00',
    'RCR': '00',
    'PUSH': '00',
    'POP': '00',
    'PUSHF': '00',
    'POPF': '00',
    'LDM': '01',
    'LDD': '01',
    'STD': '01',
    'PROTECT': '00',
    'FREE': '00',
    'JZ': '01',
    'JMP': '01',
    'CALL': '01',
    'RET': '11'
}

registers = {
    'R0': '000',
    'R1': '001',
    'R2': '010',
    'R3': '011',
    'R4': '100',
    'R5': '101',
    'R6': '110',
    'R7': '111',
}


def assemble(file_path):
    # Dictionary for storing the memory contents
    memory = {}

    current_address = None

    with open(file_path, 'r') as f:
        for line in f:
            # Ignore lines starting with '#' and empty lines
            if line.startswith('#') or not line.strip():
                continue

            # Remove comments from the line
            line = line.split('#')[0].strip()

            # Check if the line starts with a numeric value
            if line.lstrip()[0].isdigit():
                continue

            # Parse directives
            if line.startswith('.ORG'):
                current_address = int(line.split()[1], 16)
                continue

            # Parse instructions
            tokens = line.strip().split()
            if not tokens:
                continue

            instruction = tokens[0].upper()
            args = tokens[1:] if len(tokens) > 1 else []

            print(f"args {args}")

            # Check if the instruction is recognized
            if instruction not in instructions:
                print(f"Error: Unrecognized instruction '{instruction}'")
                return

            # Ensure consistency in formatting
            formatted_args = [arg.replace(',', '').strip() for arg in args]

            # Split the first element of args if it contains commas
            if formatted_args:
                if instruction in ['NOT', 'NEG', 'INC', 'DEC', 'OUT', 'IN', 'PUSH', 'POP']:
                    Rdst = formatted_args[0] if formatted_args else 'R0'
                    Rsrc1 = 'R0'
                    Rsrc2 = 'R0'

                elif instruction in ['PROTECT', 'FREE']:
                    Rdst = 'R0'
                    Rsrc1 = formatted_args[0] if formatted_args else 'R0'
                    Rsrc2 = 'R0'

                elif instruction in ['CMP']:
                    Rdst = 'R0'
                    Rsrc1 = formatted_args[0] if formatted_args else 'R0'
                    Rsrc2 = formatted_args[1] if len(formatted_args) > 1 else 'R0'

                elif instruction in ['BITSET']:
                    Rdst = formatted_args[0] if formatted_args else 'R0'
                    Rsrc1 = 'R0'
                    Rsrc2 = 'R0'

                elif instruction in ['RCL','RCR']:
                    Rdst = 'R0'
                    Rsrc1 = formatted_args[0] if formatted_args else 'R0'
                    Rsrc2 = 'R0'
                    
                else:
                    Rdst = formatted_args[0] if formatted_args else 'R0'
                    Rsrc1 = formatted_args[1] if len(formatted_args) > 1 and args[-1].isdigit() == False else 'R0'
                    Rsrc2 = formatted_args[2] if len(formatted_args) > 2 and args[-1].isdigit() == False else 'R0'
            else:
                Rdst, Rsrc1, Rsrc2 = 'R0', 'R0', 'R0'  # Provide default registers if args is empty


            machine_code = instructions[instruction] + registers[Rdst] + registers[Rsrc1] + registers[Rsrc2]

            if instruction in last_2_bits:
                machine_code += last_2_bits[instruction]

            # Store the machine code in memory
            memory[current_address] = machine_code
            current_address += 2

            # Handle the imm value
            if formatted_args and formatted_args[-1].isdigit():
                # Handle immediate value separately
                imm_value = int(formatted_args[-1])
                imm_instruction = format(imm_value, '016b')

                memory[current_address] = imm_instruction
                current_address += 2  # Assuming 2 bytes per instruction

    return memory



def write_to_file(memory, output_file='out.txt'):
    if memory is None:
        print("Error during assembly. Cannot write to file.")
        return

    with open(output_file, 'w') as out_file:
        for address, machine_code in sorted(memory.items()):
            out_file.write(f"{machine_code}\n")
            #out_file.write(f"{hex(address)[2:]}: {machine_code}\n")


file_path = 'inst2.asm'
memory_contents = assemble(file_path)

if memory_contents is not None:
    write_to_file(memory_contents)