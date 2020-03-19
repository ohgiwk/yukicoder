
def input = System.in.text
// def input = "6"
def n = Integer.parseInt(input)
def l1 = (1..n).collect { it % 6 + 1 }
def l2 = (1..6).collect { x -> (l1.findAll {y -> x == y}).size() }
def result = l2.every { it == l2[0] }
println result ? "Yes" : "No"
