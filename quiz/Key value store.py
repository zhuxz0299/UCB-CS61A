def lens(prev=lambda x: 0):
    """
    >>> put1 = lens()
    >>> get2, put2 = put1('cat', 'animal')
    >>> get3, put3 = put2('table', 'furniture')
    >>> get4, put4 = put3('cup', 'utensil')
    >>> get5, put5 = put4('thesis', 'paper')
    >>> get5('thesis')
    'paper'
    >>> get5('table')
    'furniture'
    >>> get5('cat')
    'animal'
    >>> get3('cup')
    0
    """
    def put(k, v):
        def get(k2):
            if k2 == k:
                return v
            else:
                return prev(k2)
        return get, lens(get)
    return put


# put1 = lens()
# get2, put2 = put1('cat', 'animal')
# get3, put3 = put2('table', 'furniture')
# get4, put4 = put3('cup', 'utensil')
# get5, put5 = put4('thesis', 'paper')