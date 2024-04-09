# MoAoZ KE 512H
## Description 
* This Project is a practical application to a single-core, harvard-architecture processor using VHDL.

* The processor introduce many different operations and communicating with one port.

## Schematic Diagram 
![External SVG](./Schematic%20Diagram.svg)


## CPU features
* concept of pipelining is applied in the operation of the processor where it's divided into 5 different stages as follows: 
    * fetch instruction from the instruction memory
    * decode this instruction and generate all required flags
    * execute instruction in the ALU unit
    * Read/Write operations from the data memory
    * write result back to register file.

* this processor supports different types of instructions including 
    * one operand instructions (NOT - NEG - INC - DEC)
    * two operand instructions (ADD - SUB - AND - OR - XOR - SWAP - CMP)
    * logical instructions (BITSET - SHIFT - ROTATE)
    * memory instructions (LOAD - STORE - PROTECT and FREE address)
    * stack instructions (PUSH - POP)
    * branching instructions (CALL - RET - JMP - JZ)
    * reset and interrupt signals

* in addition to the hardware design, an assembler is also provided with examples in assembler folder 

* every instruction is designed to work purely using hardware design no software solution is envolved in this project