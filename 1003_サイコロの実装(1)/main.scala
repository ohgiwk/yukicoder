object Main {
  def main(args: Array[String]): Unit = {
    val input: String = io.stdIn.readLine().split()
    // val input: String = "6"
    val n: Int = input.toInt

    val l: List[Int] = (1 to n).toList.map(_ % 6 + 1)
    val l2: List[Int] = (1 to 6).toList.map(i => l.filter(j => i == j).size)

    val result: Boolean = l2.forall(_ == l2.head)

    println(if (result) "Yes" else "No")
  }
}
