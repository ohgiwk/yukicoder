def main(i: str):
  l1 = sorted([int(x) for x in i.split(' ')])
  l2 = [x + 1 for x in range(min(l1) - 1, max(l1))]
  print('Yes' if l1 == l2 else 'No')

if __name__ == '__main__':
  i: str = input()
#   i = "30 31 32 33 34"
  main(i)