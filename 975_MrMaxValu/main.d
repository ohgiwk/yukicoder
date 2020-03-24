import std.stdio;
import std.algorithm : map, equal;
import std.range : iota;
import std.conv : to;
import std.array;
import std.algorithm.searching : minElement, maxElement;

void main()
{
  string input = "1 2 3 4";
  int[] l1 = map!(x => x.to!int)(input.split(" ")).array;
  int[] l2 = iota(minElement(l1), maxElement(l1) + 1, 1).array;

  writeln(l1.equal(l2) ? "Yes" : "No");
}
