package main;

import java.util.Arrays;
import java.util.Scanner;
import java.util.stream.IntStream;


interface IOProvider {
  public String read();

  public void write(String s);
}


class StdIOProvider implements IOProvider {
  @Override
  public String read() {
    var scanner = new Scanner(System.in);
    String input = scanner.nextLine();
    scanner.close();
    return input;
  }

  @Override
  public void write(String s) {
    System.out.println(s);
  }
}


class TestIOProvider implements IOProvider {
  @Override
  public String read() {
    return "6";
  }

  @Override
  public void write(String s) {
    System.out.println(s);
  }
}


class Base {
  IOProvider io;

  public Base(IOProvider provider) {
    io = provider;
  }

  public String read() {
    return "6";
  }

  public void write(String s) {
    System.out.println(s);
  }
}


final class Program extends Base {

  public Program(IOProvider provider) {
    super(provider);
  }

  public void main() {
    String input = read();

    int n = Integer.parseInt(input);
    int[] l1 = IntStream.range(1, n + 1).map(x -> x % 6 + 1).toArray();
    int[] l2 = IntStream.range(1, 7).map(x -> (int) Arrays.stream(l1).filter(y -> x == y).count())
        .toArray();
    boolean result = Arrays.stream(l2).allMatch(x -> x == l2[0]);

    write(result ? "Yes" : "No");
  }
}


public class Main {
  public static void main(String[] args) {
    var provider = new TestIOProvider();
    new Program(provider).main();
  }
}
