def hailstone(num):
    if num == 1:
        return [num]
    elif num % 2 == 0:
        return [num] + hailstone(num//2)
    elif num % 2 != 0:
        return [num] + hailstone(3*num+1)