bookList = open("booklist-2.txt","r")
books = bookList.read().split("\n")
bookList.close()

#BookList Variables
bookName = []
bookCopies = []
bookRestrictions = []
totalDaysBorrowed = []
totalDaysFree = []
totalBookCopies = []
usagePerBook = []

#Getting Date Variable from End of File
libraryLog = open("librarylog-3.txt","r")
forDate = libraryLog.read().split("\n")
presentDate = int(forDate[len(forDate)-1])
libraryLog.close()

# Format <book name>#<number of copies>#<restricted>
for x in books:
    line = x.split("#")
    restrictions = 0
    bookName.append(line[0])
    bookCopies.append(int(line[1]))
    totalBookCopies.append(int(line[1]))
    if line[2] == "TRUE":
        restrictions = 1
    bookRestrictions.append(restrictions)
    totalDaysBorrowed.append(0)
    totalDaysFree.append(int(line[1])*(presentDate-1))

# Library Log Variables

#Name:NameOfBook:
#DaysOverdue[0]DayTakenOut[1]DaysBorrowedFor[2]Returned[3]
personInfo = {}

#Name:Amount of Books out[0]Fine$[1]
personBlacklist = {}

libraryLog = open("librarylog-3.txt","r")
log = libraryLog.read().split("\n")[:-1]
libraryLog.close()

#Running Library Log
for x in log:
    line = x.split("#")
    if line[2] not in personInfo and line[0] != "A":
        personInfo[line[2]] = {}
        personBlacklist[line[2]] = [0,0]
    
    #Borrow Function
    if line[0] == "B":
        bookPosition = bookName.index(line[3])
        bookCopies[bookPosition] -=1     
        if line[3] not in personInfo[line[2]]:
            personInfo[line[2]][line[3]] = [0,int(line[1]),int(line[4]),0]
        else:
            personBlacklist[line[2]][0]+= 1
            personInfo[line[2]][line[3]][1] = int(line[1])
            personInfo[line[2]][line[3]][2] = int(line[4])
            personInfo[line[2]][line[3]][3] = 0
        
    #Return Function
    if line[0] == "R":
        bookPosition = bookName.index(line[3])
        bookCopies[bookPosition] += 1
        personInfo[line[2]][line[3]][3] = 1
        personBlacklist[line[2]][0] -=1
        
        days_borrowed = int(line[1]) - personInfo[line[2]][line[3]][1]
        totalDaysBorrowed[bookPosition] += days_borrowed
        
        #Fine Calculations
        if days_borrowed > int(personInfo[line[2]][line[3]][2]):
            sum = days_borrowed - int(personInfo[line[2]][line[3]][2])
            personInfo[line[2]][line[3]][0] = sum
            personBlacklist[line[2]][1] = sum*(1+(4*bookRestrictions[bookPosition]))

    #Paying Fine Calculation
    if line[0] == "P":
        personBlacklist[line[2]][1] -= int(line[3])

    #Adding Book Function
    if line[0] == "A":
        if line[2] not in bookName:
            bookName.append(line[2])
            bookCopies.append(1)
            totalBookCopies.append(1)
            bookRestrictions.append(0)
            totalDaysBorrowed.append(0)
            totalDaysFree.append(presentDate-int(line[1]))
        else:
            bookPosition = bookName.index(line[2])
            bookCopies[bookPosition] += 1
            totalBookCopies[bookPosition] +=1
            x = (presentDate - int(line[1]))
            totalDaysFree[bookPosition] += (presentDate-int(line[1]))

# Total Days Borrowed per Book
for names in personInfo:
    for book_names in personInfo[names]:
       temp = personInfo[names][book_names][0]+personInfo[names][book_names][2]
       #Checks fo Books not turned in
       #Only takes current date - date the book was taken out
       if personInfo[names][book_names][3] == 0:
           bookPosition = bookName.index(book_names)
           x = presentDate - personInfo[names][book_names][1]
           totalDaysBorrowed[bookPosition]+=x



#Borrowed vs Not Borrowed
print("\nBorrowed Ratio")
for names in bookName:
    bookPosition = bookName.index(names)
    print(totalDaysBorrowed[bookPosition], "days borrowed out of", totalDaysFree[bookPosition],":",str(names))

sortedUsagePerBook=[]
#Book Usage Percentage
print("\nUsage Ratio")
for names in bookName:
    bookPosition = bookName.index(names)
    usage = ((totalDaysBorrowed[bookPosition])/(float(totalDaysFree[bookPosition])))*100
    usagePerBook.append(usage)
    sortedUsagePerBook.append(usage)
    print(str(names),"usage: ", str(usage))
sortedUsagePerBook.sort(reverse = True)
print("\nSorted Usage Ratio")
for x in range(len(bookName)):
<<<<<<< HEAD
    sortedUsagePerBook = usagePerBook
    sortedUsagePerBook.sort(reverse = True)
    #usagePerBookLength = len(usagePerBook)
    for value in range(len(usagePerBook)):
        if ((sortedUsagePerBook[x])/(usagePerBook[value])) == 1:
            print(bookName[value],"With usage ", sortedUsagePerBook[value])



#Most 
#print(personBlacklist)
#print(personInfo)
#print(totalDaysBorrowed)
=======
    index = usagePerBook.index(sortedUsagePerBook[x])
    print(bookName[index],"with usage",sortedUsagePerBook[x])

#Fine List
print("\nRemaining Fines")
for names in personBlacklist:
    if personBlacklist[names][1]>0:
        print(str(names),"has a fine of", "$"+str(personBlacklist[names][1]))
    if personBlacklist[names][0]>3:
        print(str(names),"has more than 3 books taken out", "$"+str(personBlacklist[names][1]))
# Restrictions
for names in per
>>>>>>> 2edbb8104e28b3a5714563836194f5be5900b866











