from abc import ABCMeta, abstractmethod

class IOProvider(metaclass=ABCMeta):
    @abstractmethod
    def input(self) -> str:
        pass
    @abstractmethod
    def output(self, s: str) -> None:
        pass

class StandardIOProvider(IOProvider):
    def input(self) -> str:
        return input()

    def output(self, s: str) -> None:
        print(s)

class TestIOProvider(IOProvider):
    def input(self) -> str:
        return "6"

    def output(self, s: str) -> None:
        print(s)

class Program:
    def __init__(self, provider: IOProvider):
        self.io = provider

    def read(self) -> str:
        return self.io.input()

    def write(self, s: str):
        self.io.output(s)

    def main(self) -> None:
        i = self.read()

        n = int(i)
        l1: list = [x % 6 + 1 for x in range(1, n + 1)]
        match = lambda x, l: list(filter(lambda y: y == x, l))
        l2: list = [len(match(x, l1)) for x in range(1, 7)]
        result: bool = all([ x == l2[0] for x in l2 ])

        self.write("Yes" if result else "No")


def main():
    provider = TestIOProvider()
    Program(provider).main()

if __name__ == '__main__':
    main()
