

main:: IO()
main = do
  let input = "6"
  let n = read input::Int

  let l1 = map (\x -> x `mod` 6 + 1) [1..n]
  let l2 = map (\x -> length (filter (\n -> n == x) l1 )) [1..6]
  let result = all (\x -> x == head l2) l2

  print (if result then "Yes" else "No")
