# all numbers in hex format
# we always start by reset signal
#this is a commented line
.ORG 0  #this means the the following line would be  at address  0 , and this is the reset address
10
#you should ignore empty lines

.ORG 2  #this is the interrupt address
100

.data
20
40
60
101
.ORG 50
554
565
202

.code
.ORG 10
NOP            #No change
CMP R1       , R2
ADD R0, R1, R2 
ADDI R7, R1, 15
PUSHF
NOP
NOP 
LDM R3,15
NOP
NOP
RET
CALL R1

NOP
NOP
SWAP R1,R2

