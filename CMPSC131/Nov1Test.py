userInput = input("Enter numbers: ")
inputList = userInput.split()
b = int(input("Enter b: "))

list = []
multiples = []
nonMultiples = []

for index in inputList:
    if int(index) % b == 0:
        multiples.append(int(index))
    else:
        nonMultiples.append(int(index))
nonMultiples.sort(reverse = True)
multiples.sort()

index1 = 0
index2 = 0

for x in inputList:
    if int(x) % b == 0:
        list.append(multiples[index1])
        index1 +=1
    else:
        list.append(nonMultiples[index2])
        index2 +=1
print("The sorted sequence is: ", end= " ")
for x in list:
    print(x, end=" ")