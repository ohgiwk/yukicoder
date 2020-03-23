defmodule Program do
  def main do
    input = IO.gets("")
    # input = "6"
    n = String.to_integer(input)
    l1 = 1..n |> Enum.map(&(rem(&1, 6) + 1))
    l2 = Enum.map(1..6, fn x -> Enum.filter(l1, fn y -> x == y end) |> length end)
    result = l2 |> Enum.all?(fn x -> x == List.first(l2) end)
    IO.puts(if result, do: "Yes", else: "No")
  end
end

Program.main()
