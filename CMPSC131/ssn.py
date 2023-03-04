inputFile = open("information.txt","r")
lines =  inputFile.readlines()
outputFile = open("ssn.txt","w")

def ssnCheck(x):
    if len(x) != 11:
        return False
    if x[3]!= "-" or x[6] != "-":
        return False
    for j in range(0, 3):
        if x[j].isdecimal(): 
            continue
        else:
            return False
    for j in range(4, 6):
        if x[j].isdecimal(): 
            continue
        else:
            return False
    for j in range(7, 11):
        if x[j].isdecimal(): 
            continue
        else:
            return False
    return True

for line in lines:
    for x in range(len(line)+1):
        y = line[x:x+11]
        if ssnCheck(y)==True:
            outputFile.write(y)
            outputFile.write("\n")
