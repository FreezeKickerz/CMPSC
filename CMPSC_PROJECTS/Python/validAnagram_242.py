s = input("Enter your first word: ")
t = input("Enter your second word: ")
def isAnagram(s: str, t: str) -> bool:
    dict = {}
    for char in s:
        if char in dict:
            dict[char] += 1
        else:
            dict[char] = 1
    for char in t:
        if char not in dict:
            return False
        else:
            dict[char] -= 1
    for values in dict.values():
        if values != 0:
            return False
    return True    

print(isAnagram(s,t))       