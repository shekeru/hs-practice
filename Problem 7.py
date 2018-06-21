def primes():
    D, q = {}, 2
    while True:
        if q not in D:
            yield q; D[q*q] = [q];
        else:
            for p in D[q]:
                D.setdefault(p+q, []).append(p)
            del D[q]
        q += 1

def take(xs,n):
    for x in xs():
        n -= 1
        if not n:
            return x

take(primes, 100)
