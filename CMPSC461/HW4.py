x = [1,2,3,4,5,6,7,8,9]

def sum(lst):
    def sumHelper(lst, n):
        if len(lst) == 0:
            return n
        else: 
            return sumHelper(lst[1:], n + lst[0])
    return sumHelper(lst, 0)
print(sum(x))

def factorial(x):
    def factorial_helper(x, sum):
        if x== 1:
            return sum
        else:
            return factorial_helper(x-1, sum * x)
    return factorial_helper(x, 1)

print(factorial(9))    

