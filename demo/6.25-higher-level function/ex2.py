def indentity(k):
    return k


def cube(k):
    return k**3


def summation(n, term):
    """
    Sum the first N terms of a sequence
    >>> summation(5,cube)
    225
    """
    total, k = 0, 1
    while k <= n:
        total, k = total+term(k), k+1
    return total


def sum_naturals(n):
    """
    Sum the fitst N natural numbers
    >>> sum_naturals(5)
    15
    """
    # total, k = 0, 1
    # while k <= n:
    #     total, k = total+k, k+1
    # return total
    return summation(n,indentity)


def sum_cubes(n):
    """
    Sum the first N cubes of natural numbers.
    >>> sum_cubes(5)
    225
    """
    # total, k = 0, 1
    # while k <= n:
    #     total, k = total+k**3, k+1
    # return total
    return summation(n,cube)
