
interface IOProvider {
  fun input(): String
  fun output(s: String): Unit
}

class StdIOProvider : IOProvider {
  override fun input(): String {
    return ""
  }

  override fun output(s: String): Unit {
    print(s)
  }
}

class TestIOProvider : IOProvider {
  override fun input(): String {
    return "6"
  }

  override fun output(s: String): Unit {
    print(s)
  }
}

abstract class Base(provider: IOProvider) {
  val io = provider

  protected fun read(): String {
    return this.io.input()
  }

  protected fun write(str: String): Unit {
    this.io.output(str)
  }

  open fun main() {}
}

class Program(provider: IOProvider): Base(provider) {


  override fun main(): Unit {
    val input: String = this.read()

    val n: Int = Integer.parseInt(input)
    val l1: List<Int> = (1..n).map { it % 6 + 1 }
    val l2: List<Int> = (1..6).map { x -> l1.filter { l1 -> x == l1 }.size }
    val result: Boolean = l2.all { it == l2[0] }

    this.write(if (result) "Yes" else "No")
  }

}

fun main(): Unit {
  val provider = TestIOProvider()
  Program(provider).main()
}
