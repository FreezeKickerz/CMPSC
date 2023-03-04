x = input("Please enter a character: ")
if type(x)==int:
    if int(x)>=0 and int(x)<=3:
        print("small")
    elif int(x)>=4 and int(x)<=6:
        print("medium")
    elif int(x)>=7 and int(x)<=9:
        print("large")
elif type(x) !=int:
    if (ord(x)>=65)&(ord(x)<=90):
        newInt = ord(x)+32
        print(chr(newInt))
    elif (ord(x)>= 97)&(ord(x)<=122):
        print((ord(x)-96)*x)
    else:
        print("Invalid")
else:
    print("Invalid")