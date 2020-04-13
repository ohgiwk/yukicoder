
trait IOProvider {
  def read(): String
  def write(str: String): Unit
}


class StdIOProvider extends IOProvider {
  def read(): String = {
    return io.StdIn.readLine()
  }

  def write(str: String): Unit = {
    println(str)
  }
}

class TestIOProvider extends IOProvider {
  def read(): String = {
    return "6"
  }

  def write(str: String): Unit = {
    println(str)
  }
}


abstract class Base(provider: IOProvider) {
  val io: IOProvider = provider;

  def read(): String = {
    return io.read()
  }

  def write(str: String): Unit = {
    io.write(str)
  }

  def main(): Unit = {}
}


class Program(provider: IOProvider) extends Base(provider) {
  override def main(): Unit = {
    val input: String = this.read()

    val n: Int = input.toInt
    val l: List[Int] = (1 to n).toList.map(_ % 6 + 1)
    val l2: List[Int] = (1 to 6).toList.map(i => l.filter(j => i == j).size)
    val result: Boolean = l2.forall(_ == l2.head)

    this.write(if (result) "Yes" else "No")
  }
}


object Main {
  def main(args: Array[String]): Unit = {
    val provider = new TestIOProvider()
    new Program(provider).main()
  }
}
