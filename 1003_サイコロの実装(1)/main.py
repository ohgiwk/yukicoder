
def main(i: str):
    n = int(i)
    l1: list = [x % 6 + 1 for x in range(1, n + 1)]
    match = lambda x, l: list(filter(lambda y: y == x, l))
    l2: list = [len(match(x, l1)) for x in range(1, 7)]
    result: bool = all([ x == l2[0] for x in l2 ])

    print("Yes" if result else "No")

if __name__ == '__main__':
    i: str = input()
    main(i)