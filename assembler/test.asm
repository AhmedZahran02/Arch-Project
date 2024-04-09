.data
0
256
.code
# all numbers in hex format
# we always start by reset signal
#this is a commented line
#you should ignore empty lines

LDM R3,256
STD R3,2

LDM R1,3
LDM R4,512
LDM R5,768
LDM R6,2
SWAP R1,R2
NEG R1
SUB R2,R2,R2
# TRY INTERRUPT HERE

JZ R4

.ORG 100
OUT R2
INC R2
RTI

.ORG 200
DEC R2
NOT R2
INC R0
CMP R0,R6
JZ R5
JMP R4

.ORG 300
OUT R2
NOP