import 'dart:io';

List<int> range(int stop, [int start = 0]) {
  return new List<int>.generate(stop, (i) => start + i + 1);
}

void main() {
  final String input = stdin.readLineSync();

  final int n = int.parse(input);
  List<int> l = range(n, 1).map((int i) => i % 6 + 1).toList();
  l = range(6, 1).map((int i) => l.where((int j) => i == j).length).toList();

  print(l.every((int i) => i == l[0]) ? "Yes" : "No");
}
