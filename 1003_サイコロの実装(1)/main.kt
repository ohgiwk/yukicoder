
fun main(): Unit {

  val input: String = "6"
  val n: Int = Integer.parseInt(input)
  val l: List<Int> = (1..n).map { it % 6 + 1 }
  val ll = (1..6).map { x -> l.filter { l -> x == l }.size }
  val result: Boolean = ll.all { it == ll[0] }
  print(if (result) "Yes" else "No")
}

