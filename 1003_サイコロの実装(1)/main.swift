
func main() {
  let input: String = readLine()!
  // let input:String = "6"
  let n:Int? = Int(input)

  if let m = n {
    var l:[Int] = (1...m).map({ $0 % 6 + 1 })
    let match = { (x) -> [Int] in l.filter{ $0 == x } }
    l = (1...6).map({ match($0).count })


    let result:Bool = l.allSatisfy({ $0 == l[0] })
    print(result ? "Yes" : "No")
  }
}

main()