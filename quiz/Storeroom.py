def storeroom(helium, fn_even, fn_odd):
    """
    >>> storeroom(1234, lambda x,y: x+y, lambda x,y: x*y)
    True
    >>> storeroom(1111111111112, lambda x,y: x+y, lambda x,y: x*y) #2 > 1 * 1 * ... * 1
    True
    >>> storeroom(1111111111112, lambda x,y: x+y, lambda x,y: x+y) #2 <= 1 + 1 + ... + 1
    False
    >>> storeroom(12, lambda x,y: x+y, lambda x,y: x*y) #2 > 1
    True
    >>> storeroom(12345, lambda x,y: x+y, lambda x,y: x*y) #4 + 2 <= 1 * 3 * 5
    False
    >>> storeroom(18383, lambda x,y: x-y, lambda x,y: x-y) # 8 - 8 > 3 - 3 - 1
    True
    """
    evens, odds = None, None
    while helium > 0:
        remainder, helium = helium % 10, helium//10
        if remainder % 2 == 0:  # even
            if evens == None:
                evens = remainder
            else:
                evens = fn_even(evens, remainder)
        else:  # odd
            if odds == None:
                odds = remainder
            else:
                odds = fn_odd(odds, remainder)
        # print("DEBUG:remainder={},evens={},odds={}".format(remainder,evens, odds))
    return evens > odds
