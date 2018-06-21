start = {
    'SKU-A': {'WH-A': 5, 'WH-F': 5, 'WH-B': 3},
    'SKU-B': {'WH-A': 8, 'WH-G': 5, 3: 7},
    'SKU-C': {'WH-E': 34, 'WH-B': '8', 3: 9},
}

def dict_seq(start):
    result = {}
    for k in start:
        for m in start[k]:
            result[m] = result.get(m, {});
            result[m][k] = start[k][m]
    return result

dict_seq(start)

def list_seq(lists):
    if not lists:
        return [[]]
    first, rest = lists[0], lists[1:]
    return [[x] + ys for x in first for ys in list_seq(rest)]

list_seq([[1,2,5],[3,4,3]])

for i in gen_primes():
    if len(i) > 50:
        break;
    print(i);

def gen_primes():
    D, q = {}, 2
    while True:
        if q not in D:
            yield q; D[q * q] = [q]
        else:
            for p in D[q]:
                D.setdefault(p + q, []).append(p)
            del D[q]
        q += 1
