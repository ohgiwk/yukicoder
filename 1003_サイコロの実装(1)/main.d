import std.stdio;
import std.range : iota;
import std.algorithm : map, filter, all;
import std.conv;
import std.array;

private:
interface IOProvider
{
  string input();
  void output(string);
}

class StandardIOProvider : IOProvider
{
  string input()
  {
    return "";
  }

  void output(string str)
  {
    writeln(str);
  }
}

class TestIOProvider : IOProvider
{
  string input()
  {
    return "6";
  }

  void output(string str)
  {
    writeln(str);
  }
}

abstract class Base
{
  private IOProvider io;

  protected
  {
    string read()
    {
      return this.io.input();
    }

    void print(string str)
    {
      this.io.output(str);
    }
  }
  public
  {
    void main()
    {
    }
  }
}

final class Program : Base
{

public:
  this(IOProvider provider) nothrow
  {
    this.io = provider;
  }

  override void main()
  {
    const string input = this.read();
    const int n = input.to!int;

    int[] l1 = map!(x => x % 6 + 1)(iota(1, n + 1)).array;
    ulong[] l2 = map!(x => filter!(y => y == x)(l1).array.length)(iota(1, 7))
      .array;

    const bool result = all!(x => x == l2[0])(l2);

    this.print(result ? "Yes" : "No");
  }
}

void main() nothrow
{
  try
  {
    auto ioProvider = new TestIOProvider();
    new Program(ioProvider).main();
  }
  catch (Exception e)
  {
    return;
  }
}
