opcode = "0010010000000000000000"
newopcode = ""

oldPlacement = [21,20,18,17,10,9,7,3,2,1,0,19,16,15,14,13,12,6,5,4,11,8]

for i in range(0,22):
    newopcode += opcode[21 - int(oldPlacement[i])]

print(newopcode)