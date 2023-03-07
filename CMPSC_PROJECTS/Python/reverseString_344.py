z = ["h","e","l","l","o"]

def reverseString(s: list[str]) -> None:
    """
    Do not return anything, modify s in-place instead.
    """
    s[:] = s[::-1]
print(f"Before reverse string: {z}")
reverseString(z)
print(f"After reverse string: {z}")