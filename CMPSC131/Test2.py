userInput = int(input("please enter n:"))
numbers = []
for x in range(userInput):
    numbers.append(input("please enter a number:"))
k = input("please enter k:")
true = 0
for num1 in numbers:
    for num2 in numbers:
        for num3 in numbers:
            z= int(num1)+int(num2)+int(num3)
            if z == k:
                print("three numbers add up to k")                        

