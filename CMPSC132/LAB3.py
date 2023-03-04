# LAB3
# REMINDER: The work in this assignment must be your own original work and must be completed alone.
# Don't forget to list any authorized forms of collaboration using a Collaboration Statement
# All functions should NOT contain any for/while loops or global variables. Use recursion, otherwise no credit will be given

def get_count(aList, item):
    '''
        >>> get_count([1,4,3.5,'1',3.5, 9, 1, 4, 2], 1)
        2
        >>> get_count([1,4,3.5,'1',3.5, 9, 4, 2], 3.5)  
        2
        >>> get_count([1,4,3.5,'1',3.5, 9, 4, 2], 9)   
        1
        >>> get_count([1,4,3.5,'1',3.5, 9, 4, 2], 'a') 
        0
    '''
    ## YOUR CODE STARTS HERE
    if len(aList) == 0:
        return 0
    elif aList[0] == item:
        return 1 + get_count(aList[1:],item)
    else:
        return get_count(aList[1:],item)


def replace(numList, old, new):
    '''
        >>> input_list = [1, 7, 5.6, 3, 2, 4, 1, 9]
        >>> replace(input_list, 1, 99.9)
        [99.9, 7, 5.6, 3, 2, 4, 99.9, 9]
        >>> input_list
        [1, 7, 5.6, 3, 2, 4, 1, 9]
        >>> replace([1,7, 5.6, 3, 2, 4, 1, 9], 5.6, 777) 
        [1, 7, 777, 3, 2, 4, 1, 9]
        >>> replace([1,7, 5.6, 3, 2, 4, 1, 9], 8, 99)    
        [1, 7, 5.6, 3, 2, 4, 1, 9]
    '''
    ## YOUR CODE STARTS HERE
    if len(numList) == 0:
        return []
    elif numList[0] == old:
        return [new] + replace(numList[1:], old, new)
    else:
        return [numList[0]] + replace(numList[1:],old,new)
    


def cut(aList):
    '''
        >>> cut([7, 4, 0])
        [7, 4, 0]
        >>> myList=[7, 4, -2, 1, 9]
        >>> cut(myList)   # Found(-2) Delete -2 and 1
        [7, 4, 9]
        >>> myList
        [7, 4, -2, 1, 9]
        >>> cut([-4, -7, -2, 1, 9]) # Found(-4) Delete -4, -7, -2 and 1
        [9]
        >>> cut([-3, -4, 5, -4, 1])  # Found(-3) Delete -3, -4 and 5. Found(-4) Delete -4 and 1
        []
        >>> cut([5, 7, -1, 6, -3, 1, 8, 785, 5, -2, 1, 0, 42]) # Found(-1) Delete -1. Found(-3) Delete -3, 1 and 8. Found(-2) Delete -2 and 0
        [5, 7, 6, 785, 5, 0, 42]
    '''
    ## YOUR CODE STARTS HERE
    if len(aList) == 0:
        return []
    elif aList[0] < 0:
        return cut(aList[abs(aList[0]):])
    else:
        return [aList[0]] + cut(aList[1:])


def neighbor(n):
    '''
        >>> neighbor(24680)
        24680
        >>> neighbor(2222466666678)
        24678
        >>> neighbor(0)
        0
        >>> neighbor(22224666666782)
        246782
        >>> neighbor(2222466666625)
        24625
    '''
    ## YOUR CODE STARTS HERE
    if n < 0:
        return n
    elif n <= 10:
        return n
    else:
        final_digit = n % 10
        n = n//10
    if final_digit != (neighbor(n)%10):
        return (neighbor(n)*10) + final_digit
    return neighbor(n)