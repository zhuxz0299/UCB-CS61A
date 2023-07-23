def sculpture(ruler, k):
    """
    >>> sculpture(1234, 1)
    4
    >>> sculpture(32749, 2)
    79
    >>> sculpture(1917, 2)
    97
    >>> sculpture(32749, 18)
    32749
    """
    if k == 0 or ruler == 0:
        return 0
    a, b = ruler % 10, ruler//10
    return max(sculpture(b, k), sculpture(b, k-1)*10+a)
