x = int(input("Please enter a 4 digit number: "))
d1 = x//1000
d2 = (x-(d1*1000))//100
d3 = (x-(d1*1000 + d2*100))//10
d4 = (x-(d1*1000 + d2*100 + d3*10))//1
print(str(d4) + str(d3) + str(d2) + str(d1))