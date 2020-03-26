

protocol IOProvider {
  func input() -> String
  func output(_ str: String) -> Void
}

class StandardIOProvider: IOProvider {
  func input() -> String {
    return readLine()!
  }

  func output(_ str: String) -> Void {
    return print(str)
  }
}

class TestIOProvider: IOProvider {
  func input() -> String {
    return "6"
  }

  func output(_ str: String) -> Void {
    print(str)
  }
}

class FileIOProvider: IOProvider {
  func input() -> String {
    return ""
  }

  func output(_ str: String) -> Void {

  }
}

class Base {
  let io: IOProvider;

  init(_ provider: IOProvider) {
    io = provider
  }

  internal func read() -> String {
    return io.input()
  }

  internal func write(_ str: String) -> Void {
    io.output(str)
  }

  public func main() {}
}


class Program: Base {

  public override func main() {
    let input: String = self.read()
    let n:Int? = Int(input)

    if let m = n {
      let l1:[Int] = (1...m).map({ $0 % 6 + 1 })
      let match = { (x) -> [Int] in l1.filter{ $0 == x } }
      let l2:[Int] = (1...6).map({ match($0).count })

      let result:Bool = l2.allSatisfy({ $0 == l2[0] })

      self.write(result ? "Yes" : "No")
    }
  }
}


func main() -> Void {
  let provider = TestIOProvider()
  Program(provider).main()
}

main()