
module IOProvider
  def input
    raise NotImplementedError.new
  end

  def output
    raise NotImplementedError.new
  end
end

class StandardIOProvider
  include IOProvider

  def input()
    return gets
  end

  def output(str)
    puts str
  end
end

class TestIOProvider
  include IOProvider

  def input()
    return '6'
  end

  def output(str)
    puts str
  end
end


class Base
  attr_accessor :read, :print

  def initialize(provider)
    @io = provider
  end

  def read()
    return @io.input
  end

  def print(str)
    puts @io.output(str)
  end
end


class Program < Base
  attr_accessor :main

  def main()
    n = self.read().chomp.to_i

    list = (1..n).map {|i| i % 6 + 1 }
    list = (1..6).map {|i| list.select {|j| j == i}.size }
    result = list.all? {|i| i == list.first}

    self.print result ? "Yes" : "No"
  end
end

def main()
  provider = TestIOProvider.new
  Program.new(provider).main
end

main()



