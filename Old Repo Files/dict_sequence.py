start = {
    'SKU-A': {'WH-A': 5, 'WH-F': 5, 'WH-B': 3},
    'SKU-B': {'WH-A': 8, 'WH-G': 5, 3: 7},
    'SKU-C': {'WH-E': 34, 'WH-B': '8', 3: 9},
}

def dict_seq(start):
    result = {}
    for k in start:
        for m in start[k]:
            result.setdefault(m, {});
            result[m][k] = start[k][m]
    return result

dict_seq(start)

def list_seq(lists):
    if not lists:
        return [[]]
    first, rest = lists[0], lists[1:]
    return [[x] + ys for x in first for ys in list_seq(rest)]

print(list_seq([[0,1], [0,1], [0,1]]))
def seqf(*vs):
    if not vs:
        return [[]]
    return [[x] + ys for x in range(vs[0]+1) for ys in seqf(*vs[1:])]
seqf(1,1,1)

def seqk(*vs):
    if not vs:
        yield []
        return
    for x in range(vs[0]+1):
        for sgen in seqk(*vs[1:]):
            var = [x]+sgen
            if sum(var) != xvs[-1]:
                yield var
for l in seqk(1,1,1):
    print('ret:',l)
