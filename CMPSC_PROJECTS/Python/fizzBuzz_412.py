n = int(input("Enter a number greater than 0: "))
def fizzBuzz(n: int) -> list[str]:
    answer = []
    while n != 0:
        if n % 5 == 0 and n % 3 == 0:
            answer.insert(0, "FizzBuzz")
        elif n % 3 == 0:
            answer.insert(0, "Fizz")
        elif n % 5 == 0:
            answer.insert(0, "Buzz")
        else:
            answer.insert(0, str(n))
        n -= 1
    return answer
print(fizzBuzz(n))