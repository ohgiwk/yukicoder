
n = gets.chomp.to_i
list = (1..n).map{|i|i % 6 + 1}
list = (1..6).map{|i| list.select{|j| j == i}.size }

puts list.all?{|i| i == list.first} ? "Yes" : "No"


