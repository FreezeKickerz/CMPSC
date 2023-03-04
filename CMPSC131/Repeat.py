input = input("Please enter the string: ")
counter = 0
maxCounter = 0
maxCharacter = ""
previousCharacter = ""
for x in input:
    if previousCharacter == x:
        counter += 1
    else:
        counter = 1
    if counter > maxCounter:
        maxCounter = counter
        maxCharacter = x
    previousCharacter = x
print("The longest sequence is", maxCharacter, "repeated", maxCounter, "times")