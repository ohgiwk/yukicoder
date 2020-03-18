package main;

import java.util.Arrays;
import java.util.Scanner;
import java.util.stream.IntStream;

public class Main {

  public static void main(String[] args) {

    Scanner scanner = new Scanner(System.in);
    String input = scanner.nextLine();

    int n = Integer.parseInt(input);
    long[] l = IntStream.range(1, n + 1).map(x -> x % 6 + 1).toArray();
    l = IntStream.range(1, 7).map(x -> Arrays.stream(l).filter(y -> x == y).count()).toArray();

    boolean result = Arrays.stream(l).allMatch(x -> x == l[0]);
    System.out.println(result ? "Yes" : "No");
  }
}
