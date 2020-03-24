
import Data.List.Split

main::IO()
main = do
  let input = "1 2 3 4"
  let list1 = map (\x -> (read x :: Int)) (splitOn " " input)
  let list2 = [minimum list1..maximum list1]

  putStrLn (if list1 == list2 then "Yes" else "No")