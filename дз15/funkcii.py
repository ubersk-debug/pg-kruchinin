import random

def random_list(a: int, b: int, length: int):
    sp = []
    for i in range(length):
        sp.append(random.randint(a, b))
    return sp

def freq(sp):
    d = {}
    for x in sp:
        if x in d:
            d[x] = d[x] + 1
        else:
            d[x] = 1
    return d

def stats(sp):
    s = sorted(sp)
    n = len(s)
    sred = sum(sp) / n
    if n % 2 == 1:
        med = s[n // 2]
    else:
        med = (s[n // 2 - 1] + s[n // 2]) / 2
    d = freq(sp)
    moda = max(d, key=d.get)
    return {
        'min': min(sp),
        'srednee': sred,
        'mediana': med,
        'moda': moda,
        'max': max(sp),
    }

random.seed(1)
xs = random_list(1, 5, 12)
print(xs)
print(freq(xs))
print(stats(xs))
print(freq([1, 2, 3, 1, 2, 2]))
