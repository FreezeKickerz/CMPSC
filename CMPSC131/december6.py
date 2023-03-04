#def main(list, streetSet, starting, finish):
    #test

list = []
streetSet = {}
userInput = int(input("Enter number of roads: "))
for x in range(userInput):
    y = input("Enter road: ").split("-")
    if y[0] not in list:
        list.append(y[0])
    if y[0] not in streetSet:
        streetSet[y[0]]= []
    if y[1] not in list:
        list.append(y[1])
    if y[1] not in streetSet:
        streetSet[y[1]] = []
    streetSet[list[0]].append(list[1])
    streetSet[list[1]].append(list[0])

starting = input("Enter starting city: ")
finish = input("Enter destination city: ")

if main(list, streetSet, starting, finish):
    print("Yes it is possible to go from the starting city to the destination")
else:
    print("No it is not possible to go from the starting city to the destination city using", userInput, "or fewer roads")