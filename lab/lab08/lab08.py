def make_generators_generator(g):
    """Generates all the "sub"-generators of the generator returned by
    the generator function g.

    >>> def every_m_ints_to(n, m):
    ...     i = 0
    ...     while (i <= n):
    ...         yield i
    ...         i += m
    ...
    >>> def every_3_ints_to_10():
    ...     for item in every_m_ints_to(10, 3):
    ...         yield item
    ...
    >>> for gen in make_generators_generator(every_3_ints_to_10):
    ...     print("Next Generator:")
    ...     for item in gen:
    ...         print(item)
    ...
    Next Generator:
    0
    Next Generator:
    0
    3
    Next Generator:
    0
    3
    6
    Next Generator:
    0
    3
    6
    9
    """
    "*** YOUR CODE HERE ***"
    # version1
    # def gen(num):
    #     t=g()
    #     for _ in range(num):
    #         yield next(t)
    # for num in range(1,len(list(g()))+1):
    #     yield gen(num)

    # version2
    def gen(lst):
        yield from lst
    gen_lst=[]
    for elem in g():
        gen_lst.append(elem)
        yield gen(gen_lst)
