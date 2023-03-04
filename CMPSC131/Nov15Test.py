userInput = input("Please enter desired year: ")
sales = open("sales.txt","r")
lines = sales.readlines()

dateSales = []
for line in lines:
    x = line.split(",")
    id = int(x[0].strip())
    cash = float(x[1].strip())
    date = int(x[2].split("/")[0])

    if date in dateSales:
        if id in dateSales[date]:
            dateSales[date][id] += cash
        else:
            dateSales[date][id] = amount
    else:
        dateSales[date]=



  


    

