def divisors(n):
    return [1]+[i for i in range(2, n) if n % i == 0]
