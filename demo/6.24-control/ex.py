from operator import floordiv, mod


def divide_exact(n, d=10):
    ''' 
    return the quotient and remainder of dividing n b d
    >>> q,r=divide_exact(2013,10)
    >>> q
    201
    >>> r
    3
    '''
    return floordiv(n, d), mod(n, d)

# q,r=divide_exact(2013,10)


def absolute_value(x):
    """
    return the absolute value of x
    """
    if x < 0:
        return -x
    elif x == 0:
        return 0
    else:
        return x
