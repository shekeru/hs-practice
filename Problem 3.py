def factor_list_gen(number):
    for factor in range(2, number + 1):
        if not number % factor:
            yield factor; yield from factor_list_gen(
                number // factor); break

def subint_gen(upper_bound):
    factors = {*factor_list_gen(upper_bound)}
    for number in range(2, upper_bound):
        if not factors & {*factor_list_gen(number)}:
            yield number

print([*subint_gen()])
