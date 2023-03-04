userInput = int(input("Please Enter n: "))

higherPrimes = []
lowerPrimes =[]
counter = userInput

i = 0
while i < 5:

    counter+=1
    for j in range(2, counter):
        if counter % j == 0:
            break
    else: 
        higherPrimes.append(counter)
        i+=1

counter=userInput
p = 0
while p < 5:
    counter-=1
    for j in range(2,counter):
        if counter % j == 0:
            break
    else:
        lowerPrimes.append(counter)
        p+=1
    if counter <= 2:
        break
print("Larger primes: ", end=" ")
for x in range(len(higherPrimes)):
    print(higherPrimes[x],end=" ")
print("\nSmaller primes: ",end=" ")
for x in range(len(lowerPrimes)):
    print(lowerPrimes[x],end=" ")