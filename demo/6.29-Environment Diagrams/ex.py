def trace1(fn):
    """
    Returns a verson of fn that first prints before it is called
    fn - a function of 1 argument
    """
    def traced(x):
        print('Calling {} on argument {}'.format(fn, x))
        return fn(x)
    return traced


def square(x):
    return x*x


def sum_square_up_to(n):
    total = 0
    for i in range(1, 1+n):
        total += square(i)
    return total


sum_square_up_to = trace1(sum_square_up_to)
