boostInput = input("Please enter the boost times: ")
breakTime = int(input("Please enter wanted break time: "))
boostTimes = boostInput.split()
minuteTimes = []
possible = True
for x in boostTimes:
    if(x.endswith("pm")):
        x = x[:-2]
        y = x.split(":")
        time = 720 + (60*int(y[0])) + int(y[1])
        minuteTimes.append(time)
    else:
        x = x[:-2]
        y = x.split(":")
        time = (60*int(y[0])) + int(y[1])
        minuteTimes.append(time)
minuteTimes.sort()
for x in range(len(minuteTimes)-1):
    diff = minuteTimes[x+1]- minuteTimes[x]
    if(breakTime > diff):
        possible = False
if(possible):
    print("Break possible")
else:
    print("Break not possible")