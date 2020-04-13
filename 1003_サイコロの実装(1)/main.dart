import 'dart:io';

List<int> range(int stop, [int start = 0]) {
  return new List<int>.generate(stop, (i) => start + i);
}

abstract class IOProvider {
  String read();
  void write(String s);
}

class StdIOProvider implements IOProvider {
  String read() {
    return stdin.readLineSync();
  }

  void write(String s) {
    print(s);
  }
}

class TestIOProvider implements IOProvider {
  String read() {
    return "6";
  }

  void write(String s) {
    print(s);
  }
}

class Base {
  IOProvider io;

  Base(IOProvider provider) {
    this.io = provider;
  }

  String read() {
    return this.io.read();
  }

  void write(String s) {
    this.io.write(s);
  }
}

class Program extends Base {
  Program(IOProvider provider) : super(provider);

  void main() {
    final String input = read();

    final int n = int.parse(input);
    List<int> l = range(n, 1).map((int i) => i % 6 + 1).toList();
    l = range(6, 1).map((int i) => l.where((int j) => i == j).length).toList();
    bool result = l.every((int i) => i == l[0]);

    write(result ? "Yes" : "No");
  }
}

void main() {
  var provider = new TestIOProvider();
  new Program(provider).main();
}
